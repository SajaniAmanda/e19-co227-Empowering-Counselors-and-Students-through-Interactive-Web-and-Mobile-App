import 'package:bloomi_web/utils/util_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AppointmentController {
  CollectionReference appointments =
      FirebaseFirestore.instance.collection('appointments');

  //------------------------ SAVE NOTE ------------------------
  Future<void> saveAppoinments(
    BuildContext context,
    String studentId,
    String counselorId,
    String studentName,
    String counselorName,
    String studentEmail,
    String studentFaculty,
    String date,
    String time,
    String status,
  ) async {
    try {
      String appointmentId = appointments.doc().id;

      return appointments.add({
        'id': appointmentId,
        'studentId': studentId,
        'counselorId': counselorId,
        'studentName': studentName,
        'counselorName': counselorName,
        'studentEmail': studentEmail,
        'studentFaculty': studentFaculty,
        'date': date,
        'time': time,
        'status': status,
      }).then((value) {
        UtilMethod.customDialogBox(
          context,
          "Success",
          "Appointment Send Successfully",
          onCancelPressed: () {},
          onOkPressed: () {},
        );
        // ignore: invalid_return_type_for_catch_error
      }).catchError((error) => Logger().e("Failed to add Appointment: $error"));
    } catch (e) {
      Logger().e(e);
    }
  }

  //------------------------ UPDATE APPOINTMENT STATUS ------------------------
  void updateAppointmentState(String uid, String newState) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('appointments')
          .where('counselorId', isEqualTo: uid)
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.update({'status': newState});
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //------------------------ GET APPOINTMENT ------------------------
  Stream<QuerySnapshot> getAppointment() => appointments.snapshots();

  Stream<QuerySnapshot> getCounselorAppointment(String currentUserId) =>
      appointments.where("uid", isEqualTo: currentUserId).snapshots();

  //-------------GET APPOINTMENT ACORDING TO UID-----------------
  Stream<QuerySnapshot> getAppointmentsByUid(String studentId) =>
      appointments.where('studentId', isEqualTo: studentId).snapshots();
}
