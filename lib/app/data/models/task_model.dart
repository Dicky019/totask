import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String? username;
  String? pelajaran;
  String? kelas;
  String? catatan;
  String? deadline;
  String? tampil;
  String? tampilPelajaran;

  TaskModel(
      {this.username,
      this.pelajaran,
      this.kelas,
      this.catatan,
      this.deadline,
      this.tampil,
      this.tampilPelajaran,});

  TaskModel.fromJson(DocumentSnapshot<Object?> json) {
    username = json['username'];
    pelajaran = json['pelajaran'];
    kelas = json['kelas'];
    catatan = json['catatan'];
    deadline = json['deadline'];
    tampil = json['tampil'];
    tampilPelajaran = json['tampilPelajaran'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['pelajaran'] = pelajaran;
    data['kelas'] = kelas;
    data['catatan'] = catatan;
    data['deadline'] = deadline;
    data['tampil'] = tampil;
    data['tampilPelajaran'] = tampilPelajaran;
    return data;
  } 
}
