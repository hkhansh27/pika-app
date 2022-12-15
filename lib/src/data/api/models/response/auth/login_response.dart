///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class LoginResponeAccount {
/*
{
  "hdBankUserId": "ec6d6936-cebe-497d-9e49-0ea06aef9d3f",
  "fullName": "Khanh Huynh Huu",
  "username": "test11",
  "email": "khanh20101@gmail.com",
  "identityNumber": "123456789",
  "phone": "03823441549",
  "accountNo": "004704070000193",
  "accountFriends": null,
  "sentFriendRequests": null,
  "receivedFriendRequests": null,
  "id": 3,
  "createdAt": "2022-12-15T01:25:23.141499",
  "modifiedAt": "0001-01-01T00:00:00"
}
*/

  String? hdBankUserId;
  String? fullName;
  String? username;
  String? email;
  String? identityNumber;
  String? phone;
  String? accountNo;
  String? accountFriends;
  String? sentFriendRequests;
  String? receivedFriendRequests;
  String? id;
  String? createdAt;
  String? modifiedAt;

  LoginResponeAccount({
    this.hdBankUserId,
    this.fullName,
    this.username,
    this.email,
    this.identityNumber,
    this.phone,
    this.accountNo,
    this.accountFriends,
    this.sentFriendRequests,
    this.receivedFriendRequests,
    this.id,
    this.createdAt,
    this.modifiedAt,
  });
  LoginResponeAccount.fromJson(Map<String, dynamic> json) {
    hdBankUserId = json['hdBankUserId']?.toString();
    fullName = json['fullName']?.toString();
    username = json['username']?.toString();
    email = json['email']?.toString();
    identityNumber = json['identityNumber']?.toString();
    phone = json['phone']?.toString();
    accountNo = json['accountNo']?.toString();
    accountFriends = json['accountFriends']?.toString();
    sentFriendRequests = json['sentFriendRequests']?.toString();
    receivedFriendRequests = json['receivedFriendRequests']?.toString();
    id = json['id']?.toString();
    createdAt = json['createdAt']?.toString();
    modifiedAt = json['modifiedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hdBankUserId'] = hdBankUserId;
    data['fullName'] = fullName;
    data['username'] = username;
    data['email'] = email;
    data['identityNumber'] = identityNumber;
    data['phone'] = phone;
    data['accountNo'] = accountNo;
    data['accountFriends'] = accountFriends;
    data['sentFriendRequests'] = sentFriendRequests;
    data['receivedFriendRequests'] = receivedFriendRequests;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['modifiedAt'] = modifiedAt;
    return data;
  }
}

class LoginRespone {
/*
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIzIiwiZW1haWwiOiJraGFuaDIwMTAxQGdtYWlsLmNvbSIsIm5iZiI6MTY3MTA4NDE1NCwiZXhwIjoxNjcxMTI3MzU0LCJpYXQiOjE2NzEwODQxNTR9.99YY9Pj_ogK2D9NmZRB6X0-dTtgRNq17eMNrNyrP9rg",
  "account": {
    "hdBankUserId": "ec6d6936-cebe-497d-9e49-0ea06aef9d3f",
    "fullName": "Khanh Huynh Huu",
    "username": "test11",
    "email": "khanh20101@gmail.com",
    "identityNumber": "123456789",
    "phone": "03823441549",
    "accountNo": "004704070000193",
    "accountFriends": null,
    "sentFriendRequests": null,
    "receivedFriendRequests": null,
    "id": 3,
    "createdAt": "2022-12-15T01:25:23.141499",
    "modifiedAt": "0001-01-01T00:00:00"
  }
}
*/

  String? accessToken;
  LoginResponeAccount? account;

  LoginRespone({
    this.accessToken,
    this.account,
  });
  LoginRespone.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken']?.toString();
    account = (json['account'] != null) ? LoginResponeAccount.fromJson(json['account']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    if (account != null) {
      data['account'] = account!.toJson();
    }
    return data;
  }
}