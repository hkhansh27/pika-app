import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:pika/src/data/api/models/response/auth/contact_response.dart';
import 'package:pika/src/data/api/models/transaction_model.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/routes/app_pages.dart';
import 'package:pika/src/ui/home/home.dart';

import '../../../data/repositories/transaction_repository.dart';
import '../../../data/repositories/user_repository.dart';
import '../transfer_detail_screen.dart';

class TransactionController extends GetxController {
  RxBool isWeek = true.obs;
  RxBool isMonth = false.obs;
  RxBool isYear = false.obs;
  RxBool isAdd = false.obs;
  final transactionList = List<TransactionModel>.empty().obs;
  final contactList = List<ContactRespone>.empty().obs;
  Rx<TextEditingController> numberAccount = TextEditingController().obs;
  Rx<TextEditingController> nameAccount = TextEditingController().obs;
  late StreamSubscription<bool> keyboardSubscription;
  final accountNameError = false.obs;
  String? code;

  final _transactionRepo = Get.find<TransactionRepository>();
  final _userRepo = Get.find<UserRepository>();

  @override
  void onInit() {
    super.onInit();
    customInit();
    getContacts();
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      print('Keyboard visibility update. Is visible: $visible');
      if (!visible) {
        getNameByAccountNo(null);
      }
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  customInit() async {
    var transactions = await _transactionRepo.getTransactionHistory();
    var user = await _userRepo.getUserInfo();
    if (transactions == null) {
      return;
    }

    transactionList.value = transactions.map((transaction) {
      var isMine = transaction.fromAccountNo == user!.accountNo!;
      var date = DateFormat.yMMMMEEEEd().format(DateTime.parse(transaction.createdAt!));
      var time = DateFormat.jm().format(DateTime.parse(transaction.createdAt!));

      return TransactionModel(
        HexColor(AppTheme.primaryColorString!).withOpacity(0.10),
        DefaultImages.transaction3,
        isMine ? transaction.toAccountNo : transaction.fromAccountNo,
        date,
        isMine ? '-${transaction.amount}VND' : '+${transaction.amount}VND',
        time,
      );
    }).toList();
  }

  getNameByAccountNo(String? code) async {
    if (code != null || numberAccount.value.text.isNotEmpty) {
      EasyLoading.show(status: 'Loading ...');
      var name = await _userRepo.getNameByAccountNo(code ?? numberAccount.value.text);
      this.code = code;
      EasyLoading.dismiss();
      accountNameError.value = name == null;
      nameAccount.value.text = name ?? '';
    }
  }

  goToTransferDetailScreen() {
    if (nameAccount.value.text.isEmpty) {
      EasyLoading.showError('Please enter an valid account number');
      return;
    }
    Get.to(
      () => TransferDetailScreen(accountNo: code ?? numberAccount.value.text, accountName: nameAccount.value.text),
      binding: HomeBinding(),
    );
  }

  getContacts() {
    try {
      EasyLoading.show(status: 'Loading...');
      _transactionRepo.getContacts().then((value) {
        EasyLoading.dismiss();
        if (value.isNotEmpty) {
          contactList.value = Set<ContactRespone>.from(value).toList();
        }
      });
    } catch (e) {
      EasyLoading.dismiss();
    }
  }
}
