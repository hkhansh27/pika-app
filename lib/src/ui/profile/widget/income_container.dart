import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pika/src/res/textstyle.dart';

Widget incomeContainer(BuildContext context, String? title, String? amount, String? image) {
  return Container(
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppTheme.isLightTheme == false
          ? const Color(0xff323045)
          : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title!,
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                image!,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              amount!,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ],
        )
      ],
    ),
  );
}
