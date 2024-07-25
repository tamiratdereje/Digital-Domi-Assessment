import 'package:digital_domi_assessment/constants/map_configs.dart';
import 'package:digital_domi_assessment/controllers/documents_view_controller.dart';
import 'package:digital_domi_assessment/controllers/home_view_controller.dart';
import 'package:digital_domi_assessment/screens/home_bottom_sheet.dart';
import 'package:digital_domi_assessment/widgets/buttons.dart';
import 'package:digital_domi_assessment/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends GetView<HomeViewController> {
  late GoogleMapController mapController;
  final String imageUrl = 'https://picsum.photos/seed/picsum/200/300';
  DocumentsViewController documentsViewController =
      Get.find<DocumentsViewController>();

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
                  zoom: MapConfig.defaultZoom,
                ),
                zoomControlsEnabled: false,
                markers: controller.markers.toSet(),
                polygons: controller.polygons.toSet(),
                onTap: (LatLng point) {
                  controller.handleTap(point);
                  showInviteDialog(context);
                },
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                top: 64,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircularIconButton(
                        icon: const Icon(
                          Icons.account_circle_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 40),
                      CustomInfoWindow(
                        title: "100 Addis Ababa",
                        imageUri: imageUrl,
                        onPressed: () {
                          documentsViewController.getDocumets();
                          showBottomSheet(context);
                        },
                      ),
                      const SizedBox(width: 40),
                      CircularIconButton(
                        icon: const Icon(
                          Icons.sms_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
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
      barrierColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      useSafeArea: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return HomeOverlay();
          },
        );
      },
    );
  }
}

Future<void> showInviteDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return const Dialog(
        insetPadding: EdgeInsets.all(16),
        alignment: Alignment.bottomCenter,
        backgroundColor: Colors.white,
        child: InviteCard(),
      );
    },
  );
}

class CustomInfoWindow extends StatelessWidget {
  final String title;
  final String imageUri;
  final VoidCallback onPressed;

  const CustomInfoWindow({
    super.key,
    required this.title,
    required this.imageUri,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageUri),
                radius: 23,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
