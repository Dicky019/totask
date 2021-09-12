import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:totask/app/data/models/task_model.dart';

class InputController extends GetxController {
  final Map? arg = Get.arguments;

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('user');
  final List<String> itemsPelajaran = [
    'KEAMANAN JARINGAN',
    'KNOWLEDGE MANAGEMENT',
    'ENGLISH FOR ACADEMIC PURPOSE',
    'KOMUNIKASI BISNIS',
    'PEMROGRAMAN VISUAL .NET',
    'SISTEM TERDISTRIBUSI',
    'STATISTIK (SPSS)',
    'DATA WAREHOUSE',
    'PRAKTIKUM VISUAL .NET',
    'METODE PENELITIAN',
    'ADMINISTRASI WEB',
    'ETIKA PROFESI'
  ];
  final List<String> itemsKelas = [
    'Kelas F',
    'Kelas G',
    'Kelas H',
    'Kelas I',
  ];
  final pelajaran = ''.obs;
  final kelas = ''.obs;
  final loading = false.obs;
  var catatan;
  late Document doc = Document()..insert(0, 'Catatan');
  late Rx<QuillController>? controller = Rx(QuillController(
      document: doc, selection: const TextSelection.collapsed(offset: 0)));
  late TextEditingController controllerTanggal =
      TextEditingController(text: '');
  final format = DateFormat("yyyy-MM-dd HH:mm");

  Future addTask() async {
    var catatantampil = controller!.value.document.toPlainText().toString();
    var catatan = jsonEncode(controller!.value.document.toDelta().toJson());

    loading.value = !loading.value;
    var namePelajaran = pelajaran.split(' ').map((e) {
      return e[0];
    }).join();

    final data = TaskModel(
            pelajaran: pelajaran.value == "" ? "Belum Diisi" : pelajaran.value,
            catatan: catatan == "" ? "Belum Diisi" : catatan,
            kelas: kelas.value == "" ? "Belum Diisi" : kelas.value,
            deadline: controllerTanggal.text == ""
                ? format.format(DateTime.now())
                : controllerTanggal.text,
            tampil: catatantampil == "" ? "Belum Diisi" : catatantampil,
            tampilPelajaran: namePelajaran,
            username: 'Dicky')
        .toJson();
    if (arg == null) {
      await collectionReference.add(data);
    } else {
      await collectionReference.doc(arg!['id']).update(data).whenComplete(() {Get.back();});
    }
    
  }

  @override
  void dispose() {
    controllerTanggal.dispose();
    controller!.value.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    if (arg == null) {
      print(null);
      pelajaran.value = itemsPelajaran.first;
      kelas.value = itemsKelas.first;
    } else {
      print('ada');
      controllerTanggal.text = arg!['deadline'];
      pelajaran.value = arg!['pelajaran'];
      kelas.value = arg!['kelas'];
      catatan = arg!['catatan'];
      doc = Document.fromJson(jsonDecode(catatan));
      controller!.value = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
