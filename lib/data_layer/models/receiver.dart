import 'package:json_annotation/json_annotation.dart';

part 'receiver.g.dart';

@JsonSerializable(explicitToJson: true)
class Receiver {

  @JsonKey(defaultValue: "", name: "brand_image")
  String brandImage;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "location")
  String location;


  Receiver({
    required this.name,
    required this.brandImage,
    required this.location,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) => _$ReceiverFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiverToJson(this);
}

/*
                  "brand_image": "https://seeklogo.com/images/M/mcdonald-s-logo-2325D6C1EF-seeklogo.com.png",
                    "name": "McDonalds",
                    "location": "Yunusobod 4 kv "
 */
