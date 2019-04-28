import 'package:flutter/material.dart';

class FullWidthIconButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onPress;

  static const ICON_SIZE = 24.0;
  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 13.0;

  const FullWidthIconButton({
    @required this.iconPath,
    @required this.title,
    @required this.onPress,
  })  : assert(iconPath != null),
        assert(title != null),
        assert(onPress != null);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(
          horizontal: HORIZONTAL_PADDING, vertical: VERTICAL_PADDING),
      onPressed: onPress,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            iconPath,
            width: ICON_SIZE,
            height: ICON_SIZE,
          ),
          SizedBox(width: HORIZONTAL_PADDING),
          Text(title),
        ],
      ),
    );
  }
}
