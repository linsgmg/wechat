import 'package:flutter/material.dart';

class Contants {
  static const IconFontFamily = "AppIconFont";
  static const ConversationAvatarSize = 48.0;
  static const DividerWidth = 1.0;
  static const UnReadMsgNotifyDotSize = 20.0;
  static const ConversationMuteIconSize = 18.0;
  static const ContactAvatarSize = 36.0;
  static const IndexBarWidth = 24.0;
  static const IndexLetterBoxSize = 114.0;
  static const IndexLetterBoxRadius = 4.0;
}

class AppColors {
  static const AppBarColor = 0xff000000;
  static const AppBarColorText = 0xffffffff;
  static const ConversationTitleColor = 0Xff353535;
  static const ConversationDesColor = 0xff9e9e9e;
  static const DividerColor = 0xffd9d9d9;
  static const NotiifyDotBg = 0xffff3e3e;
  static const NotiifyDotText = 0xffffffff;
  static const ConversationmuteIcon = 0xffd8d8d8;
  static const DeviceInfoItemBg = 0xfff5f5f5;
  static const DeviceInfoItemText = 0xff606062;
  static const DeviceInfoItemIcon = 0xff606062;
  static const ContactGroupTitleBg = 0xffebebeb;
  static const ContactGroupTitleText = 0xff888888;
  static const IndexLetterBoxGg = Colors.black45;
  static const HeaderCarBg = Colors.white;
  static const HeaderCarTitleText = 0xff353535;
  static const HeaderCarAcount = 0xffa9a9a9;
  static const BackgroundColor = 0xffebebeb;
  static const ButtonDesText = 0xffa9a9a9;
}

class AppStyle {
  static const TitleStyle =
      TextStyle(fontSize: 14.0, color: Color(AppColors.ConversationTitleColor));
  static const DesStyle =
      TextStyle(fontSize: 12.0, color: Color(AppColors.ConversationDesColor));
  static const UnreadMsgCountDotStyle =
      TextStyle(fontSize: 12.0, color: Color(AppColors.NotiifyDotText));
  static const DeviceInfoItemTextStyle =
      TextStyle(fontSize: 13.0, color: Color(AppColors.DeviceInfoItemText));
  static const ContactGroupTitleTextStyle =
      TextStyle(fontSize: 14.0, color: Color(AppColors.ContactGroupTitleText));
  static const IndexLetterBoxTextStyle = TextStyle(
    fontSize: 64.0,
    color: Colors.white,
  );
  static const HeaderCarTitleTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.HeaderCarTitleText),
  );
  static const HeaderCarAcountTextStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.HeaderCarAcount),
  );
  static const ButtonDesTextStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.ButtonDesText),
  );
}
