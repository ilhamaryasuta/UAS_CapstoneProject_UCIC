import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectuas/Model/modelpegawai.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("pegawai")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Pegawai has been added!", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green.withOpacity(0.1), colorText: Colors.green),
        )
        .catchError((error, stackStrace) {
      Get.snackbar("Error", "Something went wrong. Try Again", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent.withOpacity(0.1), colorText: Colors.red);
      debugPrint(error.toString());
    });
  }
}
