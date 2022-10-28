// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_expanses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypesExpanses _$TypesExpansesFromJson(Map<String, dynamic> json) =>
    TypesExpanses(
      id: json['id'] as int? ?? 0,
      expenseType: json['expense_type'] as String? ?? '',
    );

Map<String, dynamic> _$TypesExpansesToJson(TypesExpanses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expense_type': instance.expenseType,
    };
