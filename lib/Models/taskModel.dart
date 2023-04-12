class TaskModel {
  String? category;
  String? uid;
  String? title;
  String? description;
  String? dateTime;

  TaskModel({
    this.uid,
    this.category,
    this.title,
    this.dateTime,
    this.description,
  });
  TaskModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    category = json['category'];
    title = json['title'];
    dateTime = json['dateTime'];
    description = json['description'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'category': category,
      'title': title,
      'dateTime': dateTime,
      'description': description,
    };
  }
}
