import 'package:flutter/material.dart';
import 'package:wechat/constants.dart' show AppColors, Contants, AppStyle;

class FullWidthIconButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onPress;
  final bool showDivider;
  final String des;

  static const ICON_SIZE = 24.0;
  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 13.0;

  const FullWidthIconButton(
      {@required this.iconPath,
      @required this.title,
      @required this.onPress,
      this.des,
      this.showDivider: false})
      : assert(iconPath != null),
        assert(title != null),
        assert(onPress != null);

  @override
  Widget build(BuildContext context) {
    final pureButton = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image.asset(
            iconPath,
            width: ICON_SIZE,
            height: ICON_SIZE,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: HORIZONTAL_PADDING),
        Expanded(
          child: Text(title),
        )
      ],
    );

    if (this.des != null && this.des.isNotEmpty) {
      pureButton.children.add(
        Text(this.des, style: AppStyle.ButtonDesTextStyle),
      );
    }

    final borderButton = Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color(
                    AppColors.DividerColor,
                  ),
                  width: Contants.DividerWidth))),
      child: pureButton,
    );

    return FlatButton(
      onPressed: onPress,
      color: Colors.white,
      child: Container(
        padding:
            EdgeInsets.only(top: VERTICAL_PADDING, bottom: VERTICAL_PADDING),
        child: this.showDivider ? borderButton : pureButton,
      ),
    );
  }
}
