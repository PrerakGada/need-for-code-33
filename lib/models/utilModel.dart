import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> isValidSchool(String schoolId) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  DocumentReference? schoolReference = db.collection("schools").doc(schoolId);

  DocumentSnapshot? schoolSnapshot = await schoolReference.get();

  print(schoolSnapshot.exists);
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
