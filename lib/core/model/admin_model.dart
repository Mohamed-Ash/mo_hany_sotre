class AdminModel{
  final String adminId;

  AdminModel({required this.adminId});
  
  factory AdminModel.fromJson(Map<String,dynamic> json){
    return AdminModel(
      adminId: json['admin_id'],
    );
  }
  Map<String,dynamic> toJson() => {
    "admin_id":adminId
  };
}