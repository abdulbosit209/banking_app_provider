import 'package:json_annotation/json_annotation.dart';

part 'colors.g.dart';

@JsonSerializable(explicitToJson: true)
class Colors {

  @JsonKey(defaultValue: "", name: "color_a")
  String colorA;

  @JsonKey(defaultValue: "", name: "color_b")
  String colorB;


  Colors({
    required this.colorA,
    required this.colorB,
  });

  factory Colors.fromJson(Map<String, dynamic> json) => _$ColorsFromJson(json);
  Map<String, dynamic> toJson() => _$ColorsToJson(this);
}

/*
"color_a": "#3DD14A",
            "color_b": "#ECD416"
 */
