import 'package:pika/src/data/api/models/response/auth/contact_response.dart';
import 'package:pika/src/data/api/models/response/auth/register_response.dart';
import 'package:pika/src/data/api/models/response/auth/login_response.dart';
import 'package:pika/src/data/api/models/response/otp/send_otp_response.dart';
import 'package:pika/src/data/api/models/response/otp/verify_otp_response.dart';
import 'package:pika/src/data/api/models/response/transactions/transfer_response.dart';
import 'package:pika/src/data/api/models/user_model.dart';

import '../api_client.dart';
import '../api_constants.dart';
import '../models/response/transactions/transaction_history_response.dart';

class TransactionService {
  Future<TransferRespone?> transfer(String amount, String desc, String toAccNo) async {
    final response = await ApiClient.getDio().post(ApiConstants.TRANSFER, data: {
      "amount": amount,
      "description": desc,
      "toAccountNo": toAccNo,
    });
    if (response.statusCode == 200) {
      return TransferRespone.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<List<TransactionHistoryRespone>?> getTransactionHistory() async {
    final response = await ApiClient.getDio().get(ApiConstants.GET_TRANSACTION);
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => TransactionHistoryRespone.fromJson(e)).toList();
    } else {
      throw Exception('Get transactions failed');
    }
  }

  Future<bool> addContact(String accountNo) async {
    final response = await ApiClient.getDio().post('${ApiConstants.ADD_CONTACT}/$accountNo');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<ContactRespone>> getContacts() async {
    final response = await ApiClient.getDio().get(ApiConstants.GET_CONTACTS);
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => ContactRespone.fromJson(e)).toList();
    } else {
      throw Exception('Get contacts failed');
    }
  }
}
