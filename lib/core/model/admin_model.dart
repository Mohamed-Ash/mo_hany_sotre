class AdminModel{
  final String email;

  AdminModel({required this.email});
  
  factory AdminModel.fromJson(Map<String,dynamic> json){
    return AdminModel(
      email: json['email'],
    );
  }
  Map<String,dynamic> toJson() => {
    "email":email
  };
}