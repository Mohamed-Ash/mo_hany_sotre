class CategoriesModel{
  final int? id;
  final String idDoc;
  final String name;
  final String? image;
  final String type;
  final String? createdAt;
  final String? updatedAt;

  CategoriesModel({
    this.id,
    required this.idDoc,
    this.image,
    required this.name,
    required this.type,
    this.createdAt,
    this.updatedAt,  
  });


  factory CategoriesModel.fromJson(Map<String,dynamic> json){
    return CategoriesModel(
      idDoc: json['id_doc'],
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
    "id_doc":idDoc,
    'name': name,
    'image': image,
    'type': type,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}