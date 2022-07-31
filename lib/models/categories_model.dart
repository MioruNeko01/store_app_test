class CategoriesModel {
  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
  });

  final int? id;
  final String? name;
  final String? image;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };

  static List<CategoriesModel> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) {
      return CategoriesModel.fromJson(data);
    }).toList();
  }
}
