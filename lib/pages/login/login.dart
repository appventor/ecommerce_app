import 'package:ecommerce/services/locator.dart';
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
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  TextEditingController _mobileNo, _pin;
  AnimationController _animationController, _pinFormController;
  Animation<double> _headerTextAnimation;
  Animation<double> _formElementAnimation;
  Animation<double> _pincodeAnimation;

  bool _loading = false;
  bool _showPIN = false;

  @override
  void initState() {
    super.initState();
    _mobileNo = TextEditingController();
    _pin = TextEditingController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _pinFormController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
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
    _pincodeAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _pinFormController,
      curve: Interval(
        0.0,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _mobileNo.dispose();
    _pin.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Header(
              animation: _headerTextAnimation,
            ),
            FadeSlideTransition(
              animation: _formElementAnimation,
              additionalOffset: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  controller: _mobileNo,
                  maxLength: 10,
                  style: context.textTheme.bodyText1,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.phone_android),
                      prefixText: "+91",
                      prefixStyle: context.textTheme.bodyText1,
                      labelText: "Mobile Number"),
                ),
              ),
            ),
            !_showPIN
                ? SizedBox()
                : FadeSlideTransition(
                    animation: _pincodeAnimation,
                    additionalOffset: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: TextField(
                        controller: _pin,
                        maxLength: 6,
                        style: context.textTheme.bodyText1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: Icon(Icons.code),
                            labelText: "PIN CODE"),
                      ),
                    ),
                  ),
            FadeSlideTransition(
              animation: _formElementAnimation,
              additionalOffset: 32,
              child: LoginButton(
                  showPIN: _showPIN, pin: _pin.text, mobileNo: _mobileNo.text),
            ),
            FadeSlideTransition(
                animation: _formElementAnimation,
                additionalOffset: 32,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.fast_forward),
                        label: Text("SKIP")),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  final bool showPIN;
  final String pin;
  final String mobileNo;

  const LoginButton({Key key, this.showPIN, this.pin, this.mobileNo})
      : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  AuthenticationService _authService = locator<AuthenticationService>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        setState(() {
          loading = true;
        });
        widget.showPIN
            ? _authService.verifyCode(code: widget.pin).then((result) {
                print("verifycode result: ${result.index}");
                switch (result) {
                  case AuthStatus.signedIn:
                    setState(() {
                      loading = false;
                    });
                    Navigator.of(context).pushReplacementNamed("/");
                    break;
                  case AuthStatus.failed:
                    setState(() {
                      loading = false;
                      // widget.showPIN = false;
                    });
                    break;
                  default:
                    setState(() {
                      loading = false;
                    });
                }
              })
            : _authService.registerUser("+91" + widget.mobileNo).then((result) {
                // print("registerUser result: ${result.index}");
                switch (result) {
                  case AuthStatus.signedIn:
                    setState(() {
                      loading = false;
                    });
                    Navigator.of(context).pushReplacementNamed("/");
                    break;
                  case AuthStatus.codeSent:
                    setState(() {
                      loading = false;
                      // _showPIN = true;
                      // _pinFormController.forward();
                    });
                    break;
                  default:
                    setState(() {
                      loading = false;
                    });
                }
              });
      },
      child: loading
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            )
          : Text("CONTINUE"),
    );
  }
}
