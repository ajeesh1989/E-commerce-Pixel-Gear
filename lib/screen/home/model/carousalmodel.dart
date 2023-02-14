class CarousalModel {
  CarousalModel({
    required this.image,
    required this.offer,
  });

  final String image;
  final String offer;

  factory CarousalModel.fromJson(Map<String, dynamic> json) => CarousalModel(
        image: json["image"],
        offer: json["offer"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "offer": offer,
      };
}
