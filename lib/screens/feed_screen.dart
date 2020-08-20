import 'package:flutter/material.dart';
import 'package:galleryapp/res/colors.dart';
import 'package:galleryapp/res/res.dart';
import 'package:galleryapp/widgets/widgets.dart';

const String kFlutterDash = 'https://blog.codemagic.io/uploads/2020/01/dashmascot.jpg';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FeedState();
  }
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
        return Column(children: <Widget>[
          _buildItem(),
          Divider(
            thickness: 2,
            color: AppColors.mercury,
          ),
        ]);
      }),
    );
  }

  Widget _buildItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Photo(photoLink: kFlutterDash),
        _buildPhotoMeta(),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text("Description text",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.h3.copyWith(color: AppColors.manatee)),
        )

      ],
    );
  }

  Widget _buildPhotoMeta(){
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              UserAvatar(avatarLink: 'https://sun9-8.userapi.com/c629508/v629508396/3512e/3z95m6mKWjw.jpg',),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Mykty Baha', style:  AppStyles.h2Black),
                  Text("bahamykty@gmail.com", style: AppStyles.h5Black.copyWith(color: AppColors.manatee),)
                ],
              )
            ],
          ),
          LikeButton(10, true),
        ],
      ),
    );
  }
}
