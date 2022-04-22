import 'package:flutter/material.dart';
import 'package:presensi_himaster/theme.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();

  final bool _autoValidate = true;
  final ThemeConfig size = ThemeConfig();
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
                      style: semiBoldStyle,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Masukkan username dan password kamu yang sudah terdaftar',
                      style: descStyle,
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 7,
                child: Form(
                    key: _key,
                    autovalidateMode: _autoValidate
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 0.96 * size.getWidth(context),
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
                          width: 0.96 * size.getWidth(context),
                          child: TextFormField(
                            controller: _passTextController,
                            keyboardType: TextInputType.emailAddress,
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
                            decoration: InputDecoration(
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
                          width: 0.96 * size.getWidth(context),
                          height: 0.07 * size.getHeight(context),
                          child: OutlinedButton(
                              style: roundedBox,
                              onPressed: () {},
                              child: const Text('Login Sekarang')),
                        ),
                        const Spacer(
                          flex: 3,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
