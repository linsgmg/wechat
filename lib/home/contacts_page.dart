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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word) {
      return Expanded(
        child: Text(word),
      );
    }).toList();
    var _totalPos = 0.0;

    return Stack(
      children: <Widget>[
        ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            if (index < _functionButtons.length) {
              _totalPos += _functionButtons[0]._height(false);
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

            _totalPos += _contactItem._height(_isGroupTitle);
            if(_isGroupTitle){
              _letterPosMap[_contact.nameIndexLetter]=_totalPos;
            }
            return _contactItem;
          },
          itemCount: _contacts.length + _functionButtons.length,
        ),
        Positioned(
          width: Contants.IndexBarWidth,
          right: 0.0,
          top: 0.0,
          bottom: 0.0,
          child: Container(
            color: _indexBarBg,
            child: GestureDetector(
              onVerticalDragDown: (DragDownDetails details) {
                setState(() {
                  _indexBarBg = Colors.black26;
                  _scrollController.animateTo(250.0,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 200));
                });
              },
              onVerticalDragEnd: (DragEndDetails details) {
                setState(() {
                  _indexBarBg = Colors.transparent;
                });
              },
              onVerticalDragCancel: () {
                setState(() {
                  _indexBarBg = Colors.transparent;
                });
              },
              child: Column(
                children: _letters,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ContactItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;

  final MARGIN_VERTICAL = 10.0;
  final GROUP_TITLE_HEIGHT = 24.0;

  const ContactItem(
      {@required this.avatar,
      @required this.title,
      this.groupTitle,
      this.onPressed});

  bool get _isAvatarFromNet {
    return this.avatar.startsWith('http') || this.avatar.startsWith('https');
  }

  double _height(bool hasGroupTitle) {
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
