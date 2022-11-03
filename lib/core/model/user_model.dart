class UserModel {
  final String id;
  final String? email;
  final String? token;

  const UserModel({required this.id,this.email, this.token,});
  
  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      id: json['id'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String,dynamic> tojson()=>{
    "id":id,
    "email":email,
    "token":token,
  };
  
}