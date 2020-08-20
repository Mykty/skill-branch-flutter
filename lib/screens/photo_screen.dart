import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryapp/res/colors.dart';
import 'package:galleryapp/res/res.dart';

import 'package:galleryapp/widgets/widgets.dart';
import 'feed_screen.dart';

class FullScreenImage extends StatefulWidget {
  FullScreenImage({Key key, this.altDescription = 'Beautiful girl in a yellow dress with a flower on her head in the summer in the forest', this.userName = 'kaparray', this.name = 'Kirill Adeshchenko'}): super(key: key);


  final String altDescription;
  final String userName;
  final String name;

  @override
  State<StatefulWidget> createState() {
    return _FullScreenImageState();
  }
}

class  _FullScreenImageState extends State<FullScreenImage>{
  String altDescription;
  String userName;
  String name;

  @override
  void initState() {
    super.initState();
    altDescription = widget.altDescription;
    userName = widget.userName;
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon:Icon(CupertinoIcons.back),
          color: AppColors.black,
          onPressed:() => Navigator.pop(context, false),
        ),
        title: Text("Photo", style: AppStyles.h2Black.copyWith(color: AppColors.black),),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Photo(photoLink: kFlutterDash),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
                altDescription,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.h3.copyWith(color: AppColors.manatee)),
          ),
          _builUserInfo(),
          _buildUserInteraction(),

        ],
      ),
    );;
  }

  Widget _builUserInfo(){
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
                  Text(name, style:  AppStyles.h2Black),
                  Text("@$userName", style: AppStyles.h5Black.copyWith(color: AppColors.manatee),)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserInteraction(){
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: LikeButton(2517, false),
            ),
          ),
          SizedBox(width: 12),
          _buildButton('Save'),

          SizedBox(width: 12),
          _buildButton('Visit'),
        ],
      )
    );
  }

  Widget _buildButton(String btnText){
    return Expanded(
      child: Container(
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: BorderSide(color: Colors.blue)),
          onPressed: () {},
          color: Colors.blue,
          textColor: Colors.white,
          child: Text(btnText,
              style: TextStyle(fontSize: 14)),
        ),
      ),
    );
  }
}