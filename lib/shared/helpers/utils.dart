import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sukant_flutter_boilerplate/shared/enums/toast_type.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/colors.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/dimens.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/text_styles.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

Widget addDivider({Color color = AppColors.grey_rgba_E8E9F1}) {
  return Divider(
    height: 0,
    thickness: 1,
    color: color,
  );
}

extension ContextExtensions on BuildContext {
  void showToast(String title, ToastType type) {
    Color activeColor = AppColors.black_rgba_1F2024;
    if (type == ToastType.success) {
      activeColor = AppColors.green_rgba_0CCB6B;
    } else if (type == ToastType.info) {
      activeColor = AppColors.blue_rgba_006FFD;
    } else if (type == ToastType.warning) {
      activeColor = AppColors.orange_rgba_FF962E;
    } else {
      activeColor = AppColors.red_rgba_C51523;
    }
    var fToast = FToast();
    fToast.init(this);
    return fToast.showToast(
        gravity: ToastGravity.BOTTOM,
        child: Container(
          margin: const EdgeInsets.only(bottom: Dimens.spacing_0),
          height: Dimens.spacing_40,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          decoration: BoxDecoration(
            border: Border.all(color: activeColor),
            borderRadius: BorderRadius.circular(25.0),
            color: addWhite(activeColor, 0.9),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.spacing_2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  type == ToastType.success ? Icons.check_circle : Icons.info,
                  color: activeColor,
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Flexible(
                  child: Text(
                    title,
                    style: text_1F2024_12_w700,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Color addWhite(Color color, double whitePercentage) {
  whitePercentage = whitePercentage.clamp(0.0, 1.0);

  int red = (color.red + ((255 - color.red) * whitePercentage)).toInt();
  int green = (color.green + ((255 - color.green) * whitePercentage)).toInt();
  int blue = (color.blue + ((255 - color.blue) * whitePercentage)).toInt();

  return Color.fromARGB(color.alpha, red, green, blue);
}

Future<String> takePicture() async {
  try {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    return pickedImage?.path ?? '';
  } on PlatformException {
    return '';
  } on Exception {
    return '';
  }
}

String getCurrentDate() {
  return DateFormat('yyyy-MM-dd').format(DateTime.now());
}
