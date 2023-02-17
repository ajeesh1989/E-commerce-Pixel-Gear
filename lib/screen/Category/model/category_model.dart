import 'package:pixel_gear/screen/Home/model/categorymodel.dart';

class CategoryModel {
  String id;
  String name;
  String image;

  CategoryModel({required this.id, required this.image, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
