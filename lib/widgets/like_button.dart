import 'package:flutter/material.dart';
import 'package:galleryapp/res/res.dart';

class LikeButton extends StatefulWidget {
  LikeButton(this.likeCount, this.isLiked, {Key key}): super(key: key);

  final int likeCount;
  final bool isLiked;

  @override
  State<StatefulWidget> createState() {
    return _LikeButtonState();
  }
}

class _LikeButtonState extends State<LikeButton>{
  bool isLiked;
  int likeCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    likeCount = widget.likeCount;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        setState(() {
          isLiked = !isLiked;
          if(isLiked) likeCount++;
          else likeCount--;
        });
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child:Row(
            children: <Widget>[
              Icon(isLiked ? AppIcons.liked: AppIcons.like_empty),
              SizedBox(width: 4.21),
              Text(likeCount.toString()),
            ],
          ),
        ),
      ),
    );
  }
}