import 'package:cloud_firestore/cloud_firestore.dart';

class School {
  late FirebaseFirestore db;
  late DocumentReference schoolReference;

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

  Future<String> addUser(String userName, String userAddress,
      String userContact, String? userRole) async {
    Map<String, dynamic> userData = <String, dynamic>{
      'user_address': userAddress,
      'user_name': userName,
      'user_contact': userContact,
      'user_role': userRole ?? 'student'
    };

    final DocumentSnapshot newUserSnapshot = (await schoolReference
        .collection("users")
        .add(userData)) as DocumentSnapshot<Object?>;
    final String newUserID = newUserSnapshot.id;
    return newUserID;
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
