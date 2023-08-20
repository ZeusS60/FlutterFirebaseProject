
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_storage_app/controllers/auth_controller.dart';
import 'package:flutter_storage_app/services/firebase_storage_service.dart';
import 'package:get/get.dart';

import '../../firebase_ref/references.dart';
import '../../models/question_paper_model.dart';

class QuestionPaperController extends GetxController{
  final allPaperImages = <String>[].obs;
  final allPapers =<QuestionPaperModel>[].obs;
  
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }  
  Future<void> getAllPapers()async{
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList();
      for(var paper in paperList){
      final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
      paper.imageUrl = imgUrl!;
     // allPaperImages.add(imgUrl!);
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper, bool tryAgain=false}){
    AuthController _authController = Get.find();
    if(_authController.isLoggedIn()){
      if (tryAgain) {
        Get.back();
        //Get.offNamed()
      } else {
        //Get.toNamed();
      }
    }else{
      print("${paper.title}");
      _authController.showLoginAlerDialogue();
    }
  }

}