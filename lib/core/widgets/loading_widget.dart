import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/assets_manger.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(JsonAssets.loadingUI,),
    );
  }
}
