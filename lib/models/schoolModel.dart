import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:studybuddy/models/userModel.dart';

class School {
  late FirebaseFirestore db;
  late DocumentReference schoolReference;

  School(String schoolId){
    db = FirebaseFirestore.instance;
    schoolReference = db.collection("schools").doc(schoolId);
  }

  Future<Map<String, String?>> getSchoolData() async {
    Map<String, String?> schoolData = {
      'schoolAddress' : null,
      'schoolName' : null,
      'schoolContact' : null
    };
    DocumentSnapshot? document = await schoolReference.get();

    if (document != null){
      Map<String, dynamic> retrievedData = document.data() as Map<String, dynamic>;
      schoolData = {
        'schoolAddress' : retrievedData['school_addr'],
        'schoolName' : retrievedData['school_name'],
        'schoolContact' : retrievedData['school_contact']
      };
    }

    return schoolData;
  }

  Future<void> addUser(String userId, String userName, String userAddress, String userContact, String? userRole) async {
    Map<String, String> userData = <String, String>{
      'user_address': userAddress,
      'user_name' : userName,
      'user_contact' : userContact,
      'user_role': userRole ?? 'student'
    };

    DocumentReference newDocReference = schoolReference.collection("users").doc(userId);
    newDocReference.set(userData, SetOptions(merge: false));
  }

  Future<void> updateUser(String userId, String userName, String userAddress, String userContact) async {
    Map<String, String> userData = <String, String>{
      'user_address': userAddress,
      'user_name' : userName,
      'user_contact' : userContact,
    };

    DocumentReference newDocReference = schoolReference.collection("users").doc(userId);
    newDocReference.set(userData, SetOptions(merge: true));
  }
}

bool isValidSchool(String schoolId){
  FirebaseFirestore db = FirebaseFirestore.instance;
  DocumentReference? schoolReference = db.collection("schools").doc(schoolId);

  if (schoolReference != null){
    return true;
  } else {
    return false;
  }
}