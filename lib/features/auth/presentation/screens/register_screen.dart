import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_flutter_boilerplate/routes/app_route.gr.dart';
import 'package:sukant_flutter_boilerplate/routes/route_util.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/colors.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/dimens.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/image_constants.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/strings.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/text_styles.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/utils.dart';
import 'package:sukant_flutter_boilerplate/shared/widgets/custom_checkbox_widget.dart';
import 'package:sukant_flutter_boilerplate/shared/widgets/rounded_filled_button.dart';
import 'package:sukant_flutter_boilerplate/shared/widgets/text_field_widget.dart';

@RoutePage()
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool hasAgreed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(Dimens.spacing_24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    ImageConstants.icAppIcon,
                    height: Dimens.spacing_120,
                    width: Dimens.spacing_120,
                  ),
                  addVerticalSpace(Dimens.spacing_16),
                  registerWidget(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget registerWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          Strings.signUp,
          style: text2A4ECAs32w700,
        ),
        addVerticalSpace(Dimens.spacing_16),
        const Text(
          textAlign: TextAlign.center,
          Strings.registerMsg,
          style: text8F9098s14w500,
        ),
        addVerticalSpace(Dimens.spacing_24),
        CustomTextField(
            textController: _nameController, hintText: Strings.name),
        addVerticalSpace(Dimens.spacing_16),
        CustomTextField(
            textController: _emailController, hintText: Strings.email),
        addVerticalSpace(Dimens.spacing_16),
        CustomTextField(
          textController: _passwordController,
          hintText: Strings.password,
          obscureText: true,
        ),
        addVerticalSpace(Dimens.spacing_12),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCheckbox(isSelected: true),
            Text(Strings.iAgreeWithTerms)
          ],
        ),
        addVerticalSpace(Dimens.spacing_24),
        RoundedFilledButtonWidget(text: Strings.createAccount, onPress: () {}),
        addVerticalSpace(Dimens.spacing_12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              Strings.alreadyHaveAnAccount,
              style: text1F2024s14w400,
            ),
            InkWell(
              onTap: () {
                context.routePush(const LoginRoute());
              },
              child: const Padding(
                padding: EdgeInsets.all(Dimens.spacing_4),
                child: Text(
                  Strings.signIn,
                  style: text006FFDs14w600,
                ),
              ),
            ),
          ],
        ),
        addVerticalSpace(Dimens.spacing_16),
        Row(
          children: [
            addDivider(),
            addHorizontalSpace(Dimens.spacing_16),
            const Text(
              "Or",
              style: text1F2024s14w400,
            ),
            addHorizontalSpace(Dimens.spacing_16),
            addDivider(),
          ],
        ),
        addVerticalSpace(Dimens.spacing_16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ssoLoginWidget(ImageConstants.icGoogle, () {}),
            addHorizontalSpace(Dimens.spacing_16),
            ssoLoginWidget(ImageConstants.icFacebook, () {}),
            addHorizontalSpace(Dimens.spacing_16),
            ssoLoginWidget(ImageConstants.icApple, () {}),
          ],
        )
      ],
    );
  }

  Widget ssoLoginWidget(String image, Function() callback) {
    return InkWell(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteFFFFFF,
            borderRadius: BorderRadius.circular(Dimens.spacing_16)),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.spacing_16),
          child: Image.asset(
            image,
            height: Dimens.spacing_32,
            width: Dimens.spacing_32,
          ),
        ),
      ),
    );
  }
}
