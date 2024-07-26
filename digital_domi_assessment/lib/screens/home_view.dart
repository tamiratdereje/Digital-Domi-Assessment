// ignore_for_file: must_be_immutable

import 'package:digital_domi_assessment/constants/app_colors.dart';
import 'package:digital_domi_assessment/constants/app_strings.dart';
import 'package:digital_domi_assessment/constants/map_view_configs.dart';
import 'package:digital_domi_assessment/controllers/documents_view_controller.dart';
import 'package:digital_domi_assessment/controllers/home_view_controller.dart';
import 'package:digital_domi_assessment/screens/home_bottom_sheet.dart';
import 'package:digital_domi_assessment/widgets/app_bar_title_window.dart';
import 'package:digital_domi_assessment/widgets/circular_button.dart';
import 'package:digital_domi_assessment/widgets/invitation_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends GetView<HomeViewController> {
  late GoogleMapController mapController;
  DocumentsViewController documentsViewController = Get.find<DocumentsViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          debugPrint("markers: ${controller.markers}");
          return Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: controller.center.value,
                  zoom: MapViewConfig.defaultZoom,
                ),
                zoomControlsEnabled: false,
                markers: controller.markers.toSet(),
                polygons: controller.polygons.toSet(),
                onTap: (LatLng point) {
                  controller.handleTap(point);
                  showCurrentDialog(context);
                },
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                top: 64,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularButton(
                        icon: const Icon(
                          Icons.account_circle_outlined,
                          color: AppColors.white,
                        ),
                        onTap: () {},
                      ),
                      AppBarTitleWindow(
                        title: AppStrings.homePageTitle,
                        imageUri: controller.imageUrl,
                        onTap: () {
                          documentsViewController.getDocumets();
                          showBottomSheet(context);
                        },
                      ),
                      CircularButton(
                        icon: const Icon(
                          Icons.sms_outlined,
                          color: AppColors.white,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      barrierColor: AppColors.transparent,
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.black,
      useSafeArea: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return HomeBottomSheet();
          },
        );
      },
    );
  }
}

Future<void> showCurrentDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierColor: AppColors.transparent,
    builder: (BuildContext context) {
      return const Dialog(
        insetPadding: EdgeInsets.all(16),
        alignment: Alignment.bottomCenter,
        backgroundColor: AppColors.white,
        child: InvitationCard(),
      );
    },
  );
}
