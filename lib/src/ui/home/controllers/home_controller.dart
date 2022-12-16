import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pika/src/data/api/models/transaction_model.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';

import '../../../data/api/models/user_model.dart';
import '../../../data/repositories/user_repository.dart';

class HomeController extends GetxController with StateMixin {
  List<TransactionModel> transactionList = List<TransactionModel>.empty().obs;
  RxBool isWeek = true.obs;
  RxBool isMonth = false.obs;
  RxBool isYear = false.obs;
  RxBool isAdd = false.obs;
  final Rx<UserModel?> userModel = UserModel().obs;
  final balance = "".obs;

  final _userRepo = Get.find<UserRepository>();

  @override
  void onInit() {
    super.onInit();
    customInit();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    change(null, status: RxStatus.loading());
    userModel.value = await _userRepo.getUserInfo();
    balance.value = await _userRepo.getBalance();
    change(null, status: RxStatus.success());
  }

  customInit() {
    isWeek.value = true;
    isMonth.value = false;
    isYear.value = false;
    transactionList = [
      TransactionModel(
        Theme.of(Get.context!).textTheme.headline6!.color,
        DefaultImages.logoHutech,
        "HUTECH Tuiton Fee",
        "iPhone 12 Case",
        "- \$120,90",
        "09:39 AM",
      )
    ];
  }
}

enum HomeState { initial, loading, loaded, error }
