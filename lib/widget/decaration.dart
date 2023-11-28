import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/all_provider.dart';

class DecorationContainer extends StatelessWidget {
  const DecorationContainer({super.key, required this.child});
  final SizedBox child;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Consumer<ProviderS>(
      builder: (context, value, child) => Container(
        child: child,
        height: h,
        width: w,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [value.pbackground, value.pbackground2], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      ),
    );
  }
}
