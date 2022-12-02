import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:pika/src/data/api/ekyc_api_client.dart';
import 'package:pika/src/data/api/models/response/ekyc/ekyc_addfile_response.dart';
import 'package:pika/src/data/api/models/response/ekyc/ekyc_face_compare_response.dart';
import 'package:pika/src/data/api/models/response/ekyc/ekyc_get_id_info_response.dart';

import '../api_constants.dart';

class EkycService {
  Future<EkycAddfileResponse?> uploadFile(XFile file, String title, String desc) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
      'title': title,
      'description': desc,
    });

    final response = await EkycApiClient.getDio().post(
      ApiConstants.EKYC_ADDFILE,
      data: formData,
    );

    if (response.statusCode == 200) {
      return EkycAddfileResponse.fromJson(response.data);
    }

    return null;
  }

  Future<GetIDInfoResponse?> getInfo(String imgFront, String imgBack) async {
    final response = await EkycApiClient.getDio().post(
      ApiConstants.EKYC_GETINFO,
      data: {
        "img_front": imgFront,
        "img_back": imgBack,
        "client_session":
            "IOS_iphone6plus_ios13_Device_1.3.6_CC332797-E3E5-475F-8546-C9C4AA348837_${DateTime.now().millisecondsSinceEpoch}",
        "type": -1,
        "crop_param": "0.1,0.1",
        "validate_postcode": false,
        "token": ApiConstants.EKYC_TOKENID,
      },
    );

    if (response.statusCode == 200) {
      return GetIDInfoResponse.fromJson(response.data);
    }

    return null;
  }

  Future<FaceCompareResponse?> compareFace(String imgFront, String imgFace) async {
    final response = await EkycApiClient.getDio().post(
      ApiConstants.EKYC_COMPARE,
      data: {
        "img_front": imgFront,
        "img_face": imgFace,
        "client_session":
            "IOS_iphone6plus_ios13_Device_1.3.6_CC332797-E3E5-475F-8546-C9C4AA348837_${DateTime.now().millisecondsSinceEpoch}",
        "token": ApiConstants.EKYC_TOKENID,
      },
    );

    if (response.statusCode == 200) {
      return FaceCompareResponse.fromJson(response.data);
    }

    return null;
  }
}
