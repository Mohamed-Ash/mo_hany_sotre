class MessageModel{
  final String text;
  final String timeNow;
  final String dateMessage;
  String? image;
  final String id;

  MessageModel({
    required this.text,
    required this.timeNow,
    required this.dateMessage,
    this.image,
    required this.id,
  });

  factory MessageModel.fromJson(Map<String,dynamic> json){
    return MessageModel(
      text:json['text'],
      timeNow: json['time_now'],
      dateMessage: json['date_message'],
      image: json['image'],
      id: json['id'],
    );
  }

  Map<String,dynamic> toJson()=> {
    'text':text,
    'time_now':timeNow,
    'date_message':dateMessage,
    'image':image,
    'id':id,
  };
}