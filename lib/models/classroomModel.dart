import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studybuddy/models/schoolModel.dart';

class Classroom {
  late FirebaseFirestore db;
  late DocumentReference classroomReference;
  late String schoolId;

  Classroom(String schoolID, String classroomID) {
    schoolId = schoolID;
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
    if (document != null) {
      studentList = document['students'];
    }
      return studentList;
  }

  Future<List<dynamic>> getClassroomTeachers() async {
    List<String> teacherList = [];
    DocumentSnapshot? document = await classroomReference.get();

    if (document != null) {
      teacherList = document['teachers'];
    }

    return teacherList;
  }

  Future<List<dynamic>> getClassroomSubmissions() async {
    List<String> submissionList = [];
    DocumentSnapshot? document = await classroomReference.get();

    if (document != null){

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
    DocumentReference? submissionReference = classroomReference.collection("submissions").doc(submissionId);
    DocumentSnapshot? submissionSnapshot = await submissionReference.get();
    if (submissionSnapshot != null){
      Set<dynamic> pendingSubmissionUsersSet = {};
      List<dynamic> pendingSubmissionUsers = submissionSnapshot['submission_incomplete_users'];
      pendingSubmissionUsers.forEach((pendingUser){
        pendingSubmissionUsersSet.add(pendingUser);
      });
      Set<String> newPendingSubmissions = {};
      pendingSubmissionUsers.forEach((user){
        if (user != userId){
          newPendingSubmissions.add(user);
        }
      });

      List<dynamic> completedSubmissionUsers = submissionSnapshot['submission_complete_users'];
      Set<dynamic> completedSubmissionUserSet = {};
      completedSubmissionUsers.forEach((completedUser) {
        completedSubmissionUserSet.add(completedUser);
      });
      completedSubmissionUserSet.add(userId);

      submissionReference.update({
        "submission_complete_users" : completedSubmissionUserSet,
        "submission_incomplete_users" : newPendingSubmissions
      });
    }
  }

  School getClassroomSchool() {
    return School(schoolId);
  }
}
