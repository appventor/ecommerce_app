import 'dart:math';
import 'package:flutter/material.dart';
import '../../pages.dart';
import 'widgets/page_indicator_button.dart';
import 'widgets/ripple.dart';

class OnboardRouter extends RouterConfig {
  @override
  bool matches(RouteSettings settings) => settings.name.startsWith('/welcome');

  @override
  MaterialPageRoute route(RouteSettings settings) =>
      MaterialPageRoute(settings: settings, builder: (_) => Onboard());
}

class Onboard extends StatefulWidget {
  final double height;

  const Onboard({Key key, this.height}) : super(key: key);
  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> with TickerProviderStateMixin {
  PageController _pageController;
  AnimationController _rippleAnimationController;
  Animation<double> _rippleAnimation;

  List<Widget> _pages = [
    Container(color: Colors.blue),
    Container(color: Colors.red),
    Container(color: Colors.purple),
    Container(color: Colors.green),
  ];

  @override
  void initState() {
    _pageController = PageController();
    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: widget.height,
    ).animate(CurvedAnimation(
      parent: _rippleAnimationController,
      curve: Curves.easeIn,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _rippleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          children: _pages,
        ),
        Positioned(
          top: 10,
          right: 5,
          child: FlatButton.icon(
            icon: Icon(
              Icons.fast_forward,
              color: Colors.white,
            ),
            label: Text(
              "SKIP",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              _rippleAnimationController.forward();
            },
          ),
        ),
        PageIndicatorButton(
          pageController: _pageController,
          index: _pages.length,
          onFinished: () {
            _rippleAnimationController.forward();
          },
        ),
        AnimatedBuilder(
          animation: _rippleAnimation,
          builder: (_, Widget child) {
            return Ripple(
              radius: _rippleAnimation.value,
            );
          },
        ),
      ],
    );
  }
}

class PageIndicatorButton extends StatefulWidget {
  final PageController pageController;
  final int index;
  final VoidCallback onFinished;

  const PageIndicatorButton(
      {Key key, this.pageController, this.index, this.onFinished})
      : super(key: key);

  @override
  _PageIndicatorButtonState createState() => _PageIndicatorButtonState();
}

class _PageIndicatorButtonState extends State<PageIndicatorButton>
    with TickerProviderStateMixin {
  AnimationController _pageIndicatorAnimationController;

  Animation<double> _pageIndicatorAnimation;

  void _setPageIndicatorAnimation(double value) {
    setState(() {
      _pageIndicatorAnimation = Tween(
        begin: 0.0,
        end: 2 * pi * value,
      ).animate(
        CurvedAnimation(
          parent: _pageIndicatorAnimationController,
          curve: Curves.easeIn,
        ),
      );
      _pageIndicatorAnimationController.forward();
    });
  }

  void onScroll() {
    _setPageIndicatorAnimation(widget.pageController.page);
    if (widget.pageController.page == widget.pageController.page.round()) {
      setState(() {});
    }
  }

  @override
  void initState() {
    widget.pageController.addListener(onScroll);
    _pageIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _setPageIndicatorAnimation(0);
    super.initState();
  }

  @override
  void dispose() {
    _pageIndicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      width: MediaQuery.of(context).size.width,
      child: AnimatedBuilder(
        animation: _pageIndicatorAnimation,
        builder: (_, Widget child) {
          return IndicatorButton(
              angle: _pageIndicatorAnimation.value,
              pages: widget.index,
              pageController: widget.pageController,
              onPressed: () {
                print(widget.index);
                if (widget.pageController.page.toInt() == widget.index - 1)
                  widget.onFinished();
                widget.pageController.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOutSine);
              });
        },
      ),
    );
  }
}
