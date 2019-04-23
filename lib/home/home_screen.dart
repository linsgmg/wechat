import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int message_count=24;
  int _currentIndex = 1;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        icon: Icon(Icons.message),
        title: Text('微信'),
        // color: Colors.yellow),
      ),
      NavigationIconView(
        icon: Icon(Icons.contacts),
        title: Text('通讯录'),
        // color: Colors.red),
      ),
      NavigationIconView(
        icon: Icon(Icons.navigation),
        title: Text('发现'),
        // color: Colors.greenAccent),
      ),
      NavigationIconView(
        icon: Icon(Icons.person),
        title: Text('我'),
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
      fixedColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
      unselectedFontSize: 14.0,
      backgroundColor: Colors.grey[200],
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '微信($message_count)',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[200],
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 1,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.tv,
                    size: 30,
                    color: Colors.grey[500],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Windows微信已登录',
                      style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}

class NavigationIconView {
  final Widget _icon;
  // final Color _color;
  final BottomNavigationBarItem item;
  NavigationIconView({
    Widget icon,
    Widget title,
    // Color color,
  })  : _icon = icon,
        // _color = color,
        item = BottomNavigationBarItem(icon: icon, title: title);
}
