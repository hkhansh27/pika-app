import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/textstyle.dart';

Widget customContainer({String? title, String? background, Color? textColor}) {
  return Container(
    height: 28,
    decoration: BoxDecoration(color: HexColor(background!), borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        title!,
        style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: textColor!,
            ),
      ),
    ),
  );
}
