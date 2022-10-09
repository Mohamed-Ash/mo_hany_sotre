

class ShippingModel{
  final int? id; 
  final String? idDoc; ///document id
  final String name;
  final int colorPlatform;
  final int colorTextPlatform;
  final String image;
  final String region;
  final String price;
  final String platform;
  final String? type;
  final String? createdAt;
  final String? updatedAt;
  // sale ends

  ShippingModel({
    this.id,
    this.idDoc,
    required this.name,
    required this.image,
    required this.region,
    required this.price,
    required this.platform,
    required this.colorPlatform,
    required this.colorTextPlatform,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory ShippingModel.formJson(Map<String,dynamic>json){
    return ShippingModel(
      id: json['id'],
      idDoc: json['id_doc'],
      name: json['name'], 
      image: json['image'], 
      region: json['region'], 
      price: json['price'],
      platform: json['plat_form'],
      colorPlatform: json['color_plat_form'],
      colorTextPlatform: json['color_text_plat_form'],
      type: json['type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String,dynamic> toJson()=>{
    "id": id,
    "id_doc": idDoc,
    "color_text_plat_form":colorTextPlatform,
    "color_plat_form":colorPlatform,
    "name": name,
    "image": image,
    "region": region,
    "price": price,
    "plat_form": platform,
    "type": type,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
