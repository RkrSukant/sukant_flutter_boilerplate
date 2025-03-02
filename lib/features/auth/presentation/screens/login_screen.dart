import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/dimens.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/image_constants.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/strings.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/text_styles.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/utils.dart';
import 'package:sukant_flutter_boilerplate/shared/widgets/text_field_widget.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_24),
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
            const Text(
              Strings.login,
              style: text1F2024s32w900,
            ),
            addVerticalSpace(Dimens.spacing_8),
            const Text(
              Strings.loginMsg,
              style: text8F9098s14w500,
            ),
            addVerticalSpace(Dimens.spacing_16),
            const Text(
              Strings.email,
              style: text1F2024s16w600,
            ),
            addVerticalSpace(Dimens.spacing_8),
            CustomTextField(
                textController: _emailController, hintText: Strings.enterEmail),
            addVerticalSpace(Dimens.spacing_16),
            const Text(
              Strings.password,
              style: text1F2024s16w600,
            ),
            addVerticalSpace(Dimens.spacing_8),
            CustomTextField(
              textController: _passwordController,
              hintText: Strings.enterEmail,
              obscureText: true,
            ),
            addVerticalSpace(Dimens.spacing_16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(Dimens.spacing_4),
                      child: Text(
                        Strings.forgotPassword,
                        style: text8F9098s12w700,
                      ),
                    )),
              ],
            ),
            addVerticalSpace(Dimens.spacing_16),
            //todo button
            addVerticalSpace(Dimens.spacing_36),
            //todo login
            addVerticalSpace(Dimens.spacing_24),
            //todo SSO buttons
            addVerticalSpace(Dimens.spacing_48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(Strings.dontHaveAnAccount),
                InkWell(
                  onTap:(){},
                  child: const Padding(
                    padding: EdgeInsets.all(Dimens.spacing_4),
                    child: Text(Strings.register, style: text006FFDs14w600,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
