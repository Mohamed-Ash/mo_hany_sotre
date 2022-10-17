

class ItemModel{
  final int id; ///document id
  final int categoryId; ///document id
  final int colorPlatform;
  final int colorTextPlatform;
  final String name;
  final List<String>? nameArry;
  final String image;
  final String region;
  final String price;
  final String platform;
  final String? offerPrice;
  final bool? isOffer;
  // final String? timeOffer;
  final int? dayTimeOffer;
  final int? hourTimeOffer;
  final String? createdAt;
  final String? updatedAt;
  // sale ends

  ItemModel({
    required this.id,
    required this.categoryId,
    required this.name,
    this.nameArry,
    required this.image,
    required this.region,
    required this.price,
    required this.platform,
    required this.colorPlatform,
    required this.colorTextPlatform,
    this.offerPrice,
    this.isOffer,
    this.dayTimeOffer,
    this.hourTimeOffer,
    this.createdAt,
    this.updatedAt,
  });

  factory ItemModel.formJson(Map<String,dynamic>json){
    return ItemModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'], 
      image: json['image'], 
      nameArry : List<String>.from(json['name_arry']),
      region: json['region'], 
      price: json['price'],
      offerPrice: json['new_price'],
      platform: json['plat_form'],
      colorPlatform: json['color_plat_form'],
      colorTextPlatform: json['color_text_plat_form'],
      isOffer: json['is_offer'],
      dayTimeOffer: json['day_time_offer'],
      hourTimeOffer: json['hour_time_offer'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String,dynamic> toJson()=>{
    "id": id,
    "category_id": categoryId,
    "color_text_plat_form":colorTextPlatform,
    "color_plat_form":colorPlatform,
    "name": name,
    "name_arry": nameArry,
    "image": image,
    "region": region,
    "price": price,
    "new_price": offerPrice,
    "plat_form": platform,
    "is_offer": isOffer,
    "day_time_offer": dayTimeOffer,
    "hour_time_offer": hourTimeOffer,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
