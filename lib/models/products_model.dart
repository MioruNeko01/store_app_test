import 'package:store_api_flutter_course/models/categories_model.dart';

class ProductsModel {
  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.categoryId,
  });

  final int? id;
  final String? title;
  final int? price;
  final String? description;
  final CategoriesModel? category;
  final List<dynamic> images;
  final int? categoryId;

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"] == null
          ? null
          : CategoriesModel.fromJson(json["category"]),
      images: json["images"] == null
          ? []
          : List<dynamic>.from(json["images"]!.map((x) => x)),
      categoryId: json["categoryId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category?.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "categoryId": categoryId,
      };

  static List<ProductsModel> productsFromSnapshot(List productSnapshot) {
    return productSnapshot.map((data) {
      return ProductsModel.fromJson(data);
    }).toList();
  }
}

class ImageClass {
  ImageClass();

  factory ImageClass.fromJson(Map<String, dynamic> json) {
    return ImageClass();
  }

  Map<String, dynamic> toJson() => {};
}
