class EkycAddfileResponseObject {
/*
{
  "fileName": "HuynhHuuKhanh-cmnd-mat-truoc",
  "tokenId": "eed5cc40-3160-185d-e053-63199f0a48db",
  "description": "CMND MAT TRUOC",
  "storageType": "IDG01",
  "title": "CMND Huynh Huu Khanh ",
  "uploadedDate": "12/2/22 10:21 PM",
  "hash": "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_ef6c882c-7254-11ed-aaa4-8d6f78836c1d",
  "fileType": "jpg"
}
*/

  String? fileName;
  String? tokenId;
  String? description;
  String? storageType;
  String? title;
  String? uploadedDate;
  String? hash;
  String? fileType;

  EkycAddfileResponseObject({
    this.fileName,
    this.tokenId,
    this.description,
    this.storageType,
    this.title,
    this.uploadedDate,
    this.hash,
    this.fileType,
  });
  EkycAddfileResponseObject.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName']?.toString();
    tokenId = json['tokenId']?.toString();
    description = json['description']?.toString();
    storageType = json['storageType']?.toString();
    title = json['title']?.toString();
    uploadedDate = json['uploadedDate']?.toString();
    hash = json['hash']?.toString();
    fileType = json['fileType']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fileName'] = fileName;
    data['tokenId'] = tokenId;
    data['description'] = description;
    data['storageType'] = storageType;
    data['title'] = title;
    data['uploadedDate'] = uploadedDate;
    data['hash'] = hash;
    data['fileType'] = fileType;
    return data;
  }
}

class EkycAddfileResponse {
/*
{
  "message": "IDG-00000000",
  "object": {
    "fileName": "HuynhHuuKhanh-cmnd-mat-truoc",
    "tokenId": "eed5cc40-3160-185d-e053-63199f0a48db",
    "description": "CMND MAT TRUOC",
    "storageType": "IDG01",
    "title": "CMND Huynh Huu Khanh ",
    "uploadedDate": "12/2/22 10:21 PM",
    "hash": "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_ef6c882c-7254-11ed-aaa4-8d6f78836c1d",
    "fileType": "jpg"
  }
}
*/

  String? message;
  EkycAddfileResponseObject? object;

  EkycAddfileResponse({
    this.message,
    this.object,
  });
  EkycAddfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    object = (json['object'] != null) ? EkycAddfileResponseObject.fromJson(json['object']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    if (object != null) {
      data['object'] = object!.toJson();
    }
    return data;
  }
}
