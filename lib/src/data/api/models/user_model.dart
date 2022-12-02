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

  UserModel({
    this.id,
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
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCard = json['idCard'];
    username = json['username'];
    email = json['email'];
    fullName = json['fullName'];
    phone = json['phone'];
    accountNo = json['accountNo'];
    password = json['password'];
    address = json['address'];
    birthDay = json['birthDay'];
    city = json['city'];
    issueDate = json['issueDate'];
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

    return data;
  }
}
