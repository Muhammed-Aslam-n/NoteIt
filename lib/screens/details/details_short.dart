import 'package:flutter/material.dart';
import 'package:noteit/widgets/widgets.dart';
class ShortDetails extends StatelessWidget {
  const ShortDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(),
      endDrawer: CommonDrawer(),
      body: Center(child: Text("HI"),),
    );
  }
}
