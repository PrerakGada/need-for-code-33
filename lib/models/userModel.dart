import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studybuddy/models/schoolModel.dart';

class User {
  late FirebaseFirestore db;
  late DocumentReference userReference;
  late String schoolId;

  User(String schoolID, String userId){
    schoolId = schoolID;
    db = FirebaseFirestore.instance;
    userReference = db.collection("schools").doc(schoolId).collection("users").doc(userId);
  }

  Future<Map<String, String?>> getUserInfo() async {
    Map<String, String?> userData = {
      'userAddress' : null,
      'userContact' : null,
      'userName' : null,
      'userRole' : null
    };

    DocumentSnapshot? document = await userReference.get();

    if (document.exists){
      userData = {
        'userAddress' : document['user_address'],
        'userName' : document['user_name'],
        'userContact' : document['user_contact'],
        'userRole' : document['user_role']
      };
    }

    return userData;
  }

  Future<List<String>> getUserClassrooms() async {
    List<String> userClassrooms = [];

    DocumentSnapshot? document = await userReference.get();

    if (document.exists){
      Map<String, dynamic> retrievedData = document.data() as Map<String, dynamic>;
      userClassrooms.addAll(retrievedData['user_classrooms']);
    }

    return userClassrooms;
  }

  School getUserSchool(){
    return School(schoolId);
  }
}