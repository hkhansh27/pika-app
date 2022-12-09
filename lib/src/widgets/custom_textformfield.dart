import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../res/textstyle.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? textEditingController;
  final Widget? sufix;
  final Widget? prefix;
  final bool obscure;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? limit;
  final TextCapitalization capitalization;
  final TextInputType? inputType;
  final bool? readOnly;
  final Function(String)? onChangedFunc;

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.textEditingController,
    this.initialValue,
    this.errorText,
    this.onChangedFunc,
    this.sufix,
    this.prefix,
    this.obscure = false,
    this.limit,
    this.labelText,
    required this.capitalization,
    this.inputType,
    this.readOnly = false,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 57,
          decoration: BoxDecoration(
              color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffF9F9FA),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: onChangedFunc,
                  controller: textEditingController,
                  obscureText: obscure,
                  focusNode: focusNode,
                  textCapitalization: capitalization,
                  keyboardType: inputType,
                  readOnly: readOnly!,
                  inputFormatters: limit,
                  initialValue: initialValue,
                  decoration: InputDecoration(
                    prefixIcon: prefix,
                    suffixIcon: sufix,
                    labelText: labelText,
                    //   labelStyle: pRegular14,
                    hintText: hintText,
                    // hintStyle: pRegular14.copyWith(
                    //   color: ConstColors.textColor.withOpacity(0.5),
                    // ),
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        errorText != null
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  bottom: 10,
                ),
                child: Text(
                  errorText!,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.red,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
