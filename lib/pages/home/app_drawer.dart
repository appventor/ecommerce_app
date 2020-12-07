import 'package:ecommerce/services/locator.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pushNamed("/profile"),
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 150,
                  child: Row(
                    children: [
                      CircleAvatar(
                        minRadius: 60,
                        backgroundImage:
                            NetworkImage("https://picsum.photos/150"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Profile Name",
                              style: context.textTheme.headline6,
                            ),
                            Row(
                              children: [
                                Icon(Icons.email),
                                Text("email@org.com")
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.phone),
                                Text("+91 8073748630")
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text("My Profile"),
                onTap: () => Navigator.of(context).pushNamed("/profile"),
              ),
              ListTile(
                leading: Icon(Icons.favorite_outline),
                title: Text("My Wishlist"),
                onTap: () => Navigator.of(context).pushNamed("/wishlist"),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart_outlined),
                title: Text("My Cart"),
                onTap: () => Navigator.of(context).pushNamed("/cart"),
              ),
              ListTile(
                leading: Icon(Icons.assignment_outlined),
                title: Text("My Orders"),
                onTap: () => Navigator.of(context).pushNamed("/orders"),
              ),
              // ListTile(
              //   leading: Icon(Icons.account_circle_outlined),
              //   title: Text("My Profile"),
              // ),
              // ListTile(
              //   leading: Icon(Icons.account_circle_outlined),
              //   title: Text("My Profile"),
              // )
            ],
          ),
          Spacer(),
          RaisedButton.icon(
            icon: Icon(Icons.exit_to_app_outlined),
            label: Text("Logout"),
            onPressed: () {
              DataStorage store = locator<DataStorage>();
              store.storeUserData('login');
              Navigator.of(context).pushReplacementNamed("/login");
            },
          ),
          Spacer()
        ],
      ),
    );
  }
}
