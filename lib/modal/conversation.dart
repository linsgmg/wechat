import 'package:flutter/material.dart';
import 'package:wechat/constants.dart' show AppColors;

class Conversation {
  const Conversation({
    @required this.avatar,
    @required this.title,
    this.titleColors: AppColors.ConversationTitleColor,
    @required this.updateAt,
    this.description,
    this.isMute: false,
    this.unreadMsgCount: 0,
    this.disPlayDot: false,
  })  : assert(avatar != null),
        assert(title != null),
        assert(updateAt != null);

  final String avatar;
  final String title;
  final int titleColors;
  final String description;
  final String updateAt;
  final bool isMute;
  final int unreadMsgCount;
  final bool disPlayDot;

  bool isAvatarFromNet() {
    if (this.avatar.indexOf('http') == 0 || this.avatar.indexOf('https') == 0) {
      return true;
    }
    return false;
  }
}

enum Device { MAC, WIN }

// const Map<String, List<Conversation>> mockConversationData = {
//   'deviceInfo': null,
//   'conversation': mockConversationS
// };

class ConversationPageData {
  const ConversationPageData({this.device, this.conversations});
  final Device device;
  final List<Conversation> conversations;

  static mock() {
    return ConversationPageData(device: Device.WIN, conversations: mockConversationS);
  }

  static List<Conversation> mockConversationS = [
    const Conversation(
        avatar: 'https://randomuser.me/api/portraits/women/77.jpg',
        title: 'Lily',
        description: '今天要去运动场锻炼吗?',
        updateAt: '17:58',
        isMute: false,
        unreadMsgCount: 9),
    const Conversation(
        avatar: 'https://randomuser.me/api/portraits/men/24.jpg',
        title: 'Gele',
        description: '我们去吃烤鱼吧',
        updateAt: '20:34',
        isMute: true,
        unreadMsgCount: 0),
    const Conversation(
        avatar: 'https://randomuser.me/api/portraits/men/11.jpg',
        title: 'Helicoter',
        description: '中国市场非常巨大,加快份额占有',
        updateAt: '昨天',
        isMute: true,
        unreadMsgCount: 1),
    const Conversation(
        avatar: 'https://randomuser.me/api/portraits/women/19.jpg',
        title: 'Silindie',
        description: '我真是个大美女,对吧对吧',
        updateAt: '8:30',
        isMute: false,
        unreadMsgCount: 0),
    const Conversation(
        avatar: 'https://randomuser.me/api/portraits/women/77.jpg',
        title: 'Lily',
        description: '今天要去运动场锻炼吗?',
        updateAt: '17:58',
        isMute: false,
        unreadMsgCount: 3),
    const Conversation(
        avatar: 'https://randomuser.me/api/portraits/women/70.jpg',
        title: '杏田尤西子',
        description: '哦还有,你好',
        updateAt: '17:33',
        isMute: true,
        unreadMsgCount: 2),
    const Conversation(
        avatar: 'https://randomuser.me/api/portraits/men/25.jpg',
        title: 'Tom',
        description: 'I am so Hanson',
        updateAt: '7:58',
        isMute: false,
        unreadMsgCount: 0),
    const Conversation(
        avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
        title: '黄淑仪',
        description: '目前在深圳工作,偶尔去香港出差',
        updateAt: '23:12',
        isMute: false,
        unreadMsgCount: 3),
    const Conversation(
        avatar: 'https://randomuser.me/api/portraits/women/12.jpg',
        title: 'darling',
        description: '晚上开会,你自己吃吧',
        updateAt: '18:58',
        isMute: false,
        unreadMsgCount: 0),
    const Conversation(
        avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
        title: 'Tl',
        description: 'flutter no.1',
        updateAt: '00:00',
        isMute: false,
        unreadMsgCount: 0),
    const Conversation(
        avatar: 'assets/images/06.jpg',
        title: '晓雯',
        description: '我速度比你快得多哦',
        updateAt: '08:30',
        isMute: true,
        unreadMsgCount: 2),
    const Conversation(
        avatar: 'assets/images/03.jpg',
        title: '迪丽热巴',
        description: '土包子,你有我快吗?',
        updateAt: '14:00',
        isMute: false,
        unreadMsgCount: 0),
  ];
}
