import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pika/src/data/api/models/response/ekyc/ekyc_addfile_response.dart';
import 'package:pika/src/data/api/models/user_model.dart';
import 'package:pika/src/data/repositories/ekyc_repository.dart';
import 'package:pika/src/ui/proof/check_info_screen.dart';
import 'package:pika/src/ui/proof/upload_back_photo_screen.dart';
import 'package:pika/src/ui/proof/upload_id_screen.dart';

class ProofController extends GetxController {
  late Rx<CameraController> camController;
  late List<CameraDescription> _cameras;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> pswdController = TextEditingController().obs;
  RxBool isVisible = false.obs;
  final Rx<UserModel> userModel = UserModel().obs;

  final _ekycRepo = Get.find<EkycRepository>();

  @override
  void onInit() {
    super.onInit();
    initCamera();
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    camController = CameraController(_cameras[0], ResolutionPreset.max).obs;
    var cam = camController.value;
    cam.initialize().then((_) {
      if (!cam.value.isInitialized) {
        return;
      }
      update();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  void takePicture(String currentStage) async {
    var cam = camController.value;

    if (!cam.value.isInitialized) {
      return;
    }
    if (cam.value.isTakingPicture) {
      return;
    }

    try {
      // var file = await cam.takePicture();

      // if (file.path.isNotEmpty) {
      //   var data = await _ekycRepo.uploadFile(file, file.name, currentStage);
      //   if (data == null) {
      //     Get.snackbar(
      //       'Error',
      //       'Upload file failed',
      //       snackPosition: SnackPosition.BOTTOM,
      //     );
      //     return;
      //   }
      if (currentStage == 'front') {
        Get.to(
          UploadBackPhotoScreen(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 500),
        );
      }
      if (currentStage == 'back') {
        Get.to(
          UploadIdScreen(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 500),
        );
      }
      if (currentStage == 'selfie') {
        testInfo();
        Get.off(
          CheckInfoPage(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 500),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void testInfo() {
    // var info = await _ekycRepo.getInfo();
    // var compare = await _ekycRepo.compareFace();

//with ekyc api
    // userModel.value = UserModel(
    //   idCard: info!.object!.id,
    //   fullName: info.object!.name,
    //   address: info.object!.originLocation,
    //   birthDay: info.object!.birthDay,
    //   city: info.object!.issuePlace,
    //   issueDate: info.object!.issueDate,
    // );

    //with mock data
    userModel.value = UserModel(
      idCard: '1234567899',
      fullName: 'Huynh Huu Khanh',
      address: 'Cho Gao, Tien Giang',
      birthDay: '02/07/2001',
      city: 'Tien Giang',
      issueDate: '30/05/2016',
    );
  }

  void uploadFile(XFile file, String title, String desc) async {
    var data = await _ekycRepo.uploadFile(file, title, desc);
    if (data == null) {
      Get.snackbar(
        'Error',
        'Please try again later',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void compareFace() async {
    var data = await _ekycRepo.compareFace();
    if (data == null) {
      Get.snackbar(
        'Error',
        'Please try again later',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Face compare success',
        '${data.object?.msg}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
