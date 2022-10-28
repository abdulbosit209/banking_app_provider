// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypesIncome _$TypesIncomeFromJson(Map<String, dynamic> json) => TypesIncome(
      id: json['id'] as int? ?? 0,
      incomeType: json['income_type'] as String? ?? '',
    );

Map<String, dynamic> _$TypesIncomeToJson(TypesIncome instance) =>
    <String, dynamic>{
      'id': instance.id,
      'income_type': instance.incomeType,
    };
