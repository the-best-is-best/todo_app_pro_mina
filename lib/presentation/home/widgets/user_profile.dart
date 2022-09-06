import 'package:flutter/material.dart';
import 'package:todo_app_pro_mina/gen/assets.gen.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(15),
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: AssetGenImage(const $AssetsImagesGen().userProfile.path)
              .image(width: 30, color: Colors.black),
        ),
      ),
    );
  }
}
