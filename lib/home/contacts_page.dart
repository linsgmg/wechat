import 'package:flutter/material.dart';

import '../modal/contacts.dart' show Contact, ContactsPageData;

import 'package:wechat/constants.dart' show Contants, AppColors, AppStyle;

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactsPageData data = ContactsPageData.mock();
  final List<Contact> _contacts = [];
  Color _indexBarBg = Colors.transparent;
  ScrollController _scrollController;
  final Map _letterPosMap = {
    INDEX_BAR_WORDS[0]: 0.0,
  };
  String _currentLetter = '';

  final List<ContactItem> _functionButtons = [
    ContactItem(
      avatar: 'assets/images/01.jpg',
      title: '新的朋友',
      onPressed: () {
        print('新的朋友');
      },
    ),
    ContactItem(
      avatar: 'assets/images/02.jpg',
      title: '群聊',
      onPressed: () {
        print('群聊');
      },
    ),
    ContactItem(
      avatar: 'assets/images/03.jpg',
      title: '标签',
      onPressed: () {
        print('标签');
      },
    ),
    ContactItem(
      avatar: 'assets/images/04.jpg',
      title: '公众号',
      onPressed: () {
        print('公众号');
      },
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contacts
      ..addAll(data.contacts)
      ..addAll(data.contacts)
      ..addAll(data.contacts);
    _contacts.sort((Contact a, Contact b) =>
        a.nameIndexLetter.compareTo(b.nameIndexLetter));
    _scrollController = ScrollController();
    //计算用于IndexBar进行定位的通讯录列表项的位置
    var _totalPos = _functionButtons.length * ContactItem._height(false);
    for (var i = 0; i < _contacts.length; i++) {
      bool _hasGroupTitle = true;
      if (i > 0 &&
          _contacts[i]
                  .nameIndexLetter
                  .compareTo(_contacts[i - 1].nameIndexLetter) ==
              0) {
        _hasGroupTitle = false;
      }
      if (_hasGroupTitle) {
        _letterPosMap[_contacts[i].nameIndexLetter] = _totalPos;
      }
      _totalPos += ContactItem._height(_hasGroupTitle);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  String getLetter(BuildContext context, double tileHeight, Offset globalPos) {
    RenderBox _box = context.findRenderObject();
    var local = _box.globalToLocal(globalPos);
    var index = (local.dy ~/ tileHeight).clamp(0, INDEX_BAR_WORDS.length - 1);
    print(index);
    return INDEX_BAR_WORDS[index];
  }

  void _jumpToIndex(String letter) {
    if (_letterPosMap.isNotEmpty) {
      final _pos = _letterPosMap[letter];
      if (_pos != null) {
        _scrollController.animateTo(_pos,
            curve: Curves.easeIn, duration: Duration(milliseconds: 200));
      }
    }
  }

  Widget _buildIndexBar(BuildContext context, BoxConstraints constraints) {
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word) {
      return Expanded(
        child: Text(word),
      );
    }).toList();

    final _totalHeight = constraints.biggest.height;
    final _tileeHeight = _totalHeight / _letters.length;
    // print(_totalHeight);
    // print(_tileeHeight);

    return Container(
      color: _indexBarBg,
      child: GestureDetector(
        onVerticalDragDown: (DragDownDetails details) {
          setState(() {
            _indexBarBg = Colors.black26;
            // print(details.globalPosition);
            _currentLetter =
                getLetter(context, _tileeHeight, details.globalPosition);
            _jumpToIndex(_currentLetter);
          });
        },
        onVerticalDragEnd: (DragEndDetails details) {
          setState(() {
            _indexBarBg = Colors.transparent;
            _currentLetter='';
          });
        },
        onVerticalDragCancel: () {
          setState(() {
            _indexBarBg = Colors.transparent;
            _currentLetter='';
          });
        },
        onVerticalDragUpdate: (DragUpdateDetails details) {
          setState(() {
            _currentLetter =
                getLetter(context, _tileeHeight, details.globalPosition);
            _jumpToIndex(_currentLetter);
          });
        },
        child: Column(
          children: _letters,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _body = [
      ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          if (index < _functionButtons.length) {
            return _functionButtons[index];
          }
          int _contacctIndex = index - _functionButtons.length;
          Contact _contact = _contacts[_contacctIndex];
          bool _isGroupTitle = true;
          if (_contacctIndex >= 1 &&
              _contact.nameIndexLetter ==
                  _contacts[_contacctIndex - 1].nameIndexLetter) {
            _isGroupTitle = false;
          }

          final ContactItem _contactItem = ContactItem(
            avatar: _contact.avatar,
            title: _contact.name,
            groupTitle: _isGroupTitle ? _contact.nameIndexLetter : null,
          );

          return _contactItem;
        },
        itemCount: _contacts.length + _functionButtons.length,
      ),
      Positioned(
          width: Contants.IndexBarWidth,
          right: 0.0,
          top: 0.0,
          bottom: 0.0,
          child: LayoutBuilder(
            builder: _buildIndexBar,
          )),
    ];

    if (_currentLetter != null && _currentLetter.isNotEmpty) {
      _body.add(Center(
        child: Container(
          width: Contants.IndexLetterBoxSize,
          height: Contants.IndexLetterBoxSize,
          decoration: BoxDecoration(
            color: AppColors.IndexLetterBoxGg,
            borderRadius: BorderRadius.all(
                Radius.circular(Contants.IndexLetterBoxRadius)),
          ),
          child: Center(
            child: Text(
              _currentLetter,
              style: AppStyle.IndexLetterBoxTextStyle,
            ),
          ),
        ),
      ));
    }
    return Stack(
      children: _body,
    );
  }
}

class ContactItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;

  static const MARGIN_VERTICAL = 10.0;
  static const GROUP_TITLE_HEIGHT = 24.0;

  const ContactItem(
      {@required this.avatar,
      @required this.title,
      this.groupTitle,
      this.onPressed});

  bool get _isAvatarFromNet {
    return this.avatar.startsWith('http') || this.avatar.startsWith('https');
  }

  static double _height(bool hasGroupTitle) {
    final _buttonHeight = MARGIN_VERTICAL * 2 +
        Contants.ContactAvatarSize +
        Contants.DividerWidth;
    if (hasGroupTitle) {
      return _buttonHeight + GROUP_TITLE_HEIGHT;
    } else {
      return _buttonHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _avatarIcon;
    if (_isAvatarFromNet) {
      _avatarIcon = ClipRRect(
        child: Image.network(
          avatar,
          width: Contants.ContactAvatarSize,
          height: Contants.ContactAvatarSize,
        ),
        borderRadius: BorderRadius.circular(4.0),
      );
    } else {
      _avatarIcon = ClipRRect(
        child: Image.asset(
          avatar,
          width: Contants.ContactAvatarSize,
          height: Contants.ContactAvatarSize,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(4.0),
      );
    }

    //分组内容
    Widget _button = Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: Contants.DividerWidth,
                  color: Color(AppColors.DividerColor)))),
      margin: EdgeInsets.only(left: 16.0),
      padding: EdgeInsets.only(top: MARGIN_VERTICAL, bottom: MARGIN_VERTICAL),
      child: Row(
        children: <Widget>[
          _avatarIcon,
          SizedBox(
            width: 10.0,
          ),
          Text(title)
        ],
      ),
    );

    //分组标签
    Widget _itemBody;
    if (this.groupTitle != null) {
      _itemBody = Column(
        children: <Widget>[
          Container(
            height: GROUP_TITLE_HEIGHT,
            color: Color(AppColors.ContactGroupTitleBg),
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Text(
              this.groupTitle,
              style: AppStyle.ContactGroupTitleTextStyle,
            ),
            alignment: Alignment.centerLeft,
          ),
          _button
        ],
      );
    } else {
      _itemBody = _button;
    }

    return _itemBody;
  }
}

const INDEX_BAR_WORDS = [
  '↑',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
