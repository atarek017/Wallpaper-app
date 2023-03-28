import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../resources/assets_manger.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        JsonAssets.emptyUI,
      ),
    );
  }
}
