import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_firebase_admin/auth.dart';
import 'package:flutter/material.dart';
import 'package:projectuas/Model/modelpegawai.dart';
import 'package:projectuas/service_data.dart';

final CollectionReference _pegawai = FirebaseFirestore.instance.collection("users");

class Pegawai {
  //add data
  Future addPegawai(UserModel mpgw) async {
    debugPrint(mpgw.toJson().toString());
    final auth = ServiceData.auth!;
    try {
      UserRecord user = await auth.createUser(CreateRequest(
        email: mpgw.email,
        password: mpgw.password,
      ));
      debugPrint(user.uid);
      await _pegawai.doc(user.uid).set(mpgw.addData());
    } catch (e) {
      // Handle the error here
      debugPrint('Error creating user: $e');
    }
  }

  //update data
  Future updatePegawai(UserModel mpgw) async {
    await _pegawai.doc(mpgw.id).update(mpgw.addData());
  }

  //detele data
  Future hapusPegawai(UserModel mpgw) async {
    if (mpgw.id == null) return;
    final auth = ServiceData.auth!;
    try {
      await auth.deleteUser(mpgw.id!);
      await _pegawai.doc(mpgw.id).delete();
    } catch (e) {
      // Handle the error here
      debugPrint('Error deleting user: $e');
    }
  }

  Future updateEmail(String uid, String newEmail) async {
    final auth = ServiceData.auth!;
    UserRecord user = await auth.getUser(uid);
    debugPrint(user.email);
    debugPrint(user.uid);
    try {
      await auth.updateUser(user.uid, UpdateRequest(email: newEmail));
    } catch (e) {
      // Handle the error here
      debugPrint('Error updating email: $e');
    }
  }

  Future updatePassword(String uid, String newPassword) async {
    final auth = ServiceData.auth!;
    UserRecord user = await auth.getUser(uid);
    debugPrint(user.email);
    debugPrint(user.uid);
    try {
      await auth.updateUser(user.uid, UpdateRequest(password: newPassword));
    } catch (e) {
      // Handle the error here
      debugPrint('Error updating password: $e');
    }
  }
}
