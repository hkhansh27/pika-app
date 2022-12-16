import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';

Widget notificationsList(
  String? image,
  Color? background,
  String? title,
  String? message,
  String? date,
) {
  return Column(
    children: [
      ListTile(
        isThreeLine: true,
        leading: image != ""
            ? SvgPicture.asset(
                image!,
                height: 40,
                width: 40,
              )
            : Image.asset(
                DefaultImages.transaction2,
                height: 40,
                width: 40,
              ),
        title: Text(
          title!,
          style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message!,
              style: Theme.of(Get.context!).textTheme.caption!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              date!,
              style: Theme.of(Get.context!).textTheme.caption!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    ],
  );
}
