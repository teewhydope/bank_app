import 'dart:convert';

import 'package:bank_app_test/domain/entities/transaction_list_entity.dart';

TransactionListModel welcomeFromJson(String str) =>
    TransactionListModel.fromJson(json.decode(str));

String welcomeToJson(TransactionListModel data) => json.encode(data.toJson());

class TransactionListModel {
  TransactionListModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<Datum> data;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      TransactionListModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum extends TransactionListEntity {
  Datum({
    required this.type,
    required this.amount,
    required this.phoneNumber,
    required this.created,
    this.balance,
  }) : super(
          type: type,
          amount: amount,
          phoneNumber: phoneNumber,
          created: created,
          balance: balance,
        );

  final Types? type;
  final int amount;
  final String phoneNumber;
  final DateTime created;
  final int? balance;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: typeValues.map[json["type"]],
        amount: json["amount"] == null ? 0 : json["amount"],
        phoneNumber: json["phoneNumber"],
        created: DateTime.parse(json["created"]),
        balance: json["balance"] == null ? 0 : json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "amount": amount,
        "phoneNumber": phoneNumber,
        "created": created.toIso8601String(),
        "balance": balance == null ? null : balance,
      };
}

enum Types { CREDIT, DEBIT }

final typeValues = EnumValues({"credit": Types.CREDIT, "debit": Types.DEBIT});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => new MapEntry(v, k));

    return reverseMap;
  }
}
