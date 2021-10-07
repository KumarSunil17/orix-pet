import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orix_pet/pages/authentication/login_screen.dart';
import 'package:orix_pet/pages/authentication/signup_screen.dart';
import 'package:orix_pet/pages/dashboard/dashboard_screen.dart';
import 'package:orix_pet/widgets/buttons.dart';
import 'package:orix_pet/widgets/orix_header.dart';
import 'package:orix_pet/widgets/orix_pet_background.dart';

///
/// Created by Sunil Kumar on 11-11-2020 10:15 AM.
///
class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgotPasswordScreen';

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<OrixPrimaryButtonState> _buttonKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: EdgeInsets.fromLTRB(
                      22, 0, 22, MediaQuery.of(context).viewInsets.bottom),
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    OrixHeader(),
                    SizedBox(height: 48),
                    Text(
                      'Forgot password',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Enter your email to get password reset link',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      validator: (v) {
                        if (v?.trim().isEmpty ?? true) return '*required';
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
                    OrixPrimaryButton(
                      key: _buttonKey,
                      child: Text('Send email'),
                      onPressed: () {
                        _buttonKey.currentState?.showLoader();
                        Future.delayed(Duration(seconds: 2)).then((value) {
                          _buttonKey.currentState?.hideLoader();
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        });
                      },
                    ),
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
