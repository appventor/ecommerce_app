import 'package:flutter/material.dart';

import '../pages.dart';
import 'widgets/custom_clippers/index.dart';

class LoginRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) => settings.name.startsWith('/login');

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => Login());

  static Future<T> navigate<T>(BuildContext context) =>
      Navigator.pushNamed<T>(context, '/login');

  static Future<T> navigateFromSplash<T>(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/login');
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _headerTextAnimation;
  Animation<double> _formElementAnimation;
  Animation<double> _whiteTopClipperAnimation;
  Animation<double> _blueTopClipperAnimation;
  Animation<double> _greyTopClipperAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    var fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.6,
        curve: Curves.easeInOut,
      ),
    ));
    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.7,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    var clipperOffsetTween = Tween<double>(
      begin: 900,
      end: 0.0,
    );
    _blueTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.2,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.35,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.5,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(children: [
        AnimatedBuilder(
          animation: _whiteTopClipperAnimation,
          child: Container(
            color: Colors.grey,
          ),
          builder: (_, Widget child) {
            return ClipPath(
              clipper: WhiteTopClipper(
                yOffset: _whiteTopClipperAnimation.value,
              ),
              child: child,
            );
          },
        ),
        AnimatedBuilder(
          animation: _greyTopClipperAnimation,
          child: Container(
            color: Color(0xFF306EFF),
          ),
          builder: (_, Widget child) {
            return ClipPath(
              clipper: GreyTopClipper(
                yOffset: _greyTopClipperAnimation.value,
              ),
              child: child,
            );
          },
        ),
        AnimatedBuilder(
          animation: _blueTopClipperAnimation,
          child: Container(
            color: Colors.white,
          ),
          builder: (_, Widget child) {
            return ClipPath(
              clipper: BlueTopClipper(
                yOffset: _blueTopClipperAnimation.value,
              ),
              child: child,
            );
          },
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: <Widget>[
                Header(
                  animation: _headerTextAnimation,
                ),
                Spacer(),
                LoginForm(
                  animation: _formElementAnimation,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class FadeSlideTransition extends StatelessWidget {
  final Animation<double> animation;
  final double additionalOffset;
  final Widget child;

  const FadeSlideTransition({
    @required this.animation,
    @required this.additionalOffset,
    @required this.child,
  })  : assert(animation != null),
        assert(additionalOffset != null),
        assert(child != null);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (_, Widget builderChild) {
        return Transform.translate(
          offset: Offset(
            0.0,
            (32.0 + additionalOffset) * (1 - animation.value),
          ),
          child: Opacity(
            opacity: animation.value,
            child: builderChild,
          ),
        );
      },
    );
  }
}
