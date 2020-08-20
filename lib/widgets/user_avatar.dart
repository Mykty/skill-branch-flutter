

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:galleryapp/screens/photo_screen.dart';

class UserAvatar extends StatelessWidget {
  UserAvatar({Key key, this.avatarLink}): super(key: key);

  final String avatarLink;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
            imageUrl: avatarLink,
            width: 40,
            height: 40,
            fit: BoxFit.fill,
        ),
      );
  }
}
