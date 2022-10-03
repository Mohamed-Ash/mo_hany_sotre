
class ProductModel {
  final int id;//category id
  final String name;
  final String image;
  final String region;
  final double price;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.region,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
      id: json['id'], 
      name: json['name'],
      image: json['image'], 
      region: json['region'], 
      price: json['price'], 
      createdAt: json['created_at'], 
      updatedAt: json['updated_at']
    );
  }

  Map<String,dynamic>toJson()=>{
    "id": id,
    "name":name,
    "image":image,
    "region":region,
    "price":price,
    "created_at":createdAt,
    "updated_at":updatedAt,
  };

}