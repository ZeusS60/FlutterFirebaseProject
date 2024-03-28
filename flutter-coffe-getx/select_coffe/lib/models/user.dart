import 'package:firebase_auth/firebase_auth.dart';

class Userr {
 final String uid;

  Userr({required this.uid});

}

class UserData {

  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({ required this.uid, required this.sugars, required this.strength, required this.name});

  /*factory UserData.fromFirestore(Map<String, dynamic> firestore){
    return UserData(
      uid: firestore['uid'] ?? '',
      sugars: firestore['sugars'] ?? '0',
      strength: firestore['strength'] ?? '0',
      name: firestore['name'] ?? ''
      );
  } */

}