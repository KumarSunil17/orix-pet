import 'package:flutter/material.dart';
import 'dart:ui';

///
/// AcceptDenySwitch(
///    textOffAfter: 'Denied',
///    textOffBefore: 'Deny',
///    textOnBefore: 'Accept',
///    textOnAfter: 'Accepted',
///    colorOn: Colors.green,
///    colorOff: Colors.red,
///    onChanged: (b) {
///      print(b);
///      this.state = b;
///    },
///    initialValue: state,
/// )
///

class AcceptDenySwitch extends StatefulWidget {
  @required
  final SwitchState initialValue;
  @required
  final Function(SwitchState) onChanged;
  final String textOffBefore;
  final String textOffAfter;
  final String textOnBefore;
  final String textOnAfter;
  final Color colorOn;
  final Color colorOff;
  final double textSize;

  AcceptDenySwitch(
      {this.initialValue,
      this.onChanged,
      this.textOffBefore,
      this.textOffAfter,
      this.textOnBefore,
      this.textOnAfter,
      this.colorOn,
      this.colorOff,
      this.textSize});

  @override
  _RollingSwitchState createState() => _RollingSwitchState();
}

class _RollingSwitchState extends State<AcceptDenySwitch> {
  SwitchState state = SwitchState.initial;
  @override
  void initState() {
    super.initState();
    state = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant AcceptDenySwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue)
      setState(() {
        state = widget.initialValue;
      });
  }

  @override
  build(BuildContext context) {
    return Container(
      width: 300,
      height: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Stack(
        children: [
          Positioned.fill(
              child: Row(children: [
            if (state == SwitchState.denied || state == SwitchState.initial)
              Expanded(
                child: Container(
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: widget.colorOff.withOpacity(0.3),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                          right: state == SwitchState.denied
                              ? Radius.circular(50)
                              : Radius.zero)),
                  child: Text(
                      state == SwitchState.denied
                          ? widget.textOffAfter
                          : widget.textOffBefore,
                      style: TextStyle(fontSize: 22, color: widget.colorOff)),
                ),
              ),
            if (state == SwitchState.accepted || state == SwitchState.initial)
              Expanded(
                child: Container(
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: widget.colorOn.withOpacity(0.3),
                      borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(50),
                          left: state == SwitchState.accepted
                              ? Radius.circular(50)
                              : Radius.zero)),
                  child: Text(
                      state == SwitchState.accepted
                          ? widget.textOnAfter
                          : widget.textOnBefore,
                      style: TextStyle(fontSize: 22, color: widget.colorOn)),
                ),
              ),
          ])),
          if (state == SwitchState.initial)
            Dismissible(
              key: ValueKey(1),
              // dismissThresholds: {
              //   DismissDirection.startToEnd: 0.4,
              //   DismissDirection.endToStart: 0.4,
              // },
              child: Center(
                child: Container(
                  height: 120,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  alignment: Alignment.center,
                  child: Text(
                    '<>',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ),
              ),
              onDismissed: (d) {
                setState(() {
                  if (d == DismissDirection.startToEnd) {
                    state = SwitchState.accepted;
                  } else {
                    state = SwitchState.denied;
                  }
                });
                widget.onChanged?.call(state);
              },
              confirmDismiss: (d) async => true,
            ),
        ],
      ),
    );
  }
}

enum SwitchState { initial, accepted, denied }
