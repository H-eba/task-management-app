class TaskModle {
  String? id;
  String? title;
  String? description;
  String?userId;
  int? data;
  bool isDone;

  TaskModle(
      {required this.title,
      required this.data,
        required this.userId,
        required this.description,
      this.id = '',
      this.isDone = false});

  TaskModle.fromJson(Map<String, dynamic> json) :this(
      title: json['title'],
      userId: json['userId'],
      data: json['data'],
      description: json['description'],
      id: json['id'],
      isDone: json['isDone']
  );

   Map<String,dynamic> toJason(){
    return {
      'title':title,
      'userId':userId,
      'data':data,
      'description':description,
      'id':id,
      'isDone':isDone
    };
  }
}
