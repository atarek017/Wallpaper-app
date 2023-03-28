import 'package:flutter/material.dart';

import '../../feature/home/domain/entity/response_entity/photo_response.dart';
import '../resources/routes.dart';

class GridViewWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<PhotoEntity> photoList;

 const  GridViewWidget(
      {required this.scrollController, required this.photoList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: scrollController,
        itemCount: photoList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 2,
          crossAxisCount: 3,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.fullImageScreen,
                  arguments: photoList[index]);
            },
            child: Container(
              color: Colors.white,
              child: Image.network(
                photoList[index].tiny,
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }
}
