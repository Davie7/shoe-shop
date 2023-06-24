import 'package:online_shop/utils/export.dart';

List<Sneakers> sneakersFromJson(String str) =>
    List<Sneakers>.from(json.decode(str).map((x) => Sneakers.fromJson(x)));

class Sneakers {
  Sneakers({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.oldPrice,
    required this.sizes,
    required this.price,
    required this.description,
    required this.title,
  });

  final String id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final String oldPrice;
  final List<dynamic> sizes;
  final String price;
  final String description;
  final String title;

  factory Sneakers.fromJson(Map<String, dynamic> json) => Sneakers(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        oldPrice: json["oldPrice"],
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
        price: json["price"],
        description: json["description"],
        title: json["title"],
      );
}







// class SneakerData {
//   String? id;
//   String? name;
//   String? category;
//   List<String>? imageUrl;
//   String? oldPrice;
//   List<Sizes>? sizes;
//   String? price;
//   String? description;
//   String? title;

//   SneakerData(
//       {this.id,
//       this.name,
//       this.category,
//       this.imageUrl,
//       this.oldPrice,
//       this.sizes,
//       this.price,
//       this.description,
//       this.title});

//   SneakerData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     category = json['category'];
//     imageUrl = json['imageUrl'].cast<String>();
//     oldPrice = json['oldPrice'];
//     if (json['sizes'] != null) {
//       sizes = <Sizes>[];
//       json['sizes'].forEach((v) {
//         sizes!.add(new Sizes.fromJson(v));
//       });
//     }
//     price = json['price'];
//     description = json['description'];
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['category'] = this.category;
//     data['imageUrl'] = this.imageUrl;
//     data['oldPrice'] = this.oldPrice;
//     if (this.sizes != null) {
//       data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
//     }
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['title'] = this.title;
//     return data;
//   }
// }

// class Sizes {
//   String? size;
//   bool? isSelected;

//   Sizes({this.size, this.isSelected});

//   Sizes.fromJson(Map<String, dynamic> json) {
//     size = json['size'];
//     isSelected = json['isSelected'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['size'] = this.size;
//     data['isSelected'] = this.isSelected;
//     return data;
//   }
// }