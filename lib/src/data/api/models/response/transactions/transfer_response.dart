class TransferRespone {
/*
{
  "id": 1,
  "fromAccountNo": "004704070000201",
  "toAccountNo": "009704070000049",
  "amount": "2000",
  "description": "3h37",
  "createdAt": "2022-12-16T03:38:34.99247+07:00",
  "modifiedAt": "0001-01-01T00:00:00"
}
*/

  String? id;
  String? fromAccountNo;
  String? toAccountNo;
  String? amount;
  String? description;
  String? createdAt;
  String? modifiedAt;

  TransferRespone({
    this.id,
    this.fromAccountNo,
    this.toAccountNo,
    this.amount,
    this.description,
    this.createdAt,
    this.modifiedAt,
  });
  TransferRespone.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    fromAccountNo = json['fromAccountNo']?.toString();
    toAccountNo = json['toAccountNo']?.toString();
    amount = json['amount']?.toString();
    description = json['description']?.toString();
    createdAt = json['createdAt']?.toString();
    modifiedAt = json['modifiedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['fromAccountNo'] = fromAccountNo;
    data['toAccountNo'] = toAccountNo;
    data['amount'] = amount;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['modifiedAt'] = modifiedAt;
    return data;
  }
}
