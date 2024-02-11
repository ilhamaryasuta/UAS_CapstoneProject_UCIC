import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectuas/Component/mytextfield.dart';
import 'package:projectuas/View/login.dart';

class Karyawan extends StatefulWidget {
  final Map<String, dynamic> userData;
  const Karyawan({super.key, required this.userData});

  @override
  State<Karyawan> createState() => _KaryawanState();
}

class _KaryawanState extends State<Karyawan> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nama = TextEditingController();
  final TextEditingController posisi = TextEditingController();
  final TextEditingController gajipokok = TextEditingController();
  final TextEditingController uangmakan = TextEditingController();

  @override
  void initState() {
    debugPrint(widget.userData.toString());
    nama.text = widget.userData["nama"];
    posisi.text = widget.userData["posisi"];
    gajipokok.text = widget.userData["gajipokok"].toString();
    uangmakan.text = widget.userData["uangmakan"].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Karyawan"),
          actions: [
            IconButton(
              onPressed: () {
                logout(context);
              },
              icon: const Icon(
                Icons.logout,
              ),
            )
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                "Data Karyawan",
                style: TextStyle(fontSize: 28),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Mytextfield(labeltext: "NAMA", hintedtext: widget.userData["nama"], mycontroller: nama, allowEdit: false),
                        const SizedBox(height: 10),
                        Mytextfield(labeltext: "POSISI", hintedtext: widget.userData["posisi"], mycontroller: posisi, allowEdit: false),
                        const SizedBox(height: 10),
                        Mytextfield(labeltext: "GAJI POKOK", hintedtext: widget.userData["gajipokok"].toString(), mycontroller: gajipokok, allowEdit: false),
                        const SizedBox(height: 10),
                        Mytextfield(labeltext: "UANG MAKAN", hintedtext: widget.userData["uangmakan"].toString(), mycontroller: uangmakan, allowEdit: false),
                        const SizedBox(height: 10),
                      ],
                    ))),
          ],
        ))));
  }

  Future<void> logout(BuildContext context) async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    if (!context.mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
