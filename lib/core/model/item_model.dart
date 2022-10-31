class ItemModel{
  final String id;
  final String categoryId; 
  final int colorPlatform;
  final int colorRegion;
  final String name;
  final String image;
  final String region;
  final String platform;
  final double price;
  final double? offerPrice;
  final double? percent;
  final bool? isOffer;
  final String urlLauncher;
  final String? dateOffer;
  final String? createdAt;
  final String? updatedAt;
  final int? indexRate;
  // sale ends

  ItemModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.image,
    required this.region,
    required this.price,
    required this.platform,
    required this.colorPlatform,
    required this.colorRegion,
    required this.urlLauncher,
    this.offerPrice,
    this.percent,
    this.isOffer,
    this.dateOffer,
    this.createdAt,
    this.updatedAt,
    this.indexRate,
  });

  factory ItemModel.formJson(Map<String,dynamic>json){
    return ItemModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'], 
      image: json['image'], 
      region: json['region'], 
      price: json['price'],
      offerPrice: json['offer_price'],
      percent: json['percent'],
      platform: json['plat_form'],
      urlLauncher: json['url_launcher'],
      colorPlatform: json['color_plat_form'],
      colorRegion: json['color_text_plat_form'],
      isOffer: json['is_offer'],
      dateOffer: json['date_offer'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      indexRate: json['index_rate'],
    );
  }

  Map<String,dynamic> toJson()=>{
    "id": id,
    "category_id": categoryId,
    "color_text_plat_form":colorRegion,
    "color_plat_form":colorPlatform,
    "name": name,
    "image": image,
    "region": region,
    "price": price,
    "offer_price": offerPrice,
    "percent": percent,
    "plat_form": platform,
    "url_launcher":urlLauncher,
    "is_offer": isOffer,
    "date_offer": dateOffer,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "index_rate": indexRate,
  };
}
