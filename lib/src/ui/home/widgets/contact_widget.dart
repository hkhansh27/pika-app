import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/images.dart';

Widget contact({required String image, required String fullName, required String accountNo}) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(
          DefaultImages.user1,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        fullName,
        style: Get.textTheme.headline6!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
