import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:select_coffe/references/firebase_reference.dart';

import '../models/brew.dart';
import '../models/user.dart';

class DatabaseController extends GetxController{
 static DatabaseController instance = Get.find();

  final String? uid;
  DatabaseController({required this.uid});
  var brews = <Brew>[].obs;
  var selectedBrew = Rx<Brew?>(null);
  


  @override
  void onInit(){
    brews.bindStream(listenToBrews());
    super.onInit();
    getBrew();
  }


  Stream<List<Brew>> listenToBrews(){
    return 
    brewRF.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Brew.fromFirestore(doc.data())).toList();
    });
  }

  void setSelectedBrew(Brew? brew){
    selectedBrew.value = brew;
  }

  Future<Brew> getBrew() async{
   DocumentSnapshot documentSnapshot = await brewRF.doc(uid).get();

   if(documentSnapshot.exists){
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    return Brew(
      name: data['name'],
      sugars: data['sugars'],
      strength: data['strength']);
      
   }else{
   return Brew(name: 'Default', sugars: '0', strength: 100);
   }
  }


  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewRF.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength, 
    });
  }



  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data()! as Map<String, dynamic>;

    return UserData(
      uid: uid ?? '',
      sugars: data['sugars'],
      strength: data['strength'],
      name: data['name'],
      );
      
  }
  Stream<UserData> get userData {
    return brewRF.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
  }


  
}