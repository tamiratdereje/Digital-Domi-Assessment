import 'package:digital_domi_assessment/constants/app_colors.dart';
import 'package:digital_domi_assessment/constants/app_strings.dart';
import 'package:digital_domi_assessment/controllers/documents_view_controller.dart';
import 'package:digital_domi_assessment/widgets/cards.dart';
import 'package:digital_domi_assessment/widgets/custom_container.dart';
import 'package:digital_domi_assessment/widgets/custom_image.dart';
import 'package:digital_domi_assessment/widgets/custom_text_fields.dart';
import 'package:digital_domi_assessment/widgets/loading_shimmer.dart';
import 'package:digital_domi_assessment/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBottomSheet extends GetView<DocumentsViewController> {
  HomeBottomSheet({super.key});

  final List<String> _images = [
    "https://picsum.photos/250",
    "https://picsum.photos/251",
    "https://picsum.photos/252",
    "https://picsum.photos/253",
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      minChildSize: 0.1,
      snapSizes: const [0.25, 0.5, 0.75, 1],
      builder: (_, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                width: 30.0,
                height: 3.0,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                child: CustomContainer(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.domiDocs,
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.white,
                            size: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _images
                            .map((e) => CustomImage(imageUrl: e))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                child: CustomContainer(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.domiDocs,
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.white,
                            size: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        hintText: AppStrings.searchHint,
                        textEditingController: controller.searchController,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      controller.obx(
                        (state) {
                          return Column(
                            children: [
                              for (var document in state.value)
                                FileItemTile(document: document),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          );
                      },
                        onLoading: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8.0), 
                              child: LoadingShimmer(
                                child: ShimmerCardUI(
                                    width: context.width,
                                    height: 60,
                                    circular: 10),
                              ),
                            );
                          },
                        ),
                        onError: (error) => Text(
                          error.toString(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
