class VerifyOtpRespone {
/*
{
  "isValid": false,
  "sid": null,
  "errors": [
    "Wrong code. Try again."
  ]
}
*/

  bool? isValid;
  String? sid;
  List<String?>? errors;

  VerifyOtpRespone({
    this.isValid,
    this.sid,
    this.errors,
  });
  VerifyOtpRespone.fromJson(Map<String, dynamic> json) {
    isValid = json['isValid'];
    sid = json['sid']?.toString();
    if (json['errors'] != null) {
      final v = json['errors'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      errors = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isValid'] = isValid;
    data['sid'] = sid;
    if (errors != null) {
      final v = errors;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['errors'] = arr0;
    }
    return data;
  }
}
