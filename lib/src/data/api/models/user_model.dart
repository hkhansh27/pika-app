class UserModel {
  String? id;
  String? idCard;
  String? username;
  String? email;
  String? fullName;
  String? phone;
  String? accountNo;
  String? password;
  String? address;
  String? birthDay;
  String? city;
  String? issueDate;
  String? token;

  UserModel(
      {this.id,
      this.idCard,
      this.username,
      this.email,
      this.fullName,
      this.phone,
      this.accountNo,
      this.password,
      this.address,
      this.birthDay,
      this.city,
      this.issueDate,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    idCard = json['idCard']?.toString();
    username = json['username']?.toString();
    email = json['email']?.toString();
    fullName = json['fullName']?.toString();
    phone = json['phone']?.toString();
    accountNo = json['accountNo']?.toString();
    password = json['password']?.toString();
    address = json['address']?.toString();
    birthDay = json['birthDay']?.toString();
    city = json['city']?.toString();
    issueDate = json['issueDate']?.toString();
    token = json['token']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idCard'] = this.idCard;
    data['username'] = this.username;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['phone'] = this.phone;
    data['accountNo'] = this.accountNo;
    data['password'] = this.password;
    data['address'] = this.address;
    data['birthDay'] = this.birthDay;
    data['city'] = this.city;
    data['issueDate'] = this.issueDate;
    data['token'] = this.token;
    return data;
  }
}
