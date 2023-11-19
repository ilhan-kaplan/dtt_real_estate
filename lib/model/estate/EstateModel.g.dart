// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EstateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstateModel _$EstateModelFromJson(Map<String, dynamic> json) => EstateModel(
      id: json['id'] as int,
      image: json['image'] as String,
      price: json['price'] as int,
      bedrooms: json['bedrooms'] as int,
      bathrooms: json['bathrooms'] as int,
      size: json['size'] as int,
      description: json['description'] as String,
      zip: json['zip'] as String,
      city: json['city'] as String,
      latitude: json['latitude'] as int,
      longitude: json['longitude'] as int,
      createDate: json['createDate'],
    );

Map<String, dynamic> _$EstateModelToJson(EstateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'price': instance.price,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'size': instance.size,
      'description': instance.description,
      'zip': instance.zip,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'createDate': instance.createDate,
    };
