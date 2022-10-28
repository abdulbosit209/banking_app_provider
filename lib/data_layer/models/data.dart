import 'package:banking_app/data_layer/models/receiver.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {

  @JsonKey(defaultValue: 0, name: "transaction_code")
  int transactionCode;

  @JsonKey(defaultValue: 0, name: "expense_id")
  int expenseId;

  @JsonKey(defaultValue: "", name: "date")
  String date;

  @JsonKey(defaultValue: 0, name: "amount")
  double amount;

  @JsonKey(defaultValue: 0, name: "card_id")
  int cardId;

  @JsonKey( name: "receiver")
  Receiver receiver;


  Data({
    required this.receiver,
    required this.date,
    required this.amount,
    required this.cardId,
    required this.expenseId,
    required this.transactionCode
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

/*
 {
                "transaction_code": 45656562,
                "date": "2022-08-10 12:19:33.933384",
                "expense_id": 1,
                "amount": 1200.0,
                "card_id": 5,
                "receiver": {
                    "brand_image": "https://seeklogo.com/images/M/mcdonald-s-logo-2325D6C1EF-seeklogo.com.png",
                    "name": "McDonalds",
                    "location": "Yunusobod 4 kv "
                }
            },

 */