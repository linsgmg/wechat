import 'package:flutter/material.dart';
import 'package:wechat/constants.dart' show AppColors, AppStyle, Contants;
import 'package:wechat/modal/conversation.dart'
    show Conversation, ConversationPageData, Device;

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final ConversationPageData data = ConversationPageData.mock();
  @override
  Widget build(BuildContext context) {
    var mockConversationS = data.conversations;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            child: _DeviceInfoItem(
              device: Device.MAC,
            ),
          );
        }
        return _ConversationItem(mockConversationS[index - 1]);
      },
      itemCount: mockConversationS.length + 1,
    );
  }
}

//设备登录信息
class _DeviceInfoItem extends StatelessWidget {
  const _DeviceInfoItem({this.device: Device.WIN}) : assert(device != null);

  final Device device;

  int get iconName {
    return device == Device.WIN ? 0xebb1 : 0xe640;
  }

  String get deviceName {
    return device == Device.WIN ? 'Windows' : 'Mac';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, top: 10, bottom: 10, right: 24),
      decoration: BoxDecoration(
        color: Color(AppColors.AppBarColorText),
        border: Border(
            bottom: BorderSide(
                width: Contants.DividerWidth,
                color: Color(AppColors.DividerColor))),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            IconData(this.iconName, fontFamily: Contants.IconFontFamily),
            size: 24.0,
            color: Color(AppColors.DeviceInfoItemIcon),
          ),
          Container(
            width: 16,
          ),
          Text(
            '$deviceName 微信已登录',
            style: AppStyle.DeviceInfoItemTextStyle,
          )
        ],
      ),
    );
  }
}

class _ConversationItem extends StatelessWidget {
  const _ConversationItem(this.conversation) : assert(conversation != null);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    //定义头像
    Widget avatar;
    if (conversation.isAvatarFromNet()) {
      avatar = Image.network(
        conversation.avatar,
        width: Contants.ConversationAvatarSize,
        height: Contants.ConversationAvatarSize,
        fit: BoxFit.contain,
      );
    } else {
      avatar = Image.asset(
        conversation.avatar,
        width: Contants.ConversationAvatarSize,
        height: Contants.ConversationAvatarSize,
        fit: BoxFit.cover,
      );
    }

    //定义提示信息图标
    Widget unreadMsgCount = Container(
      width: Contants.UnReadMsgNotifyDotSize,
      height: Contants.UnReadMsgNotifyDotSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(Contants.UnReadMsgNotifyDotSize / 2.0),
          color: Color(AppColors.NotiifyDotBg)),
      child: Text(conversation.unreadMsgCount.toString(),
          style: AppStyle.UnreadMsgCountDotStyle),
    );

    //定义头像容器
    Widget avatarContainer;

    if (conversation.unreadMsgCount > 0) {
      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          ClipRRect(child: avatar, borderRadius: BorderRadius.circular(4.0)),
          Positioned(
            right: -Contants.UnReadMsgNotifyDotSize / 3.0,
            top: -Contants.UnReadMsgNotifyDotSize / 3.0,
            child: unreadMsgCount,
          )
        ],
      );
    } else {
      avatarContainer =
          ClipRRect(child: avatar, borderRadius: BorderRadius.circular(4.0));
    }

    //勿扰模式图标
    // Widget muteIcon = Icon(
    //   IconData(0xe8d8, fontFamily: Contants.IconFontFamily),
    //   color: Color(AppColors.ConversationmuteIcon),
    //   size: Contants.ConversationMuteIconSize,
    // );

    //右边区域
    var _rightArea = <Widget>[
      Text(conversation.updateAt, style: AppStyle.DesStyle),
      Container(
        height: 8.0,
      )
    ];
    if (conversation.isMute) {
      //勿扰模式图标--显示
      _rightArea.add(Icon(
        IconData(0xe8d8, fontFamily: Contants.IconFontFamily),
        color: Color(AppColors.ConversationmuteIcon),
        size: Contants.ConversationMuteIconSize,
      ));
    } else {
      _rightArea.add(Icon(
        //勿扰模式图标--隐藏
        IconData(0xe8d8, fontFamily: Contants.IconFontFamily),
        color: Colors.transparent,
        size: Contants.ConversationMuteIconSize,
      ));
    }

    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color(AppColors.AppBarColorText),
          border: Border(
              bottom: BorderSide(
                  color: Color(AppColors.DividerColor),
                  width: Contants.DividerWidth))),
      child: Row(
        children: <Widget>[
          avatarContainer,
          Container(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  conversation.title,
                  style: AppStyle.TitleStyle,
                ),
                Container(
                  height: 8.0,
                ),
                Text(
                  conversation.description,
                  style: AppStyle.DesStyle,
                )
              ],
            ),
          ),
          Container(
            width: 10,
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: _rightArea,
          )
        ],
      ),
    );
  }
}
