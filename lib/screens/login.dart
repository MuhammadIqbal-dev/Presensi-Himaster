import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/screens/main_menu.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/alert_dialog_login.dart';
import 'package:presensi_himaster/widgets/custom_alert_loading.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();

  // bool _autoValidate = false;
  final mainController = Get.find<MainController>();
  final RxBool _passVisible = false.obs;
  final RxBool validate = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 0.9 * getHeight(context),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(
                          flex: 3,
                        ),
                        Image.asset(
                          'assets/imgs/logo.png',
                          color: blueCr,
                          width: 60,
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Text(
                          'Log In',
                          style: semiBoldStyle(20.0, black),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(
                            'Masukkan username dan password kamu yang sudah terdaftar',
                            style: textStyle(12, grayCr),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 7,
                    child: Obx(
                      () => Form(
                          key: _key,
                          autovalidateMode: validate.value
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 0.96 * getWidth(context),
                                height: 82,
                                child: TextFormField(
                                  controller: _emailTextController,
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  textAlign: TextAlign.left,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email is required.';
                                    }
                                    if (!value.contains('@') ||
                                        !value.contains('.')) {
                                      return 'Email invalid.';
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      labelText: 'Username',
                                      enabledBorder: blueBorder,
                                      focusedBorder: focusedBorder,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0)),
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 16.0)),
                                ),
                              ),
                              SizedBox(
                                width: 0.96 * getWidth(context),
                                child: TextFormField(
                                  controller: _passTextController,
                                  keyboardType: TextInputType.visiblePassword,
                                  autocorrect: false,
                                  textAlign: TextAlign.left,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is required.';
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.done,
                                  textAlignVertical: TextAlignVertical.center,
                                  obscureText: !_passVisible.value,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        color: blueCr,
                                        icon: Icon(_passVisible.value
                                            ? Icons.visibility_rounded
                                            : Icons.visibility_off_rounded),
                                        onPressed: () {
                                          _passVisible.value = !_passVisible.value;
                                        },
                                      ),
                                      enabledBorder: blueBorder,
                                      focusedBorder: focusedBorder,
                                      labelText: 'Password',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0)),
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 16.0)),
                                ),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                              SizedBox(
                                width: 0.96 * getWidth(context),
                                height: 0.07 * getHeight(context),
                                child: OutlinedButton(
                                    style: roundedButton(blueCr),
                                    onPressed: () async {
                                      // _autoValidate = true;
                                      validate.value = true;
                                      CustomAlertLoading().showAlertDialog(context);
                                      await mainController.loginController(
                                          _emailTextController.text,
                                          _passTextController.text);
                                      Navigator.pop(context);
                                      if (mainController.isLogin.value) {
                                        await AlertResponses().showAlertDialog(
                                            context,
                                            mainController.isLogin.value,
                                            mainController
                                                .userAbsen.value.user!.name);
                                        mainController.pageTransition(
                                            context, MainMenu());
                                      } else {
                                        AlertResponses().showAlertDialog(context,
                                            mainController.isLogin.value, "");
                                      }
                                    },
                                    child: const Text('Login Sekarang')),
                              ),
                              const Spacer(
                                flex: 3,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
