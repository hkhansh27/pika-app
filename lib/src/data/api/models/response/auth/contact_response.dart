class ContactRespone {
/*
{
  "accountNo": "045704070000394",
  "fullName": "TÔ HOÀNG PHÚC"
}
*/

  String? accountNo;
  String? fullName;

  ContactRespone({
    this.accountNo,
    this.fullName,
  });
  ContactRespone.fromJson(Map<String, dynamic> json) {
    accountNo = json['accountNo']?.toString();
    fullName = json['fullName']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accountNo'] = accountNo;
    data['fullName'] = fullName;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactRespone &&
          runtimeType == other.runtimeType &&
          accountNo == other.accountNo &&
          fullName == other.fullName;

  @override
  int get hashCode => accountNo.hashCode ^ fullName.hashCode;
}
