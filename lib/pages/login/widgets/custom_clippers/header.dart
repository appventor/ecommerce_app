import 'package:flutter/material.dart';

import 'fadeslidetransition.dart';

class Header extends StatelessWidget {
  final Animation<double> animation;

  const Header({
    @required this.animation,
  }) : assert(animation != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlutterLogo(
            size: 48.0,
          ),
          const SizedBox(height: 16),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: Text(
              'Welcome to Estore',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: Text(
              'We are',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
        ],
      ),
    );
  }
}
