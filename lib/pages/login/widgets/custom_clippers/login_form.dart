import 'package:ecommerce/pages/pages.dart';
import 'package:ecommerce/services/locator.dart';
import 'package:flutter/material.dart';

import 'index.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;

  const LoginForm({
    @required this.animation,
  }) : assert(animation != null);

  @override
  Widget build(BuildContext context) {
    DataStorage _dataStorage = locator<DataStorage>();
    AuthenticationService _authService = locator<AuthenticationService>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: CustomInputField(
              label: 'Mobile Number',
              prefixIcon: Icons.phone_android,
              obscureText: false,
            ),
          ),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 32,
            child: CustomInputField(
              label: 'Password',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
          ),
          FadeSlideTransition(
              animation: animation,
              additionalOffset: 2 * 32.0,
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Login to continue'),
                onPressed: () {
                  _authService.registerUser("+918073748630");
                  // _dataStorage.storeUserData('PSU5Ql8Sr61W9riOwkrC');
                  // HomeRouter.navigate(context);
                },
              ))
        ],
      ),
    );
  }
}
