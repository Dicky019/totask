import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final Map arg = Get.arguments;
  
  late Document doc = Document()..insert(0, 'Catatan');
  late Rx<QuillController>? controller = Rx(QuillController(
      document: doc, selection: const TextSelection.collapsed(offset: 0)));
  var catatan;
  late String deadline = '';
  late String jurusan = '';
  late String kelas = '';

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    jurusan = arg['pelajaran'];
    kelas = arg['kelas'];
    deadline = arg['deadline'];
    catatan = arg['catatan'];
    doc = Document.fromJson(jsonDecode(catatan));
    controller!.value = QuillController(
        document: doc, selection: const TextSelection.collapsed(offset: 0));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
