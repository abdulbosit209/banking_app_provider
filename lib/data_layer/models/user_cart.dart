import 'package:json_annotation/json_annotation.dart';

import 'colors.dart';

part 'user_cart.g.dart';

@JsonSerializable()
class UserCart {

  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "card_type")
  String cardType;

  @JsonKey(defaultValue: "", name: "card_number")
  String cardNumber;

  @JsonKey(defaultValue: "", name: "bank_name")
  String bankName;

  @JsonKey(defaultValue: 0.0, name: "money_amount")
  double moneyAmount;

  @JsonKey(defaultValue: "", name: "card_currency")
  String cardCurrency;

  @JsonKey(defaultValue: "", name: "expire_date")
  String expireDate;

  @JsonKey(defaultValue: "", name: "icon_image")
  String iconImage;

  @JsonKey(name: "colors")
  Colors colors;

  UserCart({
    required this.colors,
    required this.id,
    required this.bankName,
    required this.cardCurrency,
    required this.cardNumber,
    required this.cardType,
    required this.expireDate,
    required this.iconImage,
    required this.moneyAmount
  });

  factory UserCart.fromJson(Map<String, dynamic> json) => _$UserCartFromJson(json);
  Map<String, dynamic> toJson() => _$UserCartToJson(this);
}

/*
{
        "id": 1,
        "card_type": "VISA",
        "card_number": "1234 5678 9101 3456",
        "bank_name": "Hamkorbank",
        "money_amount": 1200000.0,
        "card_currency": "SO'M",
        "expire_date": "2024-08-28 12:18:33.933384",
        "icon_image": "https://assets.stickpng.com/images/58482363cef1014c0b5e49c1.png",
        "colors": {
            "color_a": "#3DD14A",
            "color_b": "#ECD416"
        }
    },
 */