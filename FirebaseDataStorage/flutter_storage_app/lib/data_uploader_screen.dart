import 'package:flutter/material.dart';
import 'package:flutter_storage_app/controllers/question_paper/data_uploader.dart';
import 'package:flutter_storage_app/firebase_ref/loading_status.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Obx(() => Text(controller.loadingStatus.value == LoadingStatus.completed? "Uploading completed" : "Uploading..."))
      ),
    );
  }
}