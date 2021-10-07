import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orix_pet/pages/dashboard/dashboard_screen.dart';
import 'package:orix_pet/widgets/buttons.dart';
import 'package:orix_pet/widgets/orix_header.dart';
import 'package:orix_pet/widgets/orix_pet_background.dart';

///
/// Created by Sunil Kumar on 11-11-2020 10:15 AM.
///
class SignUpScreen extends StatefulWidget {
  static const routeName = '/SignUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _visible = false;
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
                    const SizedBox(height: 28),
                    OrixHeader(),
                    const SizedBox(height: 32),
                    const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
                    ),
                    const Text(
                      'Enter your credentials to continue',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
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
                              Icon(Icons.person_outline_rounded,
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
                          labelText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.grey)),
                          labelStyle: TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(height: 14),
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
                    const SizedBox(height: 14),
                    TextFormField(
                      validator: (v) {
                        if (v?.trim().isEmpty ?? true) return '*required';
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
                    const SizedBox(height: 18),
                    OrixPrimaryButton(
                      child: Text('Sign up'),
                      onPressed: () {
                        Navigator.pushNamed(context, DashboardScreen.routeName);
                      },
                    ),
                    const SizedBox(height: 14),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text('Already have an account?'),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
                          child: Text('Log in',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600)),
                        ),
                      )
                    ]),
                    const SizedBox(height: 14),
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
