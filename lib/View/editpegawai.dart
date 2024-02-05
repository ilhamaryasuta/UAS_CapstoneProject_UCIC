//import 'dart:ffi';

import 'package:projectuas/Component/mytextfield.dart';
import 'package:projectuas/Controller/pegawai.dart';
import 'package:projectuas/Model/modelpegawai.dart';
import 'package:flutter/material.dart';

class Managepgw extends StatefulWidget {
  final UserModel? mpegawai;
  final index;
  const Managepgw({super.key, this.mpegawai, this.index});
  @override
  State<Managepgw> createState() => _ManagepgwState();
}

class _ManagepgwState extends State<Managepgw> {
  final _form_key = GlobalKey<FormState>();

  bool iseditingmode = false;
  final TextEditingController id = TextEditingController();
  final TextEditingController nama = TextEditingController();
  final TextEditingController posisi = TextEditingController();
  final TextEditingController gajipokok = TextEditingController();
  final TextEditingController uangmakan = TextEditingController();
  final TextEditingController izin = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void initState() {
    if (widget.index != null) {
      iseditingmode = true;
      id.text = widget.mpegawai!.id!;
      nama.text = widget.mpegawai!.nama!;
      posisi.text = widget.mpegawai!.posisi!;
      gajipokok.text = widget.mpegawai!.gajipokok.toString();
      uangmakan.text = widget.mpegawai!.uangmakan.toString();
      izin.text = widget.mpegawai!.izin.toString();
    } else {
      iseditingmode = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: iseditingmode == true ? const Text("Edit Pegawai") : const Text("Tambah Pegawai"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: iseditingmode == true
                    ? const Text(
                        "Edit Pegawai",
                        style: TextStyle(fontSize: 28),
                      )
                    : const Text(
                        "Tambah Mahasiswa",
                        style: TextStyle(fontSize: 28),
                      ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                    key: _form_key,
                    child: Column(
                      children: [
                        Mytextfield(labeltext: "NAMA", hintedtext: "Isi Nama Pegawai", mycontroller: nama),
                        const SizedBox(height: 10),
                        Mytextfield(labeltext: "POSISI", hintedtext: "Isi Posisi Pegawai", mycontroller: posisi),
                        const SizedBox(height: 10),
                        Mytextfield(labeltext: "GAJI POKOK", hintedtext: "Isi Gaji Pokok Pegawai", mycontroller: gajipokok),
                        const SizedBox(height: 10),
                        Mytextfield(labeltext: "UANG MAKAN", hintedtext: "Isi Uang Makan Pegawai", mycontroller: uangmakan),
                        const SizedBox(height: 10),
                        Mytextfield(labeltext: "EMAIL", hintedtext: "Isi Email Pegawai", mycontroller: email),
                        const SizedBox(height: 10),
                        Mytextfield(labeltext: "PASSWORD", hintedtext: "Isi Password Pegawai", mycontroller: password),
                        const SizedBox(height: 10),
                      ],
                    )),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _form_key.currentState!.save();

                  if (iseditingmode == true) {
                    debugPrint('halo');
                    Pegawai().update_pegawai(UserModel(id: id.text, nama: nama.text, posisi: posisi.text, gajipokok: int.tryParse(gajipokok.text), uangmakan: int.tryParse(uangmakan.text), izin: int.tryParse(izin.text), rool: "karyawan"));
                  }
                  Navigator.pop(context);
                },
                child: iseditingmode == true ? const Text("Update") : const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
