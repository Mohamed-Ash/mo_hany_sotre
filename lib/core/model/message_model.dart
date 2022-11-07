class MessageModel{
  final String text;
  final String timeNow;
  final String dateMessage;
  final String id;

  MessageModel({
    required this.text,
    required this.timeNow,
    required this.dateMessage,
    required this.id,
  });

  factory MessageModel.fromJson(Map<String,dynamic> json){
    return MessageModel(
      text:json['text'],
      timeNow: json['time_now'],
      dateMessage: json['date_message'],
      id: json['id'],
    );
  }

  Map<String,dynamic> toJson()=> {
    'text':text,
    'time_now':timeNow,
    'date_message':dateMessage,
    'id':id,
  };
}