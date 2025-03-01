import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/colors.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/dimens.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final TextInputType inputType;
  final String hintText;
  final bool hasError;
  final bool obscureText;
  final bool isEnabled;
  final bool isReadOnly;
  final Function(String)? onChanged;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;

  const CustomTextField({
    super.key,
    required this.textController,
    required this.hintText,
    this.hasError = false,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.decoration,
    this.onChanged,
    this.onTap,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: text_1F2024_14_w400,
      keyboardType: inputType,
      controller: textController,
      enabled: isEnabled,
      readOnly: isReadOnly,
      inputFormatters: inputFormatters ?? [],
      onChanged: (onChanged != null) ? onChanged : (value) {},
      onTap: (onTap != null) ? onTap : () {},
      decoration: (decoration != null)
          ? decoration
          : InputDecoration(
              errorText: hasError ? "" : null,
              errorStyle: const TextStyle(fontSize: 0),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.blackC5C6CC),
                borderRadius: BorderRadius.circular(Dimens.spacing_120),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: Dimens.spacing_12, horizontal: Dimens.spacing_16),
              filled: true,
              hintText: hintText,
              fillColor: const AppColors().whiteFFFFFF,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.blackC5C6CC),
                borderRadius: BorderRadius.circular(Dimens.spacing_120),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.redED3241),
                borderRadius: BorderRadius.circular(Dimens.spacing_120),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.blue006FFD),
                  borderRadius: BorderRadius.circular(Dimens.spacing_120)),
            ),
    );
  }
}
