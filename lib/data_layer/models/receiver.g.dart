// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receiver _$ReceiverFromJson(Map<String, dynamic> json) => Receiver(
      name: json['name'] as String? ?? '',
      brandImage: json['brand_image'] as String? ?? '',
      location: json['location'] as String? ?? '',
    );

Map<String, dynamic> _$ReceiverToJson(Receiver instance) => <String, dynamic>{
      'brand_image': instance.brandImage,
      'name': instance.name,
      'location': instance.location,
    };
