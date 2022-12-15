class SendOtpRespone {
/*
{
  "isValid": true,
  "sid": "VEfec5d3d14e6ccfd231621cd8c42bc25b",
  "errors": null
}
*/

  bool? isValid;
  String? sid;
  String? errors;

  SendOtpRespone({
    this.isValid,
    this.sid,
    this.errors,
  });
  SendOtpRespone.fromJson(Map<String, dynamic> json) {
    isValid = json['isValid'];
    sid = json['sid']?.toString();
    errors = json['errors']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isValid'] = isValid;
    data['sid'] = sid;
    data['errors'] = errors;
    return data;
  }
}
