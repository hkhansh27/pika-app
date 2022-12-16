import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';

Widget transactionList(
  String? image,
  Color? background,
  String? title,
  String? date,
  String? price,
  String? time,
) {
  return ListTile(
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
      title! == '045704070000581' ? 'Pika Saving' : title!,
      style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
    ),
    subtitle: Text(
      date!,
      style: Theme.of(Get.context!).textTheme.caption!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        price != ""
            ? Text(
                price!,
                style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: price.contains("-") ? Colors.red : Colors.green,
                    ),
              )
            : const SizedBox(),
        Text(
          time!,
          style: Theme.of(Get.context!).textTheme.caption!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    ),
  );
}
