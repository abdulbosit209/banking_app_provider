import 'package:json_annotation/json_annotation.dart';

part 'types_income.g.dart';

@JsonSerializable()
class TypesIncome {

  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "income_type")
  String incomeType;


  TypesIncome({
    required this.id,
    required this.incomeType,
  });

  factory TypesIncome.fromJson(Map<String, dynamic> json) => _$TypesIncomeFromJson(json);
  Map<String, dynamic> toJson() => _$TypesIncomeToJson(this);
}

/*
{
        "id": 1,
        "income_type": "Oylik maosh"
    },
 */