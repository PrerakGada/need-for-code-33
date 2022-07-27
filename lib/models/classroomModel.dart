import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studybuddy/models/schoolModel.dart';
import 'package:studybuddy/models/utilModel.dart';

class Classroom {
  late FirebaseFirestore db;
  late DocumentReference classroomReference;
  late String schoolId;
  late String classroomId;

  Classroom(String schoolID, String classroomID) {
    schoolId = schoolID;
    classroomId = classroomID;
    db = FirebaseFirestore.instance;
    classroomReference = db
        .collection("schools")
        .doc(schoolId)
        .collection("classrooms")
        .doc(classroomID);
  }

  Future<List<dynamic>> getClassroomStudents() async {
    List<dynamic> studentList = [];
    DocumentSnapshot? document = await classroomReference.get();
    if (document.exists){
      studentList = document['students'];
    }
      return studentList;
  }

  Future<List<dynamic>> getClassroomTeachers() async {
    List<String> teacherList = [];
    DocumentSnapshot? document = await classroomReference.get();

    if (document.exists) {
      teacherList = document['teachers'];
    }

    return teacherList;
  }

  Future<List<dynamic>> getClassroomSubmissions() async {
    List<String> submissionList = [];
    DocumentSnapshot? document = await classroomReference.get();

    if (document.exists){

      submissionList = document['submissions'];
    }

    return submissionList;
  }

  Future<List<dynamic>>getPendingClassroomSubmissions(String userID) async {
    List<String> submissionList = [];

    CollectionReference submissions = classroomReference.collection('submissions');
    var pendingSubmissions = await (submissions.where("submission_incomplete_users", arrayContains: userID)).get();

    for (var doc in pendingSubmissions.docs) {
      submissionList.add(doc.id);
    }

    return submissionList;
  }

  Future<void> markSubmissionCompleted(String submissionId, String userId) async {
    bool hasSubmissionAlterPermission = await needsRole(schoolId, 'teacher');
    if (!hasSubmissionAlterPermission){
      return;
    }
    DocumentReference? submissionReference = classroomReference.collection("submissions").doc(submissionId);
    DocumentSnapshot? submissionSnapshot = await submissionReference.get();
    if (submissionSnapshot != null){
      List<dynamic> pendingSubmissionUsers = submissionSnapshot['submission_incomplete_users'];
      Set<dynamic> pendingSubmissionUsersSet = pendingSubmissionUsers.toSet();
      Set<String> newPendingSubmissions = {};
      pendingSubmissionUsersSet.forEach((user){
        if (user != userId){
          newPendingSubmissions.add(user);
        }
      });

      List<dynamic> completedSubmissionUsers = submissionSnapshot['submission_complete_users'];
      Set<dynamic> completedSubmissionUserSet = completedSubmissionUsers.toSet();
      completedSubmissionUserSet.add(userId);

      submissionReference.update({
        "submission_complete_users" : completedSubmissionUserSet,
        "submission_incomplete_users" : newPendingSubmissions
      });
    }
  }

  Future<void> markStudentAttendance(String userId, [bool present = true]) async {
    bool hasAttendanceModifyPermission = await needsRole(schoolId, 'teacher');
    if (!hasAttendanceModifyPermission){
      return;
    }

    CollectionReference attendanceReference = classroomReference.collection("attendance");
    final today = DateTime.now();
    final String ddmmyyyyString = "${today.day}-${today.month}-${today.year}";

    DocumentReference dayAttendanceRef = attendanceReference.doc(ddmmyyyyString);
    await dayAttendanceRef.update({});
    DocumentSnapshot dayAttendanceSnapshot = await dayAttendanceRef.get();

    if (!dayAttendanceSnapshot.exists){
      return;
    }

    List<dynamic> presentUserIds = dayAttendanceSnapshot['present_students'];
    List<dynamic> absentUserIds = dayAttendanceSnapshot['absent_students'];

    Set presentUserIdSet = {};
    Set absentUserIdSet = {};

    if (present == true){
      presentUserIdSet = presentUserIds.toSet();
      presentUserIdSet.add(userId);

      absentUserIds.forEach((user) {
        if (user != userId){
          absentUserIdSet.add(user);
        }
      });
    } else {
      absentUserIdSet = absentUserIds.toSet();
      absentUserIdSet.add(userId);

      presentUserIds.forEach((user) {
        if (user != userId){
          presentUserIdSet.add(user);
        }
      });
    }

    List newPresentUsers = presentUserIdSet.toList();
    List newAbsentUsers = absentUserIdSet.toList();

    Map<String, dynamic> updatedAttendanceData = {
      "present_students": newPresentUsers,
      "absent_students" : newAbsentUsers
    };

    CollectionReference attendanceCollection = classroomReference.collection("attendance");
    QuerySnapshot collectionSnapshot = await attendanceCollection.get();
    int userPresentCount = 0;
    int userAbsentCount = 0;
    collectionSnapshot.docs.forEach((day) async {
      DocumentReference dayDocument = attendanceCollection.doc(day.id);
      DocumentSnapshot daySnapshot = await dayDocument.get();

      List<dynamic> presentUserIds = daySnapshot['present_students'];
      List<dynamic> absentUserIds = daySnapshot['absent_students'];

      if(presentUserIds.contains(userId)){
        userPresentCount++;
      }
      if (absentUserIds.contains(userId)){
        userAbsentCount++;
      }
    });

    final int totalLectureCount = userPresentCount + userAbsentCount;
    final double userAttendance = (userPresentCount / totalLectureCount) *  100;
    final int userAttendancePercent = userAttendance as int;

    School currentSchool = getClassroomSchool();
    currentSchool.setUserAttendance(userId, classroomId, userAttendancePercent);

    await dayAttendanceRef.update(updatedAttendanceData);
  }

  School getClassroomSchool() {
    return School(schoolId);
  }
}
