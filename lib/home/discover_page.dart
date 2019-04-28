import 'package:flutter/material.dart';
import 'package:wechat/home/full_width_icon_button.dart';
import 'package:wechat/constants.dart' show AppColors;

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  static const SEPARATE_SIZE = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: SEPARATE_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/01.jpg',
              title: '朋友圈',
              onPress: () {},
            ),
            SizedBox(
              height: SEPARATE_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/02.jpg',
              title: '扫一扫',
              showDivider: true,
              onPress: () {},
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/03.jpg',
              title: '摇一摇',
              onPress: () {},
            ),
            SizedBox(
              height: SEPARATE_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/04.jpg',
              title: '看一看',
              showDivider: true,
              onPress: () {},
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/05.jpg',
              title: '搜一搜',
              onPress: () {},
            ),
            SizedBox(
              height: SEPARATE_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/06.jpg',
              title: '附近的人',
              showDivider: true,
              onPress: () {},
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/07.jpg',
              title: '漂流瓶',
              onPress: () {},
            ),
            SizedBox(
              height: SEPARATE_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/08.jpg',
              title: '购物',
              showDivider: true,
              onPress: () {},
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/09.jpg',
              title: '游戏',
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
