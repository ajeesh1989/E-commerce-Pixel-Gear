class CategoryModel {
  CategoryModel({
    required this.name,
    required this.image,
    required this.id,
  });
  final String name;
  final String image;
  final String id;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"] ?? '',
        image: json["image"] ?? '',
        id: json["id"] ?? '',
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "id": id,
      };
}
