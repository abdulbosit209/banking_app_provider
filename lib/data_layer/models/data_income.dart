import 'package:banking_app/data_layer/models/receiver.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_income.g.dart';

@JsonSerializable(explicitToJson: true)
class DataIncome {

  @JsonKey(defaultValue: 0, name: "transaction_code")
  int transactionCode;

  @JsonKey(defaultValue: 0, name: "income_id")
  int incomeId;

  @JsonKey(defaultValue: "", name: "date")
  String date;

  @JsonKey(defaultValue: 0, name: "amount")
  double amount;

  @JsonKey(defaultValue: 0, name: "card_id")
  int cardId;

  @JsonKey( name: "sender")
  Receiver sender;


  DataIncome({
    required this.incomeId,
    required this.date,
    required this.amount,
    required this.cardId,
    required this.sender,
    required this.transactionCode
  });

  factory DataIncome.fromJson(Map<String, dynamic> json) => _$DataIncomeFromJson(json);
  Map<String, dynamic> toJson() => _$DataIncomeToJson(this);
}
/*
{
        "transfer_date": "2022-08-28",
        "data": [
            {
                "transaction_code": 9532165,
                "date": "2022-08-28 12:18:33.933384",
                "income_id": 1,
                "amount": 120000.0,
                "card_id": 2,
                "sender": {
                    "brand_image": "https://bankxizmatlari.uz/upload/iblock/c8b/yfeppobu1zsp8slqxqt9q78yhj9qqp0j/AgroBank_mini.png",
                    "name": "Xalq Bank",
                    "location": "Bektemir 12/23 "
                }
            },
            {
                "transaction_code": 5448764,
                "date": "2022-08-28 12:18:33.933384",
                "income_id": 6,
                "amount": 224000.0,
                "card_id": 3,
                "sender": {
                    "brand_image": "https://onmap.uz/blog/wp-content/uploads/2020/02/aab-1000x667.png",
                    "name": "Asia Alliance Bank",
                    "location": "Mirzo Ulug'bek 2-mkr "
                }
            }
        ]
    },
 */