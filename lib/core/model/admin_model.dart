class AdminModel{
  final String email;
  final String id;

  AdminModel({
    required this.email,
    required this.id
  });
  
  factory AdminModel.fromJson(Map<String,dynamic> json){
    return AdminModel(
      email: json['email'],
      id: json['id'],
    );
  }
  Map<String,dynamic> toJson() => {
    "email":email,
    "id":id,
  };
}