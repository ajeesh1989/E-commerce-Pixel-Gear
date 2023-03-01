class AllOrder {
  AllOrder({
    required this.id,
    required this.userid,
    required this.products,
    required this.paymentType,
    required this.paymentStatus,
    required this.orderStatus,
    required this.fullName,
    required this.phone,
    required this.pin,
    required this.state,
    required this.place,
    required this.address,
    required this.landMark,
    required this.orderDate,
    required this.deliveryDate,
    this.cancelDate,
    required this.totalPrice,
    required this.totalDiscount,
    required this.v,
  });

  final String id;
  final String userid;
  final List<ProductElement> products;
  final String paymentType;
  final bool paymentStatus;
  final String orderStatus;
  final String fullName;
  final String phone;
  final String pin;
  final String state;
  final String place;
  final String address;
  final String landMark;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final dynamic cancelDate;
  final int totalPrice;
  final int totalDiscount;
  final int v;

  factory AllOrder.fromJson(Map<String, dynamic> json) => AllOrder(
        id: json["_id"],
        userid: json["userid"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        paymentType: json["paymentType"],
        paymentStatus: json["paymentStatus"],
        orderStatus: json["orderStatus"],
        fullName: json["fullName"],
        phone: json["phone"],
        pin: json["pin"],
        state: json["state"],
        place: json["place"],
        address: json["address"],
        landMark: json["landMark"],
        orderDate: DateTime.parse(json["orderDate"]),
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        cancelDate: json["cancelDate"],
        totalPrice: json["totalPrice"],
        totalDiscount: json["totalDiscount"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userid": userid,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "paymentType": paymentType,
        "paymentStatus": paymentStatus,
        "orderStatus": orderStatus,
        "fullName": fullName,
        "phone": phone,
        "pin": pin,
        "state": state,
        "place": place,
        "address": address,
        "landMark": landMark,
        "orderDate": orderDate.toIso8601String(),
        "deliveryDate": deliveryDate.toIso8601String(),
        "cancelDate": cancelDate,
        "totalPrice": totalPrice,
        "totalDiscount": totalDiscount,
        "__v": v,
      };
}

class ProductElement {
  ProductElement({
    required this.product,
    required this.qty,
    required this.price,
    required this.discountPrice,
    required this.size,
    required this.id,
  });

  final ProductProduct product;
  final int qty;
  final int price;
  final int discountPrice;
  final String size;
  final String id;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductProduct.fromJson(json["product"]),
        qty: json["qty"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        size: json["size"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "qty": qty,
        "price": price,
        "discountPrice": discountPrice,
        "size": size,
        "_id": id,
      };
}

class ProductProduct {
  ProductProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.offer,
    required this.size,
    required this.image,
    required this.category,
    required this.rating,
    required this.description,
    required this.v,
  });

  final String id;
  final String name;
  final int price;
  final int discountPrice;
  final int offer;
  final List<String> size;
  final List<String> image;
  final String category;
  final String rating;
  final String description;
  final int v;

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        offer: json["offer"],
        size: List<String>.from(json["size"].map((x) => x)),
        image: List<String>.from(json["image"].map((x) => x)),
        category: json["category"],
        rating: json["rating"],
        description: json["description"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "discountPrice": discountPrice,
        "offer": offer,
        "size": List<dynamic>.from(size.map((x) => x)),
        "image": List<dynamic>.from(image.map((x) => x)),
        "category": category,
        "rating": rating,
        "description": description,
        "__v": v,
      };
}
