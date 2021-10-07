import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar on 17-11-2020 08:20 AM.
///

class OrixPrimaryButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const OrixPrimaryButton({required this.child, this.onPressed, Key? key})
      : super(key: key);

  @override
  OrixPrimaryButtonState createState() => OrixPrimaryButtonState();
}

class OrixPrimaryButtonState extends State<OrixPrimaryButton> {
  bool _isLoading = false;

  void showLoader() {
    setState(() {
      _isLoading = true;
    });
  }

  void hideLoader() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(0.0),
              onPrimary: Colors.white,
            ),
            child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade400, theme.primaryColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  constraints: BoxConstraints.expand(height: 50.0),
                  alignment: Alignment.center,
                  child: widget.child,
                )),
          );
  }
}

class OrixFlatButton extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onPressed;

  const OrixFlatButton({this.child, this.onPressed, Key? key})
      : super(key: key);

  @override
  OrixFlatButtonState createState() => OrixFlatButtonState();
}

class OrixFlatButtonState extends State<OrixFlatButton> {
  bool _isLoading = false;

  void showLoader() {
    setState(() {
      _isLoading = true;
    });
  }

  void hideLoader() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : TextButton(
            onPressed: widget.onPressed,
            child: Ink(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Container(
                  constraints:
                      BoxConstraints.tightFor(width: 350.0, height: 34.0),
                  alignment: Alignment.center,
                  child: widget.child,
                )),
            style: TextButton.styleFrom(
                primary: theme.primaryColor,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
          );
  }
}
