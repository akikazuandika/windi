// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

class DataModel {
  bool success;
  int count;
  List<Datum> data;

  DataModel({
    this.success,
    this.count,
    this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        success: json["success"],
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  int idProduct;
  String title;
  String description;
  String city;
  String province;
  String photo;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    this.idProduct,
    this.title,
    this.description,
    this.city,
    this.province,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idProduct: json["id_product"],
        title: json["title"],
        description: json["description"],
        city: json["city"],
        province: json["province"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
