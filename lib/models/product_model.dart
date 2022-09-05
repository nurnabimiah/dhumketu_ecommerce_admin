

import 'package:flutter/material.dart';

class ProductModel{
  String?id;
  String? name;
  String? category;
  num? price;
  String? imageName;
  String? imageDownloadUrl;
  String? description;
  bool isAvailable;

  ProductModel(
      {this.id,
        this.name,
        this.category,
        this.price,
        this.imageDownloadUrl,
        this.description,
        this.isAvailable = true,
        this.imageName});

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      'id':id,
      'name':name,
      'category': category,
      'price': price,
      'imageDownloadUrl': imageDownloadUrl,
      'description': description,
      'isAvailable' : isAvailable,
      'imageName': imageName,

    };
    return map;



  }


  factory ProductModel.fromMap(Map<String,dynamic> map) => ProductModel(

    id :map['id'],
    name: map['name'],
    category: map['category'],
    price: map['price'],
    imageDownloadUrl: map['imageDownloadUrl'],
    description: map['description'],
    isAvailable: map['isAvailable'],
    imageName: map['imageName'],
  );


}