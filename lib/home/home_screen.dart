import 'package:flutter/material.dart';
import 'package:wechat/constants.dart' show Contants;
import 'package:wechat/constants.dart' show AppColors;
import 'package:wechat/home/contacts_page.dart';
import 'package:wechat/home/conversation_page.dart';
import 'package:wechat/home/discover_page.dart';

enum ActionItems { CHAT, FRIEND, SCAN, PAYMENT, HELP }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int message_count = 20;
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pageViews = [
    ConversationPage(),
    ContactsPage(),
    DiscoverPage(),
    Container(
      color: Colors.blue,
    ),
  ];
  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        icon: IconData(0xe620, fontFamily: Contants.IconFontFamily),
        activeIcon: IconData(0xe620, fontFamily: Contants.IconFontFamily),
        title: '微信',
        // color: Colors.yellow),
      ),
      NavigationIconView(
        icon: IconData(0xe601, fontFamily: Contants.IconFontFamily),
        activeIcon: IconData(0xe601, fontFamily: Contants.IconFontFamily),
        title: '通讯录',
        // color: Colors.red),
      ),
      NavigationIconView(
          icon: IconData(0xe609, fontFamily: Contants.IconFontFamily),
          activeIcon: IconData(0xe609, fontFamily: Contants.IconFontFamily),
          title: '发现'
          // color: Colors.greenAccent),
          ),
      NavigationIconView(
        icon: IconData(0xe60d, fontFamily: Contants.IconFontFamily),
        activeIcon: IconData(0xe60d, fontFamily: Contants.IconFontFamily),
        title: '我',
        // color: Colors.blue),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>(
              (NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.green,
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
      unselectedFontSize: 14.0,
      backgroundColor: Colors.grey[200],
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _controller.animateToPage(
            _currentIndex,
            duration: Duration(milliseconds: 1),
            curve: Curves.easeInOut,
          );
        });
      },
    );

    _PopItem(int iconName, String title) {
      return Row(
        children: <Widget>[
          Icon(
            IconData(iconName, fontFamily: Contants.IconFontFamily),
            size: 22.0,
            color: Colors.white,
          ),
          Container(
            width: 12.0,
          ),
          Text(
            title,
            style: TextStyle(color: const Color(AppColors.AppBarColorText)),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '微信($message_count)',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[200],
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.add_circle_outline,
          //     color: Colors.black,
          //   ),
          //   onPressed: () {},
          // ),
          PopupMenuButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.black,
            ),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _PopItem(0xe620, '发起群聊'),
                  value: ActionItems.CHAT,
                ),
                PopupMenuItem(
                  child: _PopItem(0xe601, '添加朋友'),
                  value: ActionItems.FRIEND,
                ),
                PopupMenuItem(
                  child: _PopItem(0xe609, '扫一扫'),
                  value: ActionItems.SCAN,
                ),
                PopupMenuItem(
                  child: _PopItem(0xe60d, '收付款'),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _PopItem(0xe620, '帮助与反馈'),
                  value: ActionItems.HELP,
                ),
              ];
            },
          ),
          Container(
            width: 16.0,
          )
        ],
      ),
      backgroundColor: Colors.white,
      // body: Container(
      //   child: Column(
      //     children: <Widget>[
      //       SizedBox(
      //         height: 1,
      //         child: Container(
      //           color: Colors.grey[300],
      //         ),
      //       ),
      //       Container(
      //         color: Colors.grey[200],
      //         padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
      //         child: Row(
      //           children: <Widget>[
      //             Icon(
      //               Icons.tv,
      //               size: 30,
      //               color: Colors.grey[500],
      //             ),
      //             Padding(
      //               padding: EdgeInsets.only(left: 20),
      //               child: Text(
      //                 'Windows微信已登录',
      //                 style: TextStyle(fontSize: 14, color: Colors.grey[500]),
      //               ),
      //             )
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pageViews[index];
        },
        itemCount: _pageViews.length,
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}

class NavigationIconView {
  final IconData _icon;
  final IconData _activeIcon;
  // final Color _color;
  final BottomNavigationBarItem item;
  NavigationIconView({
    IconData icon,
    IconData activeIcon,
    String title,
    // Color color,
  })  : _icon = icon,
        _activeIcon = activeIcon,
        // _color = color,
        item = BottomNavigationBarItem(
            icon: Icon(
              icon,
            ),
            title: Text(
              title,
            ));
}
