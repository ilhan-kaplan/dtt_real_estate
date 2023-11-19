import 'package:json_annotation/json_annotation.dart';

part 'EstateModel.g.dart';

@JsonSerializable()
class EstateModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "bedrooms")
  int bedrooms;
  @JsonKey(name: "bathrooms")
  int bathrooms;
  @JsonKey(name: "size")
  int size;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "zip")
  String zip;
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "latitude")
  int latitude;
  @JsonKey(name: "longitude")
  int longitude;
  @JsonKey(name: "createDate")
  dynamic createDate;

  EstateModel({
    required this.id,
    required this.image,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.size,
    required this.description,
    required this.zip,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.createDate,
  });

  factory EstateModel.fromJson(Map<String, dynamic> json) =>
      _$EstateModelFromJson(json);

  Map<String, dynamic> toJson() => _$EstateModelToJson(this);
}
