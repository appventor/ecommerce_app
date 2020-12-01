import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ProductDescription extends StatefulWidget {
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(
              child: Text(
                "Description",
                style: TextStyle(color: Colors.red),
              ),
            ),
            Tab(
              child: Text(
                "Specification",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
        SizedBox(
          height: 300,
          child: TabBarView(
            controller: _tabController,
            children: [
              Markdown(
                  selectable: true,
                  data:
                      """Adipisicing esse minim consectetur do minim consequat ea et sunt. Amet nulla magna cillum occaecat esse deserunt exercitation est anim et. Id dolore irure laboris veniam voluptate in et aliqua deserunt ullamco aute ad sunt. Amet voluptate reprehenderit excepteur occaecat aliquip duis magna fugiat id tempor occaecat aliqua Lorem officia. Ea elit ullamco pariatur voluptate sunt Lorem amet pariatur veniam ipsum tempor amet. Laborum id sit ad amet magna sunt consequat enim mollit culpa ullamco ad nulla.

Incididunt mollit officia ullamco ipsum in laborum sunt. Amet non ex dolore cupidatat incididunt nostrud sunt irure cillum consequat aliquip tempor. Cupidatat mollit duis do proident non est. In tempor tempor labore in elit. Nulla cupidatat nulla nostrud nostrud Lorem esse ea. Esse et quis occaecat dolor Lorem dolor deserunt qui ad laborum. Mollit veniam laboris ipsum sit duis consequat non voluptate voluptate aute non do.

Officia ut labore ipsum dolore exercitation irure velit consequat minim duis. Deserunt et mollit et voluptate commodo amet ipsum. Nulla ullamco ipsum ullamco amet esse. Dolor esse cillum anim adipisicing anim dolor et laborum officia sit eiusmod Lorem. Qui ea adipisicing eiusmod ad incididunt deserunt anim nulla nulla nisi ipsum. Elit veniam commodo magna occaecat. Veniam excepteur officia irure pariatur anim sint officia ad commodo.

Reprehenderit occaecat nulla labore nisi aliqua culpa non anim quis. Anim proident dolor ut officia aliqua magna qui reprehenderit incididunt incididunt non est sint est. Magna ea cillum eiusmod aute minim non minim incididunt. Fugiat do officia fugiat nostrud veniam Lorem quis aliqua voluptate. Excepteur esse ex incididunt tempor reprehenderit qui in fugiat nulla deserunt adipisicing velit pariatur. Incididunt voluptate sit aute fugiat nostrud culpa officia labore dolore cillum. Velit et exercitation sunt voluptate."""),
              Markdown(data: """Markdown is the **best**!

* It has lists.
* It has [links](http://dart.dev).
* It has _so much more_...
              """)
            ],
          ),
        ),
      ],
    );
  }
}
