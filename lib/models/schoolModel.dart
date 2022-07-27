import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studybuddy/models/userModel.dart' as userModel;
import 'package:studybuddy/models/utilModel.dart';

class School {
  late FirebaseFirestore db;
  late DocumentReference schoolReference;
  final FirebaseAuth authInstance = FirebaseAuth.instance;
  late String schoolID;

  School(String schoolId) {
    schoolID = schoolId;
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

    if (document.exists){
      schoolData = {
        'schoolAddress': document['school_addr'],
        'schoolName': document['school_name'],
        'schoolContact': document['school_contact']
      };
    }

    return schoolData;
  }

  userModel.User createUser(String userId){
    return userModel.User(schoolID, userId);
  }

  Future<void> signupUser(String userId,
      String userPassword, String userContact, String userAddress,
      String userName, String userRole) async {
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

  Future<bool> loginUser(String userId, String userPassword, String userRole) async {
    userModel.User candidateUser = createUser(userId);
    Map<String, String?> candidateInfo = await candidateUser.getUserInfo();
    String candidateRole = candidateInfo['userRole'] ?? 'student';
    candidateRole = candidateRole.toLowerCase();
    if (userRole.toLowerCase() != candidateRole){
      return false;
    }
    try {
      final credentials = await authInstance.signInWithEmailAndPassword(email: userId, password: userPassword);
    } on FirebaseAuthException catch (err){
      return false;
    }
    return true;
  }

  Future<void> approveUser(String userId) async {
    bool hasUserApprovePermission = await needsRole(schoolID, 'student');
    if (!hasUserApprovePermission){
      return;
    }

    DocumentReference? userDocReference = schoolReference.collection("pending_users").doc(userId);
    DocumentSnapshot userDocSnapshot = await userDocReference.get();

    if (!userDocSnapshot.exists){
      return;
    }

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
    await userReference.set(userData);
  }

  Future<void> setUserAttendance(String userId, int attendancePercent) async {
    DocumentReference userDocReference = schoolReference.collection('users').doc(userId);
    await userDocReference.update({
      'user_attendance' : attendancePercent
    });
  }

  Future<void> addUserToClassroom(String userId, String classroomId) async {
    DocumentReference classroomReference = schoolReference.collection("classrooms").doc(classroomId);
    DocumentSnapshot classroomSnapshot = await classroomReference.get();

    List<dynamic> classroomList = classroomSnapshot['classroom_students'];
    Set classroomSet = classroomList.toSet();

    List newClassroomList = classroomSet.toList();
    classroomReference.update({
      'classroom_students' : newClassroomList
    });

    DocumentReference userReference = schoolReference.collection("users").doc(userId);
    DocumentSnapshot userSnapshot = await userReference.get();

    List<dynamic> userClassroomList = userSnapshot['user_classrooms'];
    Set userClassroomSet = userClassroomList.toSet();
    userClassroomSet.add(userId);
    List newUserClassrooms = userClassroomSet.toList();
    await userReference.update({
      'user_classrooms': newUserClassrooms
    });
  }

  Future<List<Map<String, dynamic>>> getEvents() async {
    CollectionReference eventReference = schoolReference.collection("events");
    QuerySnapshot eventSnapshot = await eventReference.get();

    List<Map<String, dynamic>> eventList = [];

    eventSnapshot.docs.forEach((docSnapshot){
      Map<String, dynamic> preparedData = {
        'eventID'  : docSnapshot['id'],
        'startTime': docSnapshot['event_start_time'],
        'endTime'  : docSnapshot['event_end_time'],
        'subject'  : docSnapshot['event_subject'],
        'recurrenceRule' : docSnapshot['event_recurrence_rule']
      };
    });

    return eventList;
  }
}
