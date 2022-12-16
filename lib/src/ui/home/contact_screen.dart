import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/widgets/custom_textfield.dart';

import '../chat/chat.dart';
import 'controllers/contact_controller.dart';
import 'transaction_history_detail_screen.dart';

class ContactScreen extends GetView<ContactController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppTheme.isLightTheme == false
                ? HexColor('#15141f')
                : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
            elevation: 0,
            leading: InkWell(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).textTheme.headline6!.color,
              ),
            ),
            title: Text(
              "History",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                color: AppTheme.isLightTheme == false
                    ? HexColor('#15141f')
                    : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(children: [
                    const SizedBox(height: 16),
                    CustomTextField(
                      hintText: "Search",
                      widget: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          DefaultImages.searchNormal,
                        ),
                      ),
                      color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffFAFAFA),
                      radius: 12,
                      textEditingController: TextEditingController(),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: Get.height - 200,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 16),
                                  child: Text(
                                    "Today",
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff9CA3AF),
                                        ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  children: [
                                    Obx(
                                      () => ListView.builder(
                                        shrinkWrap: true,
                                        physics: const ClampingScrollPhysics(),
                                        itemCount: controller.contacts.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Get.to(() => ChatScreen(code: controller.contacts[index].accountNo!));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor: HexColor(AppTheme.primaryColorString!),
                                                    child: SvgPicture.asset(
                                                      DefaultImages.sort,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          controller.contacts[index].fullName!,
                                                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                        ),
                                                        const SizedBox(height: 4),
                                                        Text(
                                                          controller.contacts[index].accountNo!,
                                                          style: Theme.of(context).textTheme.caption!.copyWith(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w400,
                                                                color: const Color(0xff9CA3AF),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: HexColor(AppTheme.primaryColorString!),
                  child: SvgPicture.asset(
                    DefaultImages.sort,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
