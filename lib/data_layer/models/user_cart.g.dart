// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCart _$UserCartFromJson(Map<String, dynamic> json) => UserCart(
      colors: Colors.fromJson(json['colors'] as Map<String, dynamic>),
      id: json['id'] as int? ?? 0,
      bankName: json['bank_name'] as String? ?? '',
      cardCurrency: json['card_currency'] as String? ?? '',
      cardNumber: json['card_number'] as String? ?? '',
      cardType: json['card_type'] as String? ?? '',
      expireDate: json['expire_date'] as String? ?? '',
      iconImage: json['icon_image'] as String? ?? '',
      moneyAmount: (json['money_amount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$UserCartToJson(UserCart instance) => <String, dynamic>{
      'id': instance.id,
      'card_type': instance.cardType,
      'card_number': instance.cardNumber,
      'bank_name': instance.bankName,
      'money_amount': instance.moneyAmount,
      'card_currency': instance.cardCurrency,
      'expire_date': instance.expireDate,
      'icon_image': instance.iconImage,
      'colors': instance.colors,
    };
