

class UserModle {
  String id;
  String userName;
  String email;
  bool emailVerified;
  UserModle({required this.id,
    required this.userName,
    required this.email,
  this.emailVerified=false});

  UserModle.fromJason(Map<String,dynamic>json):this(
  id:json['id'],
  userName:json['userName'],
  email:json['email'],
  emailVerified:json['emailVerified']

  );

  Map<String,dynamic>toJson(){
    return{
      'id':id,
      'userName':userName,
      'email':email,
      'emailVerified':emailVerified
    };
  }
}
