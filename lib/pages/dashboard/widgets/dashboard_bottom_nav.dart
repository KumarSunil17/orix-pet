import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar on 26-11-2020 09:04 PM.
///
ValueNotifier<int> bottomNavCurrentIndex = ValueNotifier(0);

class DashboardBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 5,
      child: Container(
        height: 68,
        decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(0, -1),
                  blurRadius: 2,
                  spreadRadius: 2)
            ]),
        padding: const EdgeInsets.fromLTRB(22, 0, 22, 4),
        child: ValueListenableBuilder<int>(
          valueListenable: bottomNavCurrentIndex,
          builder: (context, i, child) => Row(
            children: [
              Expanded(
                child: _BottomNavItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  isSelected: i == 0,
                  onTap: () => _onChangeIndex(0),
                ),
              ),
              Expanded(
                child: _BottomNavItem(
                  icon: Icon(Icons.group_outlined),
                  label: 'Group',
                  isSelected: i == 1,
                  onTap: () => _onChangeIndex(1),
                ),
              ),
              _CenterBottomNavItem(onTap: () {}),
              Expanded(
                child: _BottomNavItem(
                  icon: Icon(Icons.chat_outlined),
                  label: 'Chat',
                  isSelected: i == 2,
                  onTap: () => _onChangeIndex(2),
                ),
              ),
              Expanded(
                child: _BottomNavItem(
                  icon: Icon(Icons.person_outline_rounded),
                  label: 'Profile',
                  isSelected: i == 3,
                  onTap: () => _onChangeIndex(3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onChangeIndex(i) {
    bottomNavCurrentIndex.value = i;
  }
}

class _BottomNavItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  _BottomNavItem(
      {required this.icon,
      required this.label,
      this.isSelected = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.circle,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(18))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
          child: Column(
            children: [
              Container(
                  width: 32,
                  height: 8,
                  decoration: isSelected
                      ? BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                              BorderRadius.vertical(bottom: Radius.circular(6)))
                      : null),
              Expanded(
                  child: IconTheme(
                      data: IconThemeData(
                          color: isSelected ? Colors.amber : Colors.grey,
                          size: 26),
                      child: icon)),
              Text(
                label,
                style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.amber : Colors.grey,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CenterBottomNavItem extends StatelessWidget {
  final VoidCallback? onTap;

  _CenterBottomNavItem({this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Material(
        color: theme.primaryColor,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child:
                Center(child: Icon(Icons.add, size: 36, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
