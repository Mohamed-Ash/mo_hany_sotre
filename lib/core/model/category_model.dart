// ignore_for_file: avoid_print

class CategoryModel{
  final String id;
  final String name;
  final String? image;
  final String type;
  final String? createdAt;
  final String? updatedAt;

  CategoryModel({
    required this.id,
    this.image,
    required this.name,
    required this.type,
    this.createdAt,
    this.updatedAt,  
  });


  factory CategoryModel.fromJson(Map<String,dynamic> json){
    print(json);
    return CategoryModel(
      id: json['id'],
      image: json['image'], 
      name: json['name'], 
      type: json['type'], 
      createdAt: json['created_at'], 
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() =>{
    'id' : id,
    'name': name,
    'image': image,
    'type': type,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}