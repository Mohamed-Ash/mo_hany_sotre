class UserModel {
  final String id;
  final String? email;

  const UserModel({required this.id,this.email,});
  
  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      id: json['id'],
      email: json['email'],
    );
  }

  Map<String,dynamic> tojson()=>{
    "id":id,
    "email":email,
  };
  
}