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
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text("My Profile"),
                onTap: () => ProfileRouter.navigate(context),
              ),
              ListTile(
                leading: Icon(Icons.favorite_outline),
                title: Text("My Wishlist"),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart_outlined),
                title: Text("My Cart"),
              ),
              ListTile(
                leading: Icon(Icons.assignment_outlined),
                title: Text("My Orders"),
              ),
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text("My Profile"),
              ),
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text("My Profile"),
              )
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
