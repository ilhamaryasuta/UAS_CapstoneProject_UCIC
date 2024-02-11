import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectuas/Controller/pegawai.dart';
import 'package:projectuas/Model/modelpegawai.dart';
import 'package:projectuas/View/editpegawai.dart';
import 'package:projectuas/View/login.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:logger/logger.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  late CollectionReference _pegawai;
  late Query _karyawan;
  final Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    _pegawai = FirebaseFirestore.instance.collection("users");
    _karyawan = _pegawai.where("rool", isEqualTo: "karyawan");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Admin"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Managepgw()));
                },
                icon: const Icon(Icons.add)),
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
            child: Column(children: [
              SizedBox(
                  height: 500,
                  child: StreamBuilder(
                    stream: _karyawan.snapshots(),
                    builder: (context, AsyncSnapshot snapshots) {
                      if (snapshots.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.green),
                        );
                      }
                      if (snapshots.hasData) {
                        return ListView.builder(
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot records = snapshots.data!.docs[index];
                              return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Slidable(
                                    startActionPane: ActionPane(
                                      motion: const StretchMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {
                                            final pgw = UserModel(
                                              id: records.id,
                                              nama: records["nama"],
                                              posisi: records["posisi"],
                                              gajipokok: records["gajipokok"],
                                              uangmakan: records["uangmakan"],
                                              izin: records["izin"],
                                              rool: records["rool"],
                                            );
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) => Managepgw(
                                                          mpegawai: pgw,
                                                          index: index,
                                                        ))));
                                          },
                                          icon: Icons.edit_note,
                                          backgroundColor: Colors.yellowAccent,
                                        )
                                      ],
                                    ),
                                    endActionPane: ActionPane(
                                      motion: const StretchMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text('Konfirmasi'),
                                                  content: const Text('Apakah anda yakin ingin menghapus data karyawan ini?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                        Pegawai().hapusPegawai(UserModel(
                                                          id: records.id,
                                                          nama: null,
                                                          posisi: null,
                                                          gajipokok: null,
                                                          uangmakan: null,
                                                          izin: null,
                                                          rool: null,
                                                        ));
                                                      },
                                                      child: Text('Confirm'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text('Cancel'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: Icons.delete_outline,
                                          backgroundColor: Colors.redAccent,
                                        )
                                      ],
                                    ),
                                    child: ListTile(
                                      tileColor: Colors.blueAccent,
                                      title: Text(records["nama"]),
                                      subtitle: Text(records["posisi"]),
                                    ),
                                  ));
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.green),
                        );
                      }
                    },
                  ))
            ]),
          ),
        ));
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
