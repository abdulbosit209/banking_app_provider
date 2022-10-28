import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'transaction_expanses.g.dart';

@JsonSerializable()
class TransactionExpanses {

  @JsonKey(defaultValue: [], name: "data")
  List<Data> data;

  @JsonKey(defaultValue: "", name: "transfer_date")
  String transferDate;


  TransactionExpanses({
    required this.data,
    required this.transferDate,

  });

  factory TransactionExpanses.fromJson(Map<String, dynamic> json) => _$TransactionExpansesFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionExpansesToJson(this);
}
/*
{
        "transfer_date": "2022-08-10",
        "data": [
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
            {
                "transaction_code": 54456464,
                "date": "2022-08-10 12:18:33.933384",
                "expense_id": 5,
                "amount": 224000.0,
                "card_id": 2,
                "receiver": {
                    "brand_image": "https://logobank.uz:8005/media/logos_preview/korzinka-01.png",
                    "name": "Karzinka",
                    "location": "Chilonzor 2 "
                }
            }
        ]
    },
 */