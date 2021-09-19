import 'package:flutter/material.dart';
import 'package:login_app/modules/home/model/post.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2021 . All rights reserved.
 */
class HomeItem extends StatelessWidget {
  ResponsePost? responsePost;
  HomeItem({this.responsePost});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(responsePost!.id.toString()),
            Text(responsePost!.title!),
            Text(responsePost!.body!),
          ],
        ),
      ),
    );
  }
}
