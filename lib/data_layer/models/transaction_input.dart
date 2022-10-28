import 'package:json_annotation/json_annotation.dart';
import 'data_income.dart';

part 'transaction_input.g.dart';

@JsonSerializable()
class TransactionInput {

  @JsonKey(defaultValue: [], name: "data")
  List<DataIncome> data;

  @JsonKey(defaultValue: "", name: "transfer_date")
  String transferDate;


  TransactionInput({
    required this.data,
    required this.transferDate,

  });

  factory TransactionInput.fromJson(Map<String, dynamic> json) => _$TransactionInputFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionInputToJson(this);
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