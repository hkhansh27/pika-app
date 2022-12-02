class GetIDInfoResponseObjectTampering {
/*
{
  "is_legal": "yes",
  "warning": [
    "Khong gi het"
  ]
}
*/

  String? isLegal;
  List<String?>? warning;

  GetIDInfoResponseObjectTampering({
    this.isLegal,
    this.warning,
  });
  GetIDInfoResponseObjectTampering.fromJson(Map<String, dynamic> json) {
    isLegal = json['is_legal']?.toString();
    if (json['warning'] != null) {
      final v = json['warning'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      warning = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['is_legal'] = isLegal;
    if (warning != null) {
      final v = warning;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['warning'] = arr0;
    }
    return data;
  }
}

class GetIDInfoResponseObjectQualityFrontFinalResult {
/*
{
  "bad_luminance_likelihood": "unlikely",
  "low_resolution_likelihood": "unlikely",
  "blurred_likelihood": "unlikely",
  "bright_spot_likelihood": "unlikely"
}
*/

  String? badLuminanceLikelihood;
  String? lowResolutionLikelihood;
  String? blurredLikelihood;
  String? brightSpotLikelihood;

  GetIDInfoResponseObjectQualityFrontFinalResult({
    this.badLuminanceLikelihood,
    this.lowResolutionLikelihood,
    this.blurredLikelihood,
    this.brightSpotLikelihood,
  });
  GetIDInfoResponseObjectQualityFrontFinalResult.fromJson(Map<String, dynamic> json) {
    badLuminanceLikelihood = json['bad_luminance_likelihood']?.toString();
    lowResolutionLikelihood = json['low_resolution_likelihood']?.toString();
    blurredLikelihood = json['blurred_likelihood']?.toString();
    brightSpotLikelihood = json['bright_spot_likelihood']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bad_luminance_likelihood'] = badLuminanceLikelihood;
    data['low_resolution_likelihood'] = lowResolutionLikelihood;
    data['blurred_likelihood'] = blurredLikelihood;
    data['bright_spot_likelihood'] = brightSpotLikelihood;
    return data;
  }
}

class GetIDInfoResponseObjectQualityFrontBrightSpotParam {
/*
{
  "average_intensity": 180.34,
  "bright_spot_threshold": 0.55,
  "total_bright_spot_area": 0
}
*/

  double? averageIntensity;
  double? brightSpotThreshold;
  int? totalBrightSpotArea;

  GetIDInfoResponseObjectQualityFrontBrightSpotParam({
    this.averageIntensity,
    this.brightSpotThreshold,
    this.totalBrightSpotArea,
  });
  GetIDInfoResponseObjectQualityFrontBrightSpotParam.fromJson(Map<String, dynamic> json) {
    averageIntensity = json['average_intensity']?.toDouble();
    brightSpotThreshold = json['bright_spot_threshold']?.toDouble();
    totalBrightSpotArea = json['total_bright_spot_area']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['average_intensity'] = averageIntensity;
    data['bright_spot_threshold'] = brightSpotThreshold;
    data['total_bright_spot_area'] = totalBrightSpotArea;
    return data;
  }
}

class GetIDInfoResponseObjectQualityFront {
/*
{
  "blur_score": 0.0173,
  "bright_spot_param": {
    "average_intensity": 180.34,
    "bright_spot_threshold": 0.55,
    "total_bright_spot_area": 0
  },
  "luminance_score": 0.7045,
  "final_result": {
    "bad_luminance_likelihood": "unlikely",
    "low_resolution_likelihood": "unlikely",
    "blurred_likelihood": "unlikely",
    "bright_spot_likelihood": "unlikely"
  },
  "bright_spot_score": 0,
  "resolution": [
    389
  ]
}
*/

  double? blurScore;
  GetIDInfoResponseObjectQualityFrontBrightSpotParam? brightSpotParam;
  double? luminanceScore;
  GetIDInfoResponseObjectQualityFrontFinalResult? finalResult;
  int? brightSpotScore;
  List<int?>? resolution;

  GetIDInfoResponseObjectQualityFront({
    this.blurScore,
    this.brightSpotParam,
    this.luminanceScore,
    this.finalResult,
    this.brightSpotScore,
    this.resolution,
  });
  GetIDInfoResponseObjectQualityFront.fromJson(Map<String, dynamic> json) {
    blurScore = json['blur_score']?.toDouble();
    brightSpotParam = (json['bright_spot_param'] != null)
        ? GetIDInfoResponseObjectQualityFrontBrightSpotParam.fromJson(json['bright_spot_param'])
        : null;
    luminanceScore = json['luminance_score']?.toDouble();
    finalResult = (json['final_result'] != null)
        ? GetIDInfoResponseObjectQualityFrontFinalResult.fromJson(json['final_result'])
        : null;
    brightSpotScore = json['bright_spot_score']?.toInt();
    if (json['resolution'] != null) {
      final v = json['resolution'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      resolution = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['blur_score'] = blurScore;
    if (brightSpotParam != null) {
      data['bright_spot_param'] = brightSpotParam!.toJson();
    }
    data['luminance_score'] = luminanceScore;
    if (finalResult != null) {
      data['final_result'] = finalResult!.toJson();
    }
    data['bright_spot_score'] = brightSpotScore;
    if (resolution != null) {
      final v = resolution;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['resolution'] = arr0;
    }
    return data;
  }
}

class GetIDInfoResponseObjectCheckingResultFront {
/*
{
  "corner_cut_result": "1",
  "edited_prob": 0.04598506540060043,
  "recaptured_result": "1",
  "check_photocopied_prob": 0,
  "corner_cut_prob": [
    0.8845250010490417
  ],
  "check_photocopied_result": "0",
  "edited_result": "0",
  "recaptured_prob": 0.9620149731636047
}
*/

  String? cornerCutResult;
  double? editedProb;
  String? recapturedResult;
  int? checkPhotocopiedProb;
  List<double?>? cornerCutProb;
  String? checkPhotocopiedResult;
  String? editedResult;
  double? recapturedProb;

  GetIDInfoResponseObjectCheckingResultFront({
    this.cornerCutResult,
    this.editedProb,
    this.recapturedResult,
    this.checkPhotocopiedProb,
    this.cornerCutProb,
    this.checkPhotocopiedResult,
    this.editedResult,
    this.recapturedProb,
  });
  GetIDInfoResponseObjectCheckingResultFront.fromJson(Map<String, dynamic> json) {
    cornerCutResult = json['corner_cut_result']?.toString();
    editedProb = json['edited_prob']?.toDouble();
    recapturedResult = json['recaptured_result']?.toString();
    checkPhotocopiedProb = json['check_photocopied_prob']?.toInt();
    if (json['corner_cut_prob'] != null) {
      final v = json['corner_cut_prob'];
      final arr0 = <double>[];
      v.forEach((v) {
        arr0.add(v.toDouble());
      });
      cornerCutProb = arr0;
    }
    checkPhotocopiedResult = json['check_photocopied_result']?.toString();
    editedResult = json['edited_result']?.toString();
    recapturedProb = json['recaptured_prob']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['corner_cut_result'] = cornerCutResult;
    data['edited_prob'] = editedProb;
    data['recaptured_result'] = recapturedResult;
    data['check_photocopied_prob'] = checkPhotocopiedProb;
    if (cornerCutProb != null) {
      final v = cornerCutProb;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['corner_cut_prob'] = arr0;
    }
    data['check_photocopied_result'] = checkPhotocopiedResult;
    data['edited_result'] = editedResult;
    data['recaptured_prob'] = recapturedProb;
    return data;
  }
}

class GetIDInfoResponseObjectQualityBackFinalResult {
/*
{
  "bad_luminance_likelihood": "unlikely",
  "low_resolution_likelihood": "likely",
  "blurred_likelihood": "unlikely",
  "bright_spot_likelihood": "unlikely"
}
*/

  String? badLuminanceLikelihood;
  String? lowResolutionLikelihood;
  String? blurredLikelihood;
  String? brightSpotLikelihood;

  GetIDInfoResponseObjectQualityBackFinalResult({
    this.badLuminanceLikelihood,
    this.lowResolutionLikelihood,
    this.blurredLikelihood,
    this.brightSpotLikelihood,
  });
  GetIDInfoResponseObjectQualityBackFinalResult.fromJson(Map<String, dynamic> json) {
    badLuminanceLikelihood = json['bad_luminance_likelihood']?.toString();
    lowResolutionLikelihood = json['low_resolution_likelihood']?.toString();
    blurredLikelihood = json['blurred_likelihood']?.toString();
    brightSpotLikelihood = json['bright_spot_likelihood']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bad_luminance_likelihood'] = badLuminanceLikelihood;
    data['low_resolution_likelihood'] = lowResolutionLikelihood;
    data['blurred_likelihood'] = blurredLikelihood;
    data['bright_spot_likelihood'] = brightSpotLikelihood;
    return data;
  }
}

class GetIDInfoResponseObjectQualityBackBrightSpotParam {
/*
{
  "average_intensity": 199.37,
  "bright_spot_threshold": 0.55,
  "total_bright_spot_area": 0
}
*/

  double? averageIntensity;
  double? brightSpotThreshold;
  int? totalBrightSpotArea;

  GetIDInfoResponseObjectQualityBackBrightSpotParam({
    this.averageIntensity,
    this.brightSpotThreshold,
    this.totalBrightSpotArea,
  });
  GetIDInfoResponseObjectQualityBackBrightSpotParam.fromJson(Map<String, dynamic> json) {
    averageIntensity = json['average_intensity']?.toDouble();
    brightSpotThreshold = json['bright_spot_threshold']?.toDouble();
    totalBrightSpotArea = json['total_bright_spot_area']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['average_intensity'] = averageIntensity;
    data['bright_spot_threshold'] = brightSpotThreshold;
    data['total_bright_spot_area'] = totalBrightSpotArea;
    return data;
  }
}

class GetIDInfoResponseObjectQualityBack {
/*
{
  "blur_score": 0.039,
  "bright_spot_param": {
    "average_intensity": 199.37,
    "bright_spot_threshold": 0.55,
    "total_bright_spot_area": 0
  },
  "luminance_score": 0.7788,
  "final_result": {
    "bad_luminance_likelihood": "unlikely",
    "low_resolution_likelihood": "likely",
    "blurred_likelihood": "unlikely",
    "bright_spot_likelihood": "unlikely"
  },
  "bright_spot_score": 0,
  "resolution": [
    295
  ]
}
*/

  double? blurScore;
  GetIDInfoResponseObjectQualityBackBrightSpotParam? brightSpotParam;
  double? luminanceScore;
  GetIDInfoResponseObjectQualityBackFinalResult? finalResult;
  int? brightSpotScore;
  List<int?>? resolution;

  GetIDInfoResponseObjectQualityBack({
    this.blurScore,
    this.brightSpotParam,
    this.luminanceScore,
    this.finalResult,
    this.brightSpotScore,
    this.resolution,
  });
  GetIDInfoResponseObjectQualityBack.fromJson(Map<String, dynamic> json) {
    blurScore = json['blur_score']?.toDouble();
    brightSpotParam = (json['bright_spot_param'] != null)
        ? GetIDInfoResponseObjectQualityBackBrightSpotParam.fromJson(json['bright_spot_param'])
        : null;
    luminanceScore = json['luminance_score']?.toDouble();
    finalResult = (json['final_result'] != null)
        ? GetIDInfoResponseObjectQualityBackFinalResult.fromJson(json['final_result'])
        : null;
    brightSpotScore = json['bright_spot_score']?.toInt();
    if (json['resolution'] != null) {
      final v = json['resolution'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      resolution = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['blur_score'] = blurScore;
    if (brightSpotParam != null) {
      data['bright_spot_param'] = brightSpotParam!.toJson();
    }
    data['luminance_score'] = luminanceScore;
    if (finalResult != null) {
      data['final_result'] = finalResult!.toJson();
    }
    data['bright_spot_score'] = brightSpotScore;
    if (resolution != null) {
      final v = resolution;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['resolution'] = arr0;
    }
    return data;
  }
}

class GetIDInfoResponseObjectCheckingResultBack {
/*
{
  "corner_cut_result": "1",
  "edited_prob": 0,
  "recaptured_result": "1",
  "check_photocopied_prob": 0,
  "corner_cut_prob": [
    0.9090482592582703
  ],
  "check_photocopied_result": "0",
  "edited_result": "0",
  "recaptured_prob": 0.9419943690299988
}
*/

  String? cornerCutResult;
  int? editedProb;
  String? recapturedResult;
  int? checkPhotocopiedProb;
  List<double?>? cornerCutProb;
  String? checkPhotocopiedResult;
  String? editedResult;
  double? recapturedProb;

  GetIDInfoResponseObjectCheckingResultBack({
    this.cornerCutResult,
    this.editedProb,
    this.recapturedResult,
    this.checkPhotocopiedProb,
    this.cornerCutProb,
    this.checkPhotocopiedResult,
    this.editedResult,
    this.recapturedProb,
  });
  GetIDInfoResponseObjectCheckingResultBack.fromJson(Map<String, dynamic> json) {
    cornerCutResult = json['corner_cut_result']?.toString();
    editedProb = json['edited_prob']?.toInt();
    recapturedResult = json['recaptured_result']?.toString();
    checkPhotocopiedProb = json['check_photocopied_prob']?.toInt();
    if (json['corner_cut_prob'] != null) {
      final v = json['corner_cut_prob'];
      final arr0 = <double>[];
      v.forEach((v) {
        arr0.add(v.toDouble());
      });
      cornerCutProb = arr0;
    }
    checkPhotocopiedResult = json['check_photocopied_result']?.toString();
    editedResult = json['edited_result']?.toString();
    recapturedProb = json['recaptured_prob']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['corner_cut_result'] = cornerCutResult;
    data['edited_prob'] = editedProb;
    data['recaptured_result'] = recapturedResult;
    data['check_photocopied_prob'] = checkPhotocopiedProb;
    if (cornerCutProb != null) {
      final v = cornerCutProb;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['corner_cut_prob'] = arr0;
    }
    data['check_photocopied_result'] = checkPhotocopiedResult;
    data['edited_result'] = editedResult;
    data['recaptured_prob'] = recapturedProb;
    return data;
  }
}

class GetIDInfoResponseObject {
/*
{
  "origin_location": "Mỹ Tịnh An\nChợ Gạo, Tiền Giang",
  "msg": "OK",
  "name_prob": 0.9999999761581421,
  "birth_day_label": "Sinh ngày 02-07-2001",
  "recent_location_label": "Nơi ĐKHK thường trú: Mỹ Trường",
  "cover_prob_front": 0,
  "warning_msg": [
    "Cảnh báo thông tin ngày cấp bị mờ nhòe"
  ],
  "back_type_id": 0,
  "address_fake_warning": false,
  "checking_result_back": {
    "corner_cut_result": "1",
    "edited_prob": 0,
    "recaptured_result": "1",
    "check_photocopied_prob": 0,
    "corner_cut_prob": [
      0.9090482592582703
    ],
    "check_photocopied_result": "0",
    "edited_result": "0",
    "recaptured_prob": 0.9419943690299988
  },
  "nation_policy": "CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM",
  "general_warning": [
    "ngay_cap_mo_nhoe"
  ],
  "quality_back": {
    "blur_score": 0.039,
    "bright_spot_param": {
      "average_intensity": 199.37,
      "bright_spot_threshold": 0.55,
      "total_bright_spot_area": 0
    },
    "luminance_score": 0.7788,
    "final_result": {
      "bad_luminance_likelihood": "unlikely",
      "low_resolution_likelihood": "likely",
      "blurred_likelihood": "unlikely",
      "bright_spot_likelihood": "unlikely"
    },
    "bright_spot_score": 0,
    "resolution": [
      295
    ]
  },
  "checking_result_front": {
    "corner_cut_result": "1",
    "edited_prob": 0.04598506540060043,
    "recaptured_result": "1",
    "check_photocopied_prob": 0,
    "corner_cut_prob": [
      0.8845250010490417
    ],
    "check_photocopied_result": "0",
    "edited_result": "0",
    "recaptured_prob": 0.9620149731636047
  },
  "back_corner_warning": "yes",
  "warning": [
    "ngay_cap_mo_nhoe"
  ],
  "id": "312493002",
  "back_expire_warning": "no",
  "msg_back": "OK",
  "birth_day_prob": 1,
  "recent_location": "Mỹ Trường\nMỹ Tính An, Chợ Gạo, Tiền Giang",
  "id_fake_warning": "no",
  "name_probs": [
    1
  ],
  "issue_date_prob": 0.6632080078125,
  "citizen_id": "-",
  "recent_location_prob": 0.9870001277615947,
  "issue_place_prob": 0.9993175378552189,
  "gender_prob": 0,
  "nationality": "-",
  "name": "HUỲNH HỮU KHÁNH",
  "origin_location_label": "Nguyên quán: Mỹ Tịnh An",
  "name_fake_warning_prob": 0.03399733453989029,
  "gender": "-",
  "ethnicity": "Kinh",
  "religion_prob": 0.8739890212362463,
  "print_type_for_front_matching": "PRINTING",
  "expire_warning": "no",
  "issue_date_probs": [
    0.6632080078125
  ],
  "issue_date_warning": "yes",
  "nation_slogan": "Độc lập - Tự do - Hạnh phúc",
  "print_type": "printing",
  "valid_date_prob": 0,
  "origin_location_prob": 0.9999999885428144,
  "corner_warning": "yes",
  "valid_date": "-",
  "print_type_for_back_matching": "PRINTING",
  "issue_date": "30/05/2016",
  "id_fake_prob": 0,
  "nationality_prob": 0,
  "id_probs": "[1.0, 1.0, 1.0, 1.0, 1.0, 0.9999988, 1.0, 1.0, 0.9999976]",
  "citizen_id_prob": 0,
  "dob_fake_warning_prob": 0.06207531690597534,
  "features_prob": 0,
  "issue_place": "Tiền Giang",
  "dob_fake_warning": false,
  "name_fake_warning": "real",
  "type_id": 0,
  "ethnicity_prob": 0.8739890212362463,
  "card_type": "GIẤY CHỨNG MINH NHÂN DÂN",
  "quality_front": {
    "blur_score": 0.0173,
    "bright_spot_param": {
      "average_intensity": 180.34,
      "bright_spot_threshold": 0.55,
      "total_bright_spot_area": 0
    },
    "luminance_score": 0.7045,
    "final_result": {
      "bad_luminance_likelihood": "unlikely",
      "low_resolution_likelihood": "unlikely",
      "blurred_likelihood": "unlikely",
      "bright_spot_likelihood": "unlikely"
    },
    "bright_spot_score": 0,
    "resolution": [
      389
    ]
  },
  "religion": "Không",
  "birth_day": "02/07/2001",
  "issuedate_fake_warning": false,
  "tampering": {
    "is_legal": "yes",
    "warning": [
      "Khong gi het"
    ]
  }
}
*/

  String? originLocation;
  String? msg;
  double? nameProb;
  String? birthDayLabel;
  String? recentLocationLabel;
  int? coverProbFront;
  List<String?>? warningMsg;
  int? backTypeId;
  bool? addressFakeWarning;
  GetIDInfoResponseObjectCheckingResultBack? checkingResultBack;
  String? nationPolicy;
  List<String?>? generalWarning;
  GetIDInfoResponseObjectQualityBack? qualityBack;
  GetIDInfoResponseObjectCheckingResultFront? checkingResultFront;
  String? backCornerWarning;
  List<String?>? warning;
  String? id;
  String? backExpireWarning;
  String? msgBack;
  int? birthDayProb;
  String? recentLocation;
  String? idFakeWarning;
  List<int?>? nameProbs;
  double? issueDateProb;
  String? citizenId;
  double? recentLocationProb;
  double? issuePlaceProb;
  int? genderProb;
  String? nationality;
  String? name;
  String? originLocationLabel;
  double? nameFakeWarningProb;
  String? gender;
  String? ethnicity;
  double? religionProb;
  String? printTypeForFrontMatching;
  String? expireWarning;
  List<double?>? issueDateProbs;
  String? issueDateWarning;
  String? nationSlogan;
  String? printType;
  int? validDateProb;
  double? originLocationProb;
  String? cornerWarning;
  String? validDate;
  String? printTypeForBackMatching;
  String? issueDate;
  int? idFakeProb;
  int? nationalityProb;
  String? idProbs;
  int? citizenIdProb;
  double? dobFakeWarningProb;
  int? featuresProb;
  String? issuePlace;
  bool? dobFakeWarning;
  String? nameFakeWarning;
  int? typeId;
  double? ethnicityProb;
  String? cardType;
  GetIDInfoResponseObjectQualityFront? qualityFront;
  String? religion;
  String? birthDay;
  bool? issuedateFakeWarning;
  GetIDInfoResponseObjectTampering? tampering;

  GetIDInfoResponseObject({
    this.originLocation,
    this.msg,
    this.nameProb,
    this.birthDayLabel,
    this.recentLocationLabel,
    this.coverProbFront,
    this.warningMsg,
    this.backTypeId,
    this.addressFakeWarning,
    this.checkingResultBack,
    this.nationPolicy,
    this.generalWarning,
    this.qualityBack,
    this.checkingResultFront,
    this.backCornerWarning,
    this.warning,
    this.id,
    this.backExpireWarning,
    this.msgBack,
    this.birthDayProb,
    this.recentLocation,
    this.idFakeWarning,
    this.nameProbs,
    this.issueDateProb,
    this.citizenId,
    this.recentLocationProb,
    this.issuePlaceProb,
    this.genderProb,
    this.nationality,
    this.name,
    this.originLocationLabel,
    this.nameFakeWarningProb,
    this.gender,
    this.ethnicity,
    this.religionProb,
    this.printTypeForFrontMatching,
    this.expireWarning,
    this.issueDateProbs,
    this.issueDateWarning,
    this.nationSlogan,
    this.printType,
    this.validDateProb,
    this.originLocationProb,
    this.cornerWarning,
    this.validDate,
    this.printTypeForBackMatching,
    this.issueDate,
    this.idFakeProb,
    this.nationalityProb,
    this.idProbs,
    this.citizenIdProb,
    this.dobFakeWarningProb,
    this.featuresProb,
    this.issuePlace,
    this.dobFakeWarning,
    this.nameFakeWarning,
    this.typeId,
    this.ethnicityProb,
    this.cardType,
    this.qualityFront,
    this.religion,
    this.birthDay,
    this.issuedateFakeWarning,
    this.tampering,
  });
  GetIDInfoResponseObject.fromJson(Map<String, dynamic> json) {
    originLocation = json['origin_location']?.toString();
    msg = json['msg']?.toString();
    nameProb = json['name_prob']?.toDouble();
    birthDayLabel = json['birth_day_label']?.toString();
    recentLocationLabel = json['recent_location_label']?.toString();
    coverProbFront = json['cover_prob_front']?.toInt();
    if (json['warning_msg'] != null) {
      final v = json['warning_msg'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      warningMsg = arr0;
    }
    backTypeId = json['back_type_id']?.toInt();
    addressFakeWarning = json['address_fake_warning'];
    checkingResultBack = (json['checking_result_back'] != null)
        ? GetIDInfoResponseObjectCheckingResultBack.fromJson(json['checking_result_back'])
        : null;
    nationPolicy = json['nation_policy']?.toString();
    if (json['general_warning'] != null) {
      final v = json['general_warning'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      generalWarning = arr0;
    }
    qualityBack =
        (json['quality_back'] != null) ? GetIDInfoResponseObjectQualityBack.fromJson(json['quality_back']) : null;
    checkingResultFront = (json['checking_result_front'] != null)
        ? GetIDInfoResponseObjectCheckingResultFront.fromJson(json['checking_result_front'])
        : null;
    backCornerWarning = json['back_corner_warning']?.toString();
    if (json['warning'] != null) {
      final v = json['warning'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      warning = arr0;
    }
    id = json['id']?.toString();
    backExpireWarning = json['back_expire_warning']?.toString();
    msgBack = json['msg_back']?.toString();
    birthDayProb = json['birth_day_prob']?.toInt();
    recentLocation = json['recent_location']?.toString();
    idFakeWarning = json['id_fake_warning']?.toString();
    if (json['name_probs'] != null) {
      final v = json['name_probs'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      nameProbs = arr0;
    }
    issueDateProb = json['issue_date_prob']?.toDouble();
    citizenId = json['citizen_id']?.toString();
    recentLocationProb = json['recent_location_prob']?.toDouble();
    issuePlaceProb = json['issue_place_prob']?.toDouble();
    genderProb = json['gender_prob']?.toInt();
    nationality = json['nationality']?.toString();
    name = json['name']?.toString();
    originLocationLabel = json['origin_location_label']?.toString();
    nameFakeWarningProb = json['name_fake_warning_prob']?.toDouble();
    gender = json['gender']?.toString();
    ethnicity = json['ethnicity']?.toString();
    religionProb = json['religion_prob']?.toDouble();
    printTypeForFrontMatching = json['print_type_for_front_matching']?.toString();
    expireWarning = json['expire_warning']?.toString();
    if (json['issue_date_probs'] != null) {
      final v = json['issue_date_probs'];
      final arr0 = <double>[];
      v.forEach((v) {
        arr0.add(v.toDouble());
      });
      issueDateProbs = arr0;
    }
    issueDateWarning = json['issue_date_warning']?.toString();
    nationSlogan = json['nation_slogan']?.toString();
    printType = json['print_type']?.toString();
    validDateProb = json['valid_date_prob']?.toInt();
    originLocationProb = json['origin_location_prob']?.toDouble();
    cornerWarning = json['corner_warning']?.toString();
    validDate = json['valid_date']?.toString();
    printTypeForBackMatching = json['print_type_for_back_matching']?.toString();
    issueDate = json['issue_date']?.toString();
    idFakeProb = json['id_fake_prob']?.toInt();
    nationalityProb = json['nationality_prob']?.toInt();
    idProbs = json['id_probs']?.toString();
    citizenIdProb = json['citizen_id_prob']?.toInt();
    dobFakeWarningProb = json['dob_fake_warning_prob']?.toDouble();
    featuresProb = json['features_prob']?.toInt();
    issuePlace = json['issue_place']?.toString();
    dobFakeWarning = json['dob_fake_warning'];
    nameFakeWarning = json['name_fake_warning']?.toString();
    typeId = json['type_id']?.toInt();
    ethnicityProb = json['ethnicity_prob']?.toDouble();
    cardType = json['card_type']?.toString();
    qualityFront =
        (json['quality_front'] != null) ? GetIDInfoResponseObjectQualityFront.fromJson(json['quality_front']) : null;
    religion = json['religion']?.toString();
    birthDay = json['birth_day']?.toString();
    issuedateFakeWarning = json['issuedate_fake_warning'];
    tampering = (json['tampering'] != null) ? GetIDInfoResponseObjectTampering.fromJson(json['tampering']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['origin_location'] = originLocation;
    data['msg'] = msg;
    data['name_prob'] = nameProb;
    data['birth_day_label'] = birthDayLabel;
    data['recent_location_label'] = recentLocationLabel;
    data['cover_prob_front'] = coverProbFront;
    if (warningMsg != null) {
      final v = warningMsg;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['warning_msg'] = arr0;
    }
    data['back_type_id'] = backTypeId;
    data['address_fake_warning'] = addressFakeWarning;
    if (checkingResultBack != null) {
      data['checking_result_back'] = checkingResultBack!.toJson();
    }
    data['nation_policy'] = nationPolicy;
    if (generalWarning != null) {
      final v = generalWarning;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['general_warning'] = arr0;
    }
    if (qualityBack != null) {
      data['quality_back'] = qualityBack!.toJson();
    }
    if (checkingResultFront != null) {
      data['checking_result_front'] = checkingResultFront!.toJson();
    }
    data['back_corner_warning'] = backCornerWarning;
    if (warning != null) {
      final v = warning;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['warning'] = arr0;
    }
    data['id'] = id;
    data['back_expire_warning'] = backExpireWarning;
    data['msg_back'] = msgBack;
    data['birth_day_prob'] = birthDayProb;
    data['recent_location'] = recentLocation;
    data['id_fake_warning'] = idFakeWarning;
    if (nameProbs != null) {
      final v = nameProbs;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['name_probs'] = arr0;
    }
    data['issue_date_prob'] = issueDateProb;
    data['citizen_id'] = citizenId;
    data['recent_location_prob'] = recentLocationProb;
    data['issue_place_prob'] = issuePlaceProb;
    data['gender_prob'] = genderProb;
    data['nationality'] = nationality;
    data['name'] = name;
    data['origin_location_label'] = originLocationLabel;
    data['name_fake_warning_prob'] = nameFakeWarningProb;
    data['gender'] = gender;
    data['ethnicity'] = ethnicity;
    data['religion_prob'] = religionProb;
    data['print_type_for_front_matching'] = printTypeForFrontMatching;
    data['expire_warning'] = expireWarning;
    if (issueDateProbs != null) {
      final v = issueDateProbs;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['issue_date_probs'] = arr0;
    }
    data['issue_date_warning'] = issueDateWarning;
    data['nation_slogan'] = nationSlogan;
    data['print_type'] = printType;
    data['valid_date_prob'] = validDateProb;
    data['origin_location_prob'] = originLocationProb;
    data['corner_warning'] = cornerWarning;
    data['valid_date'] = validDate;
    data['print_type_for_back_matching'] = printTypeForBackMatching;
    data['issue_date'] = issueDate;
    data['id_fake_prob'] = idFakeProb;
    data['nationality_prob'] = nationalityProb;
    data['id_probs'] = idProbs;
    data['citizen_id_prob'] = citizenIdProb;
    data['dob_fake_warning_prob'] = dobFakeWarningProb;
    data['features_prob'] = featuresProb;
    data['issue_place'] = issuePlace;
    data['dob_fake_warning'] = dobFakeWarning;
    data['name_fake_warning'] = nameFakeWarning;
    data['type_id'] = typeId;
    data['ethnicity_prob'] = ethnicityProb;
    data['card_type'] = cardType;
    if (qualityFront != null) {
      data['quality_front'] = qualityFront!.toJson();
    }
    data['religion'] = religion;
    data['birth_day'] = birthDay;
    data['issuedate_fake_warning'] = issuedateFakeWarning;
    if (tampering != null) {
      data['tampering'] = tampering!.toJson();
    }
    return data;
  }
}

class GetIDInfoResponseImgs {
/*
{
  "img_back": "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_a6fecf82-725f-11ed-9807-9573ef1845e6",
  "img_front": "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_ef6c882c-7254-11ed-aaa4-8d6f78836c1d"
}
*/

  String? imgBack;
  String? imgFront;

  GetIDInfoResponseImgs({
    this.imgBack,
    this.imgFront,
  });
  GetIDInfoResponseImgs.fromJson(Map<String, dynamic> json) {
    imgBack = json['img_back']?.toString();
    imgFront = json['img_front']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['img_back'] = imgBack;
    data['img_front'] = imgFront;
    return data;
  }
}

class GetIDInfoResponse {
/*
{
  "imgs": {
    "img_back": "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_a6fecf82-725f-11ed-9807-9573ef1845e6",
    "img_front": "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_ef6c882c-7254-11ed-aaa4-8d6f78836c1d"
  },
  "dataSign": "hpwQE+ss6g6jkHhwObnd/euvily/pO9TI/LlaZC34k6ejTOt80uNtthU4SMC5W3XCTW7bIyomn6GA+N7gt8Ufw==",
  "dataBase64": "eyJpbWdzIjp7ImltZ19iYWNrIjoiaWRnMjAyMjEyMDItZWVkNWY3OTUtNjZkYS03OTQ0LWUwNTMtNjIxOTlmMGEzZDA1L0lERzAxX2E2ZmVjZjgyLTcyNWYtMTFlZC05ODA3LTk1NzNlZjE4NDVlNiIsImltZ19mcm9udCI6ImlkZzIwMjIxMjAyLWVlZDVmNzk1LTY2ZGEtNzk0NC1lMDUzLTYyMTk5ZjBhM2QwNS9JREcwMV9lZjZjODgyYy03MjU0LTExZWQtYWFhNC04ZDZmNzg4MzZjMWQifSwibWVzc2FnZSI6IklERy0wMDAwMDAwMCIsInNlcnZlcl92ZXJzaW9uIjoiMS4zLjI3Iiwib2JqZWN0Ijp7Im9yaWdpbl9sb2NhdGlvbiI6Ik3hu7kgVOG7i25oIEFuXG5DaOG7oyBH4bqhbywgVGnhu4FuIEdpYW5nIiwibXNnIjoiT0siLCJuYW1lX3Byb2IiOjAuOTk5OTk5OTc2MTU4MTQyMSwiYmlydGhfZGF5X2xhYmVsIjoiU2luaCBuZ8OgeSAwMi0wNy0yMDAxIiwicmVjZW50X2xvY2F0aW9uX2xhYmVsIjoiTsahaSDEkEtISyB0aMaw4budbmcgdHLDujogTeG7uSBUcsaw4budbmciLCJjb3Zlcl9wcm9iX2Zyb250IjowLCJ3YXJuaW5nX21zZyI6WyJD4bqjbmggYsOhbyB0aMO0bmcgdGluIG5nw6B5IGPhuqVwIGLhu4sgbeG7nSBuaMOyZSIsIkPhuqNuaCBiw6FvIG7hu5lpIGR1bmcg4bqjbmggZ2nhuqV5IHThu50gxJHhuqd1IHbDoG8gbG/DoS9t4bqldCBnw7NjIl0sImJhY2tfdHlwZV9pZCI6MCwiYWRkcmVzc19mYWtlX3dhcm5pbmciOmZhbHNlLCJjaGVja2luZ19yZXN1bHRfYmFjayI6eyJjb3JuZXJfY3V0X3Jlc3VsdCI6IjEiLCJlZGl0ZWRfcHJvYiI6MCwicmVjYXB0dXJlZF9yZXN1bHQiOiIxIiwiY2hlY2tfcGhvdG9jb3BpZWRfcHJvYiI6MCwiY29ybmVyX2N1dF9wcm9iIjpbMC45MDkwNDgyNTkyNTgyNzAzLDAuOTA5MDQ4MjU5MjU4MjcwMywwLjkwOTA0ODI1OTI1ODI3MDMsMC45MDkwNDgyNTkyNTgyNzAzXSwiY2hlY2tfcGhvdG9jb3BpZWRfcmVzdWx0IjoiMCIsImVkaXRlZF9yZXN1bHQiOiIwIiwicmVjYXB0dXJlZF9wcm9iIjowLjk0MTk5NDM2OTAyOTk5ODh9LCJuYXRpb25fcG9saWN5IjoiQ+G7mE5HIEhPw4AgWMODIEjhu5hJIENI4bumIE5HSMSoQSBWSeG7hlQgTkFNIiwiZ2VuZXJhbF93YXJuaW5nIjpbIm5nYXlfY2FwX21vX25ob2UiLCJhbmhfZGF1X3Zhb19tYXRfZ29jIl0sInF1YWxpdHlfYmFjayI6eyJibHVyX3Njb3JlIjowLjAzOSwiYnJpZ2h0X3Nwb3RfcGFyYW0iOnsiYXZlcmFnZV9pbnRlbnNpdHkiOjE5OS4zNywiYnJpZ2h0X3Nwb3RfdGhyZXNob2xkIjowLjU1LCJ0b3RhbF9icmlnaHRfc3BvdF9hcmVhIjowfSwibHVtaW5hbmNlX3Njb3JlIjowLjc3ODgsImZpbmFsX3Jlc3VsdCI6eyJiYWRfbHVtaW5hbmNlX2xpa2VsaWhvb2QiOiJ1bmxpa2VseSIsImxvd19yZXNvbHV0aW9uX2xpa2VsaWhvb2QiOiJsaWtlbHkiLCJibHVycmVkX2xpa2VsaWhvb2QiOiJ1bmxpa2VseSIsImJyaWdodF9zcG90X2xpa2VsaWhvb2QiOiJ1bmxpa2VseSJ9LCJicmlnaHRfc3BvdF9zY29yZSI6MCwicmVzb2x1dGlvbiI6WzI5NSw2NzldfSwiY2hlY2tpbmdfcmVzdWx0X2Zyb250Ijp7ImNvcm5lcl9jdXRfcmVzdWx0IjoiMSIsImVkaXRlZF9wcm9iIjowLjA0NTk4NTA2NTQwMDYwMDQzLCJyZWNhcHR1cmVkX3Jlc3VsdCI6IjEiLCJjaGVja19waG90b2NvcGllZF9wcm9iIjowLCJjb3JuZXJfY3V0X3Byb2IiOlswLjg4NDUyNTAwMTA0OTA0MTcsMC44ODQ1MjUwMDEwNDkwNDE3LDAuODg0NTI1MDAxMDQ5MDQxNywwLjg4NDUyNTAwMTA0OTA0MTddLCJjaGVja19waG90b2NvcGllZF9yZXN1bHQiOiIwIiwiZWRpdGVkX3Jlc3VsdCI6IjAiLCJyZWNhcHR1cmVkX3Byb2IiOjAuOTYyMDE0OTczMTYzNjA0N30sImJhY2tfY29ybmVyX3dhcm5pbmciOiJ5ZXMiLCJ3YXJuaW5nIjpbIm5nYXlfY2FwX21vX25ob2UiLCJhbmhfZGF1X3Zhb19tYXRfZ29jIl0sImlkIjoiMzEyNDkzMDAyIiwiYmFja19leHBpcmVfd2FybmluZyI6Im5vIiwibXNnX2JhY2siOiJPSyIsImJpcnRoX2RheV9wcm9iIjoxLCJyZWNlbnRfbG9jYXRpb24iOiJN4bu5IFRyxrDhu51uZ1xuTeG7uSBUw61uaCBBbiwgQ2jhu6MgR+G6oW8sIFRp4buBbiBHaWFuZyIsImlkX2Zha2Vfd2FybmluZyI6Im5vIiwibmFtZV9wcm9icyI6WzEsMSwwLjk5OTk5OTg4MDc5MDcxMDQsMSwxLDEsMSwxLDEsMSwxLDEsMC45OTk5OTk3NjE1ODE0MjA5LDEsMV0sImlzc3VlX2RhdGVfcHJvYiI6MC42NjMyMDgwMDc4MTI1LCJjaXRpemVuX2lkIjoiLSIsInJlY2VudF9sb2NhdGlvbl9wcm9iIjowLjk4NzAwMDEyNzc2MTU5NDcsImlzc3VlX3BsYWNlX3Byb2IiOjAuOTk5MzE3NTM3ODU1MjE4OSwiZ2VuZGVyX3Byb2IiOjAsIm5hdGlvbmFsaXR5IjoiLSIsIm5hbWUiOiJIVeG7sk5IIEjhu65VIEtIw4FOSCIsIm9yaWdpbl9sb2NhdGlvbl9sYWJlbCI6Ik5ndXnDqm4gcXXDoW46IE3hu7kgVOG7i25oIEFuIiwibmFtZV9mYWtlX3dhcm5pbmdfcHJvYiI6MC4wMzM5OTczMzQ1Mzk4OTAyOSwiZ2VuZGVyIjoiLSIsImV0aG5pY2l0eSI6IktpbmgiLCJyZWxpZ2lvbl9wcm9iIjowLjg3Mzk4OTAyMTIzNjI0NjMsInByaW50X3R5cGVfZm9yX2Zyb250X21hdGNoaW5nIjoiUFJJTlRJTkciLCJleHBpcmVfd2FybmluZyI6Im5vIiwiaXNzdWVfZGF0ZV9wcm9icyI6WzAuNjYzMjA4MDA3ODEyNSwwLjk5ODUwMjk2OTc0MTgyMTMsMSwwLjk5OTk5Nzg1NDIzMjc4ODEsMSwwLjk5OTk5MTQxNjkzMTE1MjMsMSwxXSwiaXNzdWVfZGF0ZV93YXJuaW5nIjoieWVzIiwibmF0aW9uX3Nsb2dhbiI6IsSQ4buZYyBs4bqtcCAtIFThu7EgZG8gLSBI4bqhbmggcGjDumMiLCJwcmludF90eXBlIjoicHJpbnRpbmciLCJ2YWxpZF9kYXRlX3Byb2IiOjAsIm9yaWdpbl9sb2NhdGlvbl9wcm9iIjowLjk5OTk5OTk4ODU0MjgxNDQsImNvcm5lcl93YXJuaW5nIjoieWVzIiwidmFsaWRfZGF0ZSI6Ii0iLCJwcmludF90eXBlX2Zvcl9iYWNrX21hdGNoaW5nIjoiUFJJTlRJTkciLCJpc3N1ZV9kYXRlIjoiMzAvMDUvMjAxNiIsImlkX2Zha2VfcHJvYiI6MCwibmF0aW9uYWxpdHlfcHJvYiI6MCwiaWRfcHJvYnMiOiJbMS4wLCAxLjAsIDEuMCwgMS4wLCAxLjAsIDAuOTk5OTk4OCwgMS4wLCAxLjAsIDAuOTk5OTk3Nl0iLCJjaXRpemVuX2lkX3Byb2IiOjAsImRvYl9mYWtlX3dhcm5pbmdfcHJvYiI6MC4wNjIwNzUzMTY5MDU5NzUzNCwiZmVhdHVyZXNfcHJvYiI6MCwiaXNzdWVfcGxhY2UiOiJUaeG7gW4gR2lhbmciLCJkb2JfZmFrZV93YXJuaW5nIjpmYWxzZSwibmFtZV9mYWtlX3dhcm5pbmciOiJyZWFsIiwidHlwZV9pZCI6MCwiZXRobmljaXR5X3Byb2IiOjAuODczOTg5MDIxMjM2MjQ2MywiY2FyZF90eXBlIjoiR0nhuqRZIENI4buoTkcgTUlOSCBOSMOCTiBEw4JOIiwicXVhbGl0eV9mcm9udCI6eyJibHVyX3Njb3JlIjowLjAxNzMsImJyaWdodF9zcG90X3BhcmFtIjp7ImF2ZXJhZ2VfaW50ZW5zaXR5IjoxODAuMzQsImJyaWdodF9zcG90X3RocmVzaG9sZCI6MC41NSwidG90YWxfYnJpZ2h0X3Nwb3RfYXJlYSI6MH0sImx1bWluYW5jZV9zY29yZSI6MC43MDQ1LCJmaW5hbF9yZXN1bHQiOnsiYmFkX2x1bWluYW5jZV9saWtlbGlob29kIjoidW5saWtlbHkiLCJsb3dfcmVzb2x1dGlvbl9saWtlbGlob29kIjoidW5saWtlbHkiLCJibHVycmVkX2xpa2VsaWhvb2QiOiJ1bmxpa2VseSIsImJyaWdodF9zcG90X2xpa2VsaWhvb2QiOiJ1bmxpa2VseSJ9LCJicmlnaHRfc3BvdF9zY29yZSI6MCwicmVzb2x1dGlvbiI6WzM4OSw3MTVdfSwicmVsaWdpb24iOiJLaMO0bmciLCJiaXJ0aF9kYXkiOiIwMi8wNy8yMDAxIiwiaXNzdWVkYXRlX2Zha2Vfd2FybmluZyI6ZmFsc2UsInRhbXBlcmluZyI6eyJpc19sZWdhbCI6InllcyIsIndhcm5pbmciOltdfX0sInN0YXR1c0NvZGUiOjIwMCwiY2hhbGxlbmdlQ29kZSI6IjExMTExIn0=",
  "logID": "cf31cbcd-725f-11ed-9c4e-0f7ed6f00925-35876a63-Zuulserver2",
  "message": "IDG-00000000",
  "server_version": "1.3.27",
  "object": {
    "origin_location": "Mỹ Tịnh An\nChợ Gạo, Tiền Giang",
    "msg": "OK",
    "name_prob": 0.9999999761581421,
    "birth_day_label": "Sinh ngày 02-07-2001",
    "recent_location_label": "Nơi ĐKHK thường trú: Mỹ Trường",
    "cover_prob_front": 0,
    "warning_msg": [
      "Cảnh báo thông tin ngày cấp bị mờ nhòe"
    ],
    "back_type_id": 0,
    "address_fake_warning": false,
    "checking_result_back": {
      "corner_cut_result": "1",
      "edited_prob": 0,
      "recaptured_result": "1",
      "check_photocopied_prob": 0,
      "corner_cut_prob": [
        0.9090482592582703
      ],
      "check_photocopied_result": "0",
      "edited_result": "0",
      "recaptured_prob": 0.9419943690299988
    },
    "nation_policy": "CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM",
    "general_warning": [
      "ngay_cap_mo_nhoe"
    ],
    "quality_back": {
      "blur_score": 0.039,
      "bright_spot_param": {
        "average_intensity": 199.37,
        "bright_spot_threshold": 0.55,
        "total_bright_spot_area": 0
      },
      "luminance_score": 0.7788,
      "final_result": {
        "bad_luminance_likelihood": "unlikely",
        "low_resolution_likelihood": "likely",
        "blurred_likelihood": "unlikely",
        "bright_spot_likelihood": "unlikely"
      },
      "bright_spot_score": 0,
      "resolution": [
        295
      ]
    },
    "checking_result_front": {
      "corner_cut_result": "1",
      "edited_prob": 0.04598506540060043,
      "recaptured_result": "1",
      "check_photocopied_prob": 0,
      "corner_cut_prob": [
        0.8845250010490417
      ],
      "check_photocopied_result": "0",
      "edited_result": "0",
      "recaptured_prob": 0.9620149731636047
    },
    "back_corner_warning": "yes",
    "warning": [
      "ngay_cap_mo_nhoe"
    ],
    "id": "312493002",
    "back_expire_warning": "no",
    "msg_back": "OK",
    "birth_day_prob": 1,
    "recent_location": "Mỹ Trường\nMỹ Tính An, Chợ Gạo, Tiền Giang",
    "id_fake_warning": "no",
    "name_probs": [
      1
    ],
    "issue_date_prob": 0.6632080078125,
    "citizen_id": "-",
    "recent_location_prob": 0.9870001277615947,
    "issue_place_prob": 0.9993175378552189,
    "gender_prob": 0,
    "nationality": "-",
    "name": "HUỲNH HỮU KHÁNH",
    "origin_location_label": "Nguyên quán: Mỹ Tịnh An",
    "name_fake_warning_prob": 0.03399733453989029,
    "gender": "-",
    "ethnicity": "Kinh",
    "religion_prob": 0.8739890212362463,
    "print_type_for_front_matching": "PRINTING",
    "expire_warning": "no",
    "issue_date_probs": [
      0.6632080078125
    ],
    "issue_date_warning": "yes",
    "nation_slogan": "Độc lập - Tự do - Hạnh phúc",
    "print_type": "printing",
    "valid_date_prob": 0,
    "origin_location_prob": 0.9999999885428144,
    "corner_warning": "yes",
    "valid_date": "-",
    "print_type_for_back_matching": "PRINTING",
    "issue_date": "30/05/2016",
    "id_fake_prob": 0,
    "nationality_prob": 0,
    "id_probs": "[1.0, 1.0, 1.0, 1.0, 1.0, 0.9999988, 1.0, 1.0, 0.9999976]",
    "citizen_id_prob": 0,
    "dob_fake_warning_prob": 0.06207531690597534,
    "features_prob": 0,
    "issue_place": "Tiền Giang",
    "dob_fake_warning": false,
    "name_fake_warning": "real",
    "type_id": 0,
    "ethnicity_prob": 0.8739890212362463,
    "card_type": "GIẤY CHỨNG MINH NHÂN DÂN",
    "quality_front": {
      "blur_score": 0.0173,
      "bright_spot_param": {
        "average_intensity": 180.34,
        "bright_spot_threshold": 0.55,
        "total_bright_spot_area": 0
      },
      "luminance_score": 0.7045,
      "final_result": {
        "bad_luminance_likelihood": "unlikely",
        "low_resolution_likelihood": "unlikely",
        "blurred_likelihood": "unlikely",
        "bright_spot_likelihood": "unlikely"
      },
      "bright_spot_score": 0,
      "resolution": [
        389
      ]
    },
    "religion": "Không",
    "birth_day": "02/07/2001",
    "issuedate_fake_warning": false,
    "tampering": {
      "is_legal": "yes",
      "warning": [
        "Khong gi het"
      ]
    }
  },
  "statusCode": 200,
  "challengeCode": "11111"
}
*/

  GetIDInfoResponseImgs? imgs;
  String? dataSign;
  String? dataBase64;
  String? logID;
  String? message;
  String? serverVersion;
  GetIDInfoResponseObject? object;
  int? statusCode;
  String? challengeCode;

  GetIDInfoResponse({
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
  GetIDInfoResponse.fromJson(Map<String, dynamic> json) {
    imgs = (json['imgs'] != null) ? GetIDInfoResponseImgs.fromJson(json['imgs']) : null;
    dataSign = json['dataSign']?.toString();
    dataBase64 = json['dataBase64']?.toString();
    logID = json['logID']?.toString();
    message = json['message']?.toString();
    serverVersion = json['server_version']?.toString();
    object = (json['object'] != null) ? GetIDInfoResponseObject.fromJson(json['object']) : null;
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
