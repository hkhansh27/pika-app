import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:pika/src/data/api/models/response/ekyc/ekyc_addfile_response.dart';
import 'package:pika/src/data/api/models/response/ekyc/ekyc_face_compare_response.dart';
import 'package:pika/src/data/api/models/response/ekyc/ekyc_get_id_info_response.dart';

import '../api/services/ekyc_service.dart';

class EkycRepository {
  final _ekycService = Get.find<EkycService>();

//_imagesHash[0]: front
// _imagesHash[1]: back
// _imagesHash[2]: selfie
  List<String?> _imagesHash = [];

  Future<EkycAddfileResponse?> uploadFile(XFile file, String title, String desc) async {
    var data = await _ekycService.uploadFile(file, title, desc);

    if (data != null) {
      _imagesHash.add(data.object!.hash);
    }

    return data;
  }

  Future<GetIDInfoResponse?> getInfo() async {
    // var data = await _ekycService.getInfo(_imagesHash[0]!, _imagesHash[1]!);
    var data = await _ekycService.getInfo(
        "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_ef6c882c-7254-11ed-aaa4-8d6f78836c1d",
        "idg20221202-eed5f795-66da-7944-e053-62199f0a3d05/IDG01_26b5cc27-7272-11ed-9807-e9e7101545fa");
    return data;
  }

  Future<FaceCompareResponse?> compareFace() async {
    var data = await _ekycService.compareFace(_imagesHash[0]!, _imagesHash[2]!);
    return data;
  }
}
