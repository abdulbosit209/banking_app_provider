// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionInput _$TransactionInputFromJson(Map<String, dynamic> json) =>
    TransactionInput(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => DataIncome.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      transferDate: json['transfer_date'] as String? ?? '',
    );

Map<String, dynamic> _$TransactionInputToJson(TransactionInput instance) =>
    <String, dynamic>{
      'data': instance.data,
      'transfer_date': instance.transferDate,
    };
