import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orix_pet/pages/authentication/signup_screen.dart';
import 'package:orix_pet/pages/dashboard/dashboard_screen.dart';
import 'package:orix_pet/widgets/buttons.dart';
import 'package:orix_pet/widgets/orix_header.dart';
import 'package:orix_pet/widgets/orix_pet_background.dart';

///
/// Created by Sunil Kumar on 11-11-2020 10:15 AM.
///
class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreens';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _visible = false;
  final GlobalKey<OrixPrimaryButtonState> _buttonKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: OrixPetBackground(
        colors: const [
          Color(0xffACFFF9),
          Color(0xffC5FFBC),
          Color(0xffFFCCC5),
          Color(0xffACFFF9)
        ],
        child: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    OrixHeader(),
                    SizedBox(height: 48),
                    Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Enter your email and password',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      validator: (v) {
                        if (v.trim().isEmpty) return '*required';
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 12),
                              Icon(Icons.mail_outline_rounded,
                                  color: Colors.black),
                              SizedBox(width: 12),
                              Container(
                                height: 48,
                                width: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 12),
                            ],
                          ),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.grey)),
                          labelStyle: TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(height: 14),
                    TextFormField(
                      validator: (v) {
                        if (v.trim().isEmpty) return '*required';
                        return null;
                      },
                      obscureText: _visible,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 12),
                              Icon(Icons.lock_outline_rounded,
                                  color: Colors.black),
                              SizedBox(width: 12),
                              Container(
                                height: 48,
                                width: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 12),
                            ],
                          ),
                          labelText: 'Password',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _visible = !_visible;
                                });
                              },
                              child: Icon(
                                  _visible
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                  color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.grey)),
                          labelStyle: TextStyle(color: Colors.grey)),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        behavior: HitTestBehavior.translucent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text('Forgot password!',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                    OrixPrimaryButton(
                      key: _buttonKey,
                      child: Text('Log in'),
                      onPressed: () {
                        _buttonKey.currentState.showLoader();
                        Future.delayed(Duration(seconds: 2)).then((value) {
                          _buttonKey.currentState.hideLoader();
                          Navigator.pushNamed(
                              context, DashboardScreen.routeName);
                        });
                      },
                    ),
                    SizedBox(height: 14),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Don\'t have an account?'),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
                          child: Text('Sign up',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600)),
                        ),
                      )
                    ]),
                    SizedBox(height: 14),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  'assets/icons/paws.svg',
                  width: MediaQuery.of(context).size.width - 80,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
