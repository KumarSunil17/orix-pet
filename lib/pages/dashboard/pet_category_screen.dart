import 'package:flutter/material.dart';
import 'package:orix_pet/pages/dashboard/widgets/dashboard_header.dart';
import 'package:orix_pet/pages/dashboard/widgets/pet_sliver_delegate.dart';
import 'package:orix_pet/pages/post/widgets/post_card.dart';

import '../profile/pet_profile_screen.dart';

///
/// Created by Sunil Kumar on 07-12-2020 07:11 PM.
///
class PetCategoryScreen extends StatefulWidget {
  static const routeName = '/PetCategoryScreen';

  @override
  _PetCategoryScreenState createState() => _PetCategoryScreenState();
}

class _PetCategoryScreenState extends State<PetCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: PetSliverDelegate(
              expandedHeight: 165,
              appBarPadding: const EdgeInsets.fromLTRB(8, 14, 14, 14),
              leading: Material(
                  type: MaterialType.circle,
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  child: BackButton()),
              title: Text('Pet Adoption')),
        ),
        SliverToBoxAdapter(
            child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 21),
                shrinkWrap: true,
                children: [
              SizedBox(height: 21),
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://img.freepik.com/free-photo/group-portrait-adorable-puppies_53876-64778.jpg?size=626&ext=jpg'))),
              ),
              CatCategorySection(
                name: 'Dog\'s',
                image:
                    'https://img.freepik.com/free-vector/cute-pug-dog-playing-box-cartoon_138676-2306.jpg?size=338&ext=jpg',
              ),
              CatCategorySection(
                name: 'Cat\'s',
                image:
                    'https://img.freepik.com/free-vector/cute-corgi-dog-playing-box-cartoon_138676-2307.jpg?size=338&ext=jpg',
              ),
            ]))
      ]),
    );
  }
}

class CatCategorySection extends StatelessWidget {
  final String image;
  final String name;

  const CatCategorySection({this.image, this.name});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 300,
      margin: const EdgeInsets.only(top: 28),
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            elevation: 6,
            shadowColor: Colors.black12,
            child: Row(
              children: [
                SizedBox(width: 12),
                CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  radius: 20,
                ),
                SizedBox(width: 4),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Text(
                    'See all',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  textTheme: ButtonTextTheme.primary,
                )
              ],
            ),
          ),
          SizedBox(height: 14),
          Expanded(
              child: Row(
            children: [
              Expanded(child: PetCategoryCard()),
              SizedBox(width: 21),
              Expanded(child: PetCategoryCard())
            ],
          ))
        ],
      ),
    );
  }
}

class PetCategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PetProfileScreen.routeName);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(14),
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        )),
        child: Stack(
          children: [
            Positioned.fill(
                bottom: 80,
                child: Image.network(
                  'https://images.unsplash.com/photo-1548681528-6a5c45b66b42?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8cGV0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=fill&w=500&q=60',
                  fit: BoxFit.cover,
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(28))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kisa',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 2),
                      Text('Domestic short hair',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey)),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          PetPostHashTag(color: Colors.red, text: 'Adult'),
                          SizedBox(width: 8),
                          PetPostHashTag(color: Colors.amber, text: 'Male'),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class PetPostHashTag extends StatelessWidget {
  final String text;
  final Color color;

  const PetPostHashTag({this.text, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color, fontWeight: FontWeight.w600)),
        ));
  }
}
