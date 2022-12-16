import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';

import '../../../data/api/models/response/check_contact_response.dart';
import '../../../data/repositories/user_repository.dart';

class ContactController extends GetxController with StateMixin {
  final userRepo = Get.find<UserRepository>();
  final contacts = <CheckContactResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    getContacts();
  }

  void getContacts() async {
    change(null, status: RxStatus.loading());
    // get from device
    var deviceContacts = await ContactsService.getContacts();
    List<String?> phones = [];
    deviceContacts.forEach((contact) {
      contact.phones?.forEach((phone) {
        // return sympol and space before add
        var phoneNum = phone.value?.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '');

        // check phone number is valid
        if (phoneNum?.length == 10) {
          phones.add(phoneNum);
        }
      });
    });
    var systemContact = await userRepo.checkContact(phones);
    contacts.value = systemContact;
    change(null, status: RxStatus.success());
  }
}
