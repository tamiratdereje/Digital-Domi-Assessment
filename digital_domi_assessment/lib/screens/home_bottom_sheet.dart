import 'package:digital_domi_assessment/controllers/documents_view_controller.dart';
import 'package:digital_domi_assessment/widgets/cards.dart';
import 'package:digital_domi_assessment/widgets/containers.dart';
import 'package:digital_domi_assessment/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeOverlay extends GetView<DocumentsViewController> {
  HomeOverlay({super.key});

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
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                child: AppContainer(
                    child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "dōmi in",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 16,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _images
                            .map((e) => CustomImage(imageUrl: e))
                            .toList()),
                  ],
                )),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                child: AppContainer(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "dōmi docs",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AppTextField(
                          hintText: "Search docs",
                          textEditingController: controller.searchController),
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
                              )
                            ],
                          );
                        },
                        onLoading: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                        onError: (error) => Text(
                          error.toString(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomImage extends StatelessWidget {
  final String imageUrl;
  const CustomImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: 76,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}
