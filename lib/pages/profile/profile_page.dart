import 'package:flutter/material.dart';

import '../pages.dart';

class ProfileRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) => settings.name.startsWith('/profile');

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => Profile());

  static Future<T> navigate<T>(BuildContext context) =>
      Navigator.pushNamed<T>(context, '/profile');
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.pink,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        minRadius: 50,
                        child: Icon(
                          Icons.person_rounded,
                          size: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Profile Name",
                          style: context.primaryTextTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: Text(
                          "LEVEL",
                          style: context.accentTextTheme.caption,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.white,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        ListTile(
                          leading: Icon(Icons.bookmark_outline),
                          title: Text("My Orders"),
                        ),
                        ListTile(
                          leading: Icon(Icons.favorite_outline),
                          title: Text("My Wishlist"),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_balance_wallet_outlined),
                          title: Text("Account Statement"),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_tree_outlined),
                          title: Text("Direct Member"),
                        ),
                        ListTile(
                          leading: Icon(Icons.lock_outline),
                          title: Text("Change Password"),
                        ),
                        ListTile(
                          leading: Icon(Icons.person_add_outlined),
                          title: Text("Add Member"),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
          FloatingBar()
        ],
      ),
    );
  }
}

class FloatingBar extends StatelessWidget {
  const FloatingBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4.2,
      child: Card(
        elevation: 8,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [Text("SponsorID"), Text("ITM001234")],
                ),
              ),
              VerticalDivider(
                color: Colors.pink,
                // width: 10,
                thickness: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [Text("SponsorID"), Text("ITM001234")],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
