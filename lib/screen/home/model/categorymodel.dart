class CategoryModel {
  CategoryModel({
    required this.name,
    required this.image,
  });
  final String name;
  final String image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"] ?? '',
        image: json["image"] ?? '',
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
