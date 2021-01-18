import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'widgets/pet_app_bar.dart';

///
/// Created by Sunil Kumar on 21-12-2020 10:59 AM.
///
class SettingsScreen extends StatelessWidget {
  static const routeName = '/SettingsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              PetAppBar(
                leading:
                    Image.asset('assets/icons/logo.png', height: 42, width: 42),
                trailing: Material(
                  type: MaterialType.circle,
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close)),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SettingsTile('Profile & Account', 'Edit your profile'),
                    SettingsTile('Push-Notifications', 'Setup notifications'),
                    SettingsTile('Setting', 'Change your settings'),
                    SettingsTile('FAQs', 'Frequently asked questions'),
                    SettingsTile('Logout', 'In case you want to switch account',
                        trailing: Icon(Icons.logout, color: Colors.black)),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              'assets/icons/paws.svg',
              width: MediaQuery.of(context).size.width - 120,
            ),
          )
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title, subtitle;

  final Widget trailing;

  SettingsTile(this.title, this.subtitle, {this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
      ),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
      trailing: trailing ?? Icon(Icons.navigate_next, color: Colors.black),
    );
  }
}
