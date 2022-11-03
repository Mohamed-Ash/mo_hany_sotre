class NotifcationModel{
  final String title;
  final String body;
  final String? image;
  final String? id;

  NotifcationModel({
    required this.title,
    required this.body,
    required this.image,
    this.id,
  });
  factory NotifcationModel.fromJson(Map<String,dynamic> json){
    return NotifcationModel(
      title: json['title'], 
      body: json['body'], 
      image: json['image'],  
    );
  }
  Map<String,dynamic>tojson()=>{};
}