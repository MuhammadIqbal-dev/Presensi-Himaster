import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/screens/main_menu.dart';
import 'package:presensi_himaster/theme.dart';

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
                      flex: 3,
                    ),
                    Text(
                      'Log In',
                      style: semiBoldStyle(20.0, black),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Masukkan username dan password kamu yang sudah terdaftar',
                      style: textStyle(12, grayCr),
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
                              textInputAction: TextInputAction.next,
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
                                  await mainController.loginController(
                                      _emailTextController.text,
                                      _passTextController.text);
                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                  if (mainController.isLogin.value) {
                                    mainController.pageTransition(
                                        context, MainMenu());
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
    );
  }
}
