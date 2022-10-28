import 'package:json_annotation/json_annotation.dart';

part 'types_expanses.g.dart';

@JsonSerializable()
class TypesExpanses {

  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "expense_type")
  String expenseType;


  TypesExpanses({
    required this.id,
    required this.expenseType,

  });

  factory TypesExpanses.fromJson(Map<String, dynamic> json) => _$TypesExpansesFromJson(json);
  Map<String, dynamic> toJson() => _$TypesExpansesToJson(this);
}

/*
{
        "id": 1,
        "expense_type": "Oziq Ovqat"
    },
 */