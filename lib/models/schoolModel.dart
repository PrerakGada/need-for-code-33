import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class School {
  late FirebaseFirestore db;
  late DocumentReference schoolReference;
  final FirebaseAuth authInstance = FirebaseAuth.instance;

  School(String schoolId) {
    db = FirebaseFirestore.instance;
    schoolReference = db.collection("schools").doc(schoolId);
  }

  Future<Map<String, String?>> getSchoolData() async {
    Map<String, String?> schoolData = {
      'schoolAddress': null,
      'schoolName': null,
      'schoolContact': null
    };
    DocumentSnapshot? document = await schoolReference.get();

    if (document != null) {
      schoolData = {
        'schoolAddress': document['school_addr'],
        'schoolName': document['school_name'],
        'schoolContact': document['school_contact']
      };
    }

    return schoolData;
  }

  Future<void> signupUser(String userId,
      String userPassword, String userContact, String userAddress,
      String userName, [String userRole = 'student']) async {
      final credentials = await authInstance.createUserWithEmailAndPassword(email: userId, password: userPassword);
      DocumentReference? newUserDocReference = schoolReference.collection(
          "pending_users").doc(userId);
      await newUserDocReference.set({
        "user_name": userName,
        "user_contact": userContact,
        "user_address": userAddress,
        "user_role": userRole
      });
    }

  Future<void> loginUser(String userId, String userPassword) async {
    final credentials = await authInstance.signInWithEmailAndPassword(email: userId, password: userPassword);
  }

  Future<void> approveUser(String userId) async {
    DocumentReference? userDocReference = schoolReference.collection("pending_users").doc(userId);
    DocumentSnapshot userDocSnapshot = await userDocReference.get();

    DocumentReference? newUserDocReference = schoolReference.collection("users").doc(userId);
    await newUserDocReference.set({
      "user_name" : userDocSnapshot["user_name"],
      "user_contact" : userDocSnapshot["user_contact"],
      "user_address" : userDocSnapshot["user_address"],
      "user_role" : userDocSnapshot["user_role"]
    });

    await userDocReference.delete();
  }

  Future<void> updateUser(String userId, String userName, String userAddress,
      String userContact) async {
    final userData = {
      'user_address': userAddress,
      'user_name': userName,
      'user_contact': userContact,
    };

    DocumentReference userReference =
        schoolReference.collection("users").doc(userId);
    userReference.set(userData);
  }
}
