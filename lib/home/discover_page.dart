import 'package:flutter/material.dart';
import 'package:wechat/home/full_width_icon_button.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  static const SEPARATE_SIZE = 20.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: SEPARATE_SIZE,),
          FullWidthIconButton(
            iconPath: 'assets/images/01.jpg',
            title: '朋友圈',
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
