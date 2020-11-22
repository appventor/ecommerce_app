import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class NextButton extends SingleChildStatelessWidget {
  final PageController pageController;
  final VoidCallback onPressed;

  NextButton({
    @required this.pageController,
    this.onPressed,
  });
  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(16),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Colors.white,
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_forward,
        color: Color(0xFF306EFF),
        size: 32.0,
      ),
    );
  }
}
