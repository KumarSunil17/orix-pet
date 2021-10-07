import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 14, 14, 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(22)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 15,
                      offset: Offset(0, 2),
                      spreadRadius: 10)
                ]),
            child: SafeArea(
                child: Row(children: [
              BackButton(),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Profile',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
              Material(
                type: MaterialType.circle,
                color: theme.primaryColor,
                child: InkWell(
                  onTap: () {},
                  customBorder: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(Icons.search_rounded, color: Colors.white),
                  ),
                ),
              ),
              Material(
                type: MaterialType.circle,
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings_rounded),
                ),
              )
            ])),
          ),
          preferredSize: Size(size.width, 100)),
      body: ListView(
        children: [
          SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '407',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    Text('Following',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey)),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 28,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '14.7K',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    Text('Followers',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          Center(child: Text('Esther Howard',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600)),
          ),
          Center(child: Text('Pet owner',style: TextStyle(color: Colors.grey))),
          
        ],
      ),
    );
  }
}
