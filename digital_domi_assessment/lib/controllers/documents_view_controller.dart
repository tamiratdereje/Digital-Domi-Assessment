// ignore_for_file: use_build_context_synchronously

import 'package:digital_domi_assessment/data/document_repository.dart';
import 'package:digital_domi_assessment/models/document.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentsViewController extends GetxController with StateMixin {
  final Rx<bool> isLoading = false.obs;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getDocumets();
  }

  DocumentRepository documentRepository = DocumentRepository();
  RxList<Document> documents = <Document>[].obs;

  Future<void> getDocumets() async {
    try {
      change(false, status: RxStatus.loading());
      await Future.delayed(const Duration(seconds: 2));
      List<Document> newDocuments = await documentRepository.getDocumets();
      documents(newDocuments);
      update();
      change(documents, status: RxStatus.success());
      update();
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      update();
    }
  }
}
