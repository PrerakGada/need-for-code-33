import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:studybuddy/models/schoolModel.dart';
import 'package:studybuddy/models/userModel.dart' as userModel;

Future<bool> needsRole(String schoolId, String minRole) async {
  String? currentUserEmail = await getCurrentUserEmail();
  if (currentUserEmail == null){
    return false;
  }

  if (minRole.toLowerCase() == "student"){
    return true;
  } else {
    String currentUserRole = await getCurrentUserRole(schoolId);

    if (currentUserRole == 'student'){
      return false;
    }

    if (minRole.toLowerCase() == 'admin'){
      return currentUserRole.toLowerCase() == minRole.toLowerCase();
    }

    return false;
  }
}

Future<String> getCurrentUserRole(String schoolId) async {
  String? currentEmail = await getCurrentUserEmail();

  if (currentEmail == null){
    return '';
  }
  userModel.User currentUser = School(schoolId).createUser(currentEmail);
  Map<String, String?> currentUserInfo = await currentUser.getUserInfo();
  String currentUserRole = currentUserInfo['userRole'] ?? 'student';
  return currentUserRole;
}

Future<bool> isValidSchool(String schoolId) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  DocumentReference? schoolReference = db.collection("schools").doc(schoolId);

  DocumentSnapshot? schoolSnapshot = await schoolReference.get();

  if (schoolSnapshot.exists) {
    return true;
  } else {
    return false;
  }
}

Future<String?> getCurrentUserEmail() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser = auth.currentUser;
  if (currentUser != null){
    return currentUser.email;
  } else {
    return null;
  }
}
