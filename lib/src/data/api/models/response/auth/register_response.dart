class RegisterRespone {
/*
{
  "hdBankUserId": "c258cfba-f932-49d6-8252-47b18d63ea88",
  "fullName": "Huynh Huu Khanh",
  "username": "test6",
  "email": "test6@gmail.com",
  "identityNumber": "1234567899",
  "phone": "0382341512",
  "role": 0,
  "id": 3,
  "createdAt": "2022-12-09T22:32:12.501822+07:00",
  "modifiedAt": "0001-01-01T00:00:00"
}
*/

  String? hdBankUserId;
  String? fullName;
  String? username;
  String? email;
  String? identityNumber;
  String? phone;
  String? role;
  String? id;
  String? createdAt;
  String? modifiedAt;

  RegisterRespone({
    this.hdBankUserId,
    this.fullName,
    this.username,
    this.email,
    this.identityNumber,
    this.phone,
    this.role,
    this.id,
    this.createdAt,
    this.modifiedAt,
  });
  RegisterRespone.fromJson(Map<String, dynamic> json) {
    hdBankUserId = json['hdBankUserId']?.toString();
    fullName = json['fullName']?.toString();
    username = json['username']?.toString();
    email = json['email']?.toString();
    identityNumber = json['identityNumber']?.toString();
    phone = json['phone']?.toString();
    role = json['role']?.toString();
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
    data['role'] = role;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['modifiedAt'] = modifiedAt;
    return data;
  }
}
