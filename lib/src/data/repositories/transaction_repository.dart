import 'dart:developer';

import 'package:get/get.dart';
import 'package:pika/src/data/api/models/response/auth/contact_response.dart';
import 'package:pika/src/data/api/models/response/transactions/transaction_history_response.dart';
import 'package:pika/src/data/api/models/user_model.dart';

import '../api/api_client.dart';
import '../api/models/response/transactions/transfer_response.dart';
import '../api/services/transaction_service.dart';
import '../api/services/user_service.dart';
import '../storage/app_storage.dart';

class TransactionRepository {
  final _userService = Get.find<UserService>();
  final _transactionService = Get.find<TransactionService>();
  final storage = Get.find<AppStorage>();

  Future<List<TransactionHistoryRespone>?> getTransactionHistory() async {
    try {
      final response = await _transactionService.getTransactionHistory();
      if (response == null) throw Exception('Get transactions failed');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<TransferRespone?> transfer(String amount, String desc, String toAccNo) async {
    try {
      final response = await _transactionService.transfer(amount, desc, toAccNo);
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<bool> addContact(String accNo) async {
    try {
      final response = await _transactionService.addContact(accNo);
      if (response == false) throw Exception('Add contact failed');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<ContactRespone>> getContacts() async {
    try {
      final response = await _transactionService.getContacts();
      //add response to set in order remove duplicate
      return response.toSet().toList();
    } catch (e) {
      throw Exception('Get contacts failed');
    }
  }
}
