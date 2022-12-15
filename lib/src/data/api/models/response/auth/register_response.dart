class RegisterResponeAccount {
/*
{
  "hdBankUserId": "6e12d916-999b-4cc6-a85f-f20b12cbf60b",
  "fullName": "Khanh Huynh Huu",
  "username": "test8",
  "email": "khanh201011@gmail.com",
  "identityNumber": "123456789",
  "phone": "03823441549",
  "accountNo": "009704070000028",
  "accountFriends": null,
  "sentFriendRequests": null,
  "receivedFriendRequests": null,
  "id": 1,
  "createdAt": "2022-12-14T22:54:39.56244+07:00",
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

  RegisterResponeAccount({
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
  RegisterResponeAccount.fromJson(Map<String, dynamic> json) {
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

class RegisterRespone {
/*
{
  "account": {
    "hdBankUserId": "6e12d916-999b-4cc6-a85f-f20b12cbf60b",
    "fullName": "Khanh Huynh Huu",
    "username": "test8",
    "email": "khanh201011@gmail.com",
    "identityNumber": "123456789",
    "phone": "03823441549",
    "accountNo": "009704070000028",
    "accountFriends": null,
    "sentFriendRequests": null,
    "receivedFriendRequests": null,
    "id": 1,
    "createdAt": "2022-12-14T22:54:39.56244+07:00",
    "modifiedAt": "0001-01-01T00:00:00"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwiZW1haWwiOiJraGFuaDIwMTAxMUBnbWFpbC5jb20iLCJuYmYiOjE2NzEwMzMyNzksImV4cCI6MTY3MTA3NjQ3OSwiaWF0IjoxNjcxMDMzMjc5fQ.6PpVW0_dvqJ9xglUBfvNHDGvl5WwgmIR8pZiBi1oX3Q"
}
*/

  RegisterResponeAccount? account;
  String? token;

  RegisterRespone({
    this.account,
    this.token,
  });
  RegisterRespone.fromJson(Map<String, dynamic> json) {
    account = (json['account'] != null) ? RegisterResponeAccount.fromJson(json['account']) : null;
    token = json['token']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (account != null) {
      data['account'] = account!.toJson();
    }
    data['token'] = token;
    return data;
  }
}
