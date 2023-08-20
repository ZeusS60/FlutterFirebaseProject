import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_storage_app/firebase_ref/loading_status.dart';
import 'package:flutter_storage_app/firebase_ref/references.dart';
import 'package:flutter_storage_app/models/question_paper_model.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }
  final loadingStatus = LoadingStatus.loading.obs; //loadingStatus is obs
   
  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; //0
    
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json file and print path
   final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/paper") && path.contains(".json"))
        .toList();
        List<QuestionPaperModel> questionPapers = [];
        for(var paper in papersInAssets){
            String stringPaperContent =  await rootBundle.loadString(paper);
            questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
        }
        var batch = fireStore.batch();
        for(var paper in questionPapers){
          batch.set(questionPaperRF.doc(paper.id), {
            "title": paper.title,
    "image_url": paper.imageUrl ,
    "Description": paper.description,
    "time_seconds": paper.timeSeconds,
    "questions_count": paper.questions==null?0:paper.questions!.length
          }  );
          for(var questions in paper.questions!){
            final questionPath = questionRF(paperId: paper.id!, questionId: questions.id!);
            batch.set(questionPath, {
              "question": questions.question,
              "correct_answer": questions.correctAnswer
            });

            for(var answers in questions.answers!){
              batch.set(questionPath.collection("answers").doc(answers.identifier), {
                "identifier": answers.identifier,
                "Answer": answers.answer
              });

            }
          }
        }
        await batch.commit();
        loadingStatus.value = LoadingStatus.completed;
  }
}
