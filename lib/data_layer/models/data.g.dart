// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      receiver: Receiver.fromJson(json['receiver'] as Map<String, dynamic>),
      date: json['date'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      cardId: json['card_id'] as int? ?? 0,
      expenseId: json['expense_id'] as int? ?? 0,
      transactionCode: json['transaction_code'] as int? ?? 0,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'transaction_code': instance.transactionCode,
      'expense_id': instance.expenseId,
      'date': instance.date,
      'amount': instance.amount,
      'card_id': instance.cardId,
      'receiver': instance.receiver.toJson(),
    };
