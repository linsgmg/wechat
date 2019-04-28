import 'package:flutter/material.dart';
import '../modal/me.dart' show me;
import 'package:wechat/constants.dart' show AppColors, AppStyle;
import 'full_width_icon_button.dart';

class FuntionPage extends StatefulWidget {
  @override
  _FuntionPageState createState() => _FuntionPageState();
}

class _FuntionPageState extends State<FuntionPage> {
  static const SEPARATOR_SIZE = 20.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: SEPARATOR_SIZE,
            ),
            _header(),
            SizedBox(
              height: SEPARATOR_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/05.jpg',
              title: '钱包',
              onPress: (){},
            ),
            SizedBox(
              height: SEPARATOR_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/02.jpg',
              title: '收藏',
              onPress: (){},
              showDivider: true,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/08.jpg',
              title: '相册',
              onPress: (){},
              showDivider: true,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/07.jpg',
              title: '卡包',
              onPress: (){},
              showDivider: true,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/03.jpg',
              title: '表情',
              onPress: (){},
            ),
            SizedBox(
              height: SEPARATOR_SIZE,
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/09.jpg',
              title: '设置',
              des: '账号未保护',
              onPress: (){},
            ),
          ],
        ),
      ),
    );
  }
}

class _header extends StatelessWidget {
  static const AVATAR_SIZE = 72.0;
  static const SEPARATOR_SIZE = 16.0;
  static const QR_CODE_PERV_SIZE = 20.0;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: SEPARATOR_SIZE, horizontal: 10.0),
      onPressed: () {},
      color: AppColors.HeaderCarBg,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            me.avatar,
            width: AVATAR_SIZE,
            height: AVATAR_SIZE,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    me.name,
                    style: AppStyle.HeaderCarAcountTextStyle,
                  ),
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.only(left: SEPARATOR_SIZE, bottom: 5.0),
                ),
                Container(
                  child: Text(
                    me.account,
                    style: AppStyle.HeaderCarAcountTextStyle,
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: SEPARATOR_SIZE),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              'assets/images/01.jpg',
              width: QR_CODE_PERV_SIZE,
              height: QR_CODE_PERV_SIZE,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
