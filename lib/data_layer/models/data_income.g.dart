// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataIncome _$DataIncomeFromJson(Map<String, dynamic> json) => DataIncome(
      incomeId: json['income_id'] as int? ?? 0,
      date: json['date'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      cardId: json['card_id'] as int? ?? 0,
      sender: Receiver.fromJson(json['sender'] as Map<String, dynamic>),
      transactionCode: json['transaction_code'] as int? ?? 0,
    );

Map<String, dynamic> _$DataIncomeToJson(DataIncome instance) =>
    <String, dynamic>{
      'transaction_code': instance.transactionCode,
      'income_id': instance.incomeId,
      'date': instance.date,
      'amount': instance.amount,
      'card_id': instance.cardId,
      'sender': instance.sender.toJson(),
    };
