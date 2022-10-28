// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_expanses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionExpanses _$TransactionExpansesFromJson(Map<String, dynamic> json) =>
    TransactionExpanses(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      transferDate: json['transfer_date'] as String? ?? '',
    );

Map<String, dynamic> _$TransactionExpansesToJson(
        TransactionExpanses instance) =>
    <String, dynamic>{
      'data': instance.data,
      'transfer_date': instance.transferDate,
    };
