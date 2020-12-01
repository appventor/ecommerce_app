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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
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
          SizedBox(height: 32),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 32,
            child: CustomInputField(
              label: 'Password',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
          ),
          SizedBox(height: 32),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * 32.0,
            child: RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Login to continue'),
              onPressed: () {
                _dataStorage.storeUserData('username');
                HomeRouter.navigate(context);
              },
            ),
          ),
          SizedBox(height: 2 * 32.0),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 3 * 32.0,
            child: RaisedButton(
              color: Colors.white,
              textColor: Colors.black.withOpacity(0.5),
              child: Row(
                children: [
                  Text('Continue with Google'),
                  Image(
                    image: AssetImage("assets/images/google_logo.png"),
                    height: 48.0,
                  ),
                ],
              ),
              onPressed: () {
                _dataStorage.storeUserData('username');
                Navigator.of(context).pushReplacementNamed("/");
              },
            ),
          ),
          SizedBox(height: 32),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 4 * 32.0,
            child: RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Create a Bubble Account'),
              onPressed: () {
                _dataStorage.storeUserData('username');
                HomeRouter.navigate(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
