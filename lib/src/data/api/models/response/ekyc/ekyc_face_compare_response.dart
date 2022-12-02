class FaceCompareResponseObject {
/*
{
  "result": "Khuôn mặt khớp 96.07500000000002%",
  "msg": "MATCH",
  "prob": 96.07500000000002,
  "match_warning": "no",
  "multiple_faces": false
}
*/

  String? result;
  String? msg;
  double? prob;
  String? matchWarning;
  bool? multipleFaces;

  FaceCompareResponseObject({
    this.result,
    this.msg,
    this.prob,
    this.matchWarning,
    this.multipleFaces,
  });
  FaceCompareResponseObject.fromJson(Map<String, dynamic> json) {
    result = json['result']?.toString();
    msg = json['msg']?.toString();
    prob = json['prob']?.toDouble();
    matchWarning = json['match_warning']?.toString();
    multipleFaces = json['multiple_faces'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['result'] = result;
    data['msg'] = msg;
    data['prob'] = prob;
    data['match_warning'] = matchWarning;
    data['multiple_faces'] = multipleFaces;
    return data;
  }
}

class FaceCompareResponseImgs {
/*
{
  "img_face": "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_a83714ac-722d-11ed-aaa4-9f59924f7bf4",
  "img_front": "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_bf76f7f3-7223-11ed-bad5-c9bc5fc1643e"
}
*/

  String? imgFace;
  String? imgFront;

  FaceCompareResponseImgs({
    this.imgFace,
    this.imgFront,
  });
  FaceCompareResponseImgs.fromJson(Map<String, dynamic> json) {
    imgFace = json['img_face']?.toString();
    imgFront = json['img_front']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['img_face'] = imgFace;
    data['img_front'] = imgFront;
    return data;
  }
}

class FaceCompareResponse {
/*
{
  "imgs": {
    "img_face": "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_a83714ac-722d-11ed-aaa4-9f59924f7bf4",
    "img_front": "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_bf76f7f3-7223-11ed-bad5-c9bc5fc1643e"
  },
  "dataSign": "VPAy2/wXY7qpkpKw6OrSnBxTfpKuE6MqQfIbsm5BvPRBpDNqaSEnRMpagqyPK36cbOz4VDh1TfweFW1AmWDUOg==",
  "dataBase64": "eyJpbWdzIjp7ImltZ19mYWNlIjoiaWRnMjAyMjEyMDItZWVkNWY3OTUtNjZkYS03OTQ0LWUwNTMtNjIxOTlmMGEzZDA1L0lERzAxX2E4MzcxNGFjLTcyMmQtMTFlZC1hYWE0LTlmNTk5MjRmN2JmNCIsImltZ19mcm9udCI6ImlkZzIwMjIxMjAyLWVlZDVmNzk1LTY2ZGEtNzk0NC1lMDUzLTYyMTk5ZjBhM2QwNS9JREcwMV9iZjc2ZjdmMy03MjIzLTExZWQtYmFkNS1jOWJjNWZjMTY0M2UifSwibWVzc2FnZSI6IklERy0wMDAwMDAwMCIsInNlcnZlcl92ZXJzaW9uIjoiMS4zLjI3Iiwib2JqZWN0Ijp7InJlc3VsdCI6IktodcO0biBt4bq3dCBraOG7m3AgOTYuMDc1MDAwMDAwMDAwMDIlIiwibXNnIjoiTUFUQ0giLCJwcm9iIjo5Ni4wNzUwMDAwMDAwMDAwMiwibWF0Y2hfd2FybmluZyI6Im5vIiwibXVsdGlwbGVfZmFjZXMiOmZhbHNlfSwic3RhdHVzQ29kZSI6MjAwLCJjaGFsbGVuZ2VDb2RlIjoiMTExMTEifQ==",
  "logID": "2ab579d9-725b-11ed-bb3b-335c4392e0c6-7f32f700-Zuulserver3",
  "message": "IDG-00000000",
  "server_version": "1.3.27",
  "object": {
    "result": "Khuôn mặt khớp 96.07500000000002%",
    "msg": "MATCH",
    "prob": 96.07500000000002,
    "match_warning": "no",
    "multiple_faces": false
  },
  "statusCode": 200,
  "challengeCode": "11111"
}
*/

  FaceCompareResponseImgs? imgs;
  String? dataSign;
  String? dataBase64;
  String? logID;
  String? message;
  String? serverVersion;
  FaceCompareResponseObject? object;
  int? statusCode;
  String? challengeCode;

  FaceCompareResponse({
    this.imgs,
    this.dataSign,
    this.dataBase64,
    this.logID,
    this.message,
    this.serverVersion,
    this.object,
    this.statusCode,
    this.challengeCode,
  });
  FaceCompareResponse.fromJson(Map<String, dynamic> json) {
    imgs = (json['imgs'] != null) ? FaceCompareResponseImgs.fromJson(json['imgs']) : null;
    dataSign = json['dataSign']?.toString();
    dataBase64 = json['dataBase64']?.toString();
    logID = json['logID']?.toString();
    message = json['message']?.toString();
    serverVersion = json['server_version']?.toString();
    object = (json['object'] != null) ? FaceCompareResponseObject.fromJson(json['object']) : null;
    statusCode = json['statusCode']?.toInt();
    challengeCode = json['challengeCode']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (imgs != null) {
      data['imgs'] = imgs!.toJson();
    }
    data['dataSign'] = dataSign;
    data['dataBase64'] = dataBase64;
    data['logID'] = logID;
    data['message'] = message;
    data['server_version'] = serverVersion;
    if (object != null) {
      data['object'] = object!.toJson();
    }
    data['statusCode'] = statusCode;
    data['challengeCode'] = challengeCode;
    return data;
  }
}
