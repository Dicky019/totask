class TaskModel {
  String? nameUser;
  String? nameCategori;
  String? nameTask;
  String? catatan;
  String? deadline;

  TaskModel(
      {this.nameUser,
      this.nameCategori,
      this.nameTask,
      this.catatan,
      this.deadline});

  TaskModel.fromJson(Map<String, dynamic> json) {
    nameUser = json['nameUser'];
    nameCategori = json['nameCategori'];
    nameTask = json['nameTask'];
    catatan = json['catatan'];
    deadline = json['deadline'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nameUser'] = nameUser;
    data['nameCategori'] = nameCategori;
    data['nameTask'] = nameTask;
    data['catatan'] = catatan;
    data['deadline'] = deadline;
    return data;
  }

  
}


class ModeltoView {
  
  String  nameUser = "['nameUser']";
  String  nameCategori = "['nameCategori']";
  String  nameTask = "['nameTask']";
  String  catatan = "['catatan']";
  String  deadline = "['deadline']";
  
}