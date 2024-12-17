import 'package:shopping/model/review.dart';

class Product {
  int? prd_id;
  String? prd_title;
  String? prd_description;
  double? prd_price;
  String? prd_thumbnail;
  // List<Review>? reviews;
  Product(
      {this.prd_id,
      this.prd_title,
      this.prd_description,
      this.prd_price,
      this.prd_thumbnail
      // this.reviews,
      });

  factory Product.fromJson(Map<String, dynamic>? json) => Product(
        prd_id: json?['prd_id'],
        prd_title: json?['prd_title'],
        prd_description: json?['prd_description'],
        prd_price: json?['prd_price'],
        prd_thumbnail: json?['prd_thumbnail'],
        // reviews:
        //     json?['reviews']?.map<Review>((e) => Review.fromJson(e)).toList(),
      );
}
