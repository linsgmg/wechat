import 'package:flutter/material.dart';

class Contact {
  final String avatar;
  final String name;
  final String nameIndexLetter;
  const Contact({
    @required this.avatar,
    @required this.name,
    @required this.nameIndexLetter,
  });
}

class ContactsPageData{

  static ContactsPageData mock(){
    return ContactsPageData();
  }

  final List<Contact> contacts=[
      const Contact(
        avatar: 'https://randomuser.me/api/portraits/women/77.jpg',
        name: 'Lily',
        nameIndexLetter: 'L',),
    const Contact(
        avatar: 'https://randomuser.me/api/portraits/men/24.jpg',
        name: 'Gele',
        nameIndexLetter: 'G',),
    const Contact(
        avatar: 'https://randomuser.me/api/portraits/men/11.jpg',
        name: 'Helicoter',
        nameIndexLetter: 'H',),
    const Contact(
        avatar: 'https://randomuser.me/api/portraits/women/19.jpg',
        name: 'Silindie',
        nameIndexLetter: 'S',),
    const Contact(
        avatar: 'https://randomuser.me/api/portraits/women/77.jpg',
        name: 'Lily',
        nameIndexLetter: 'L',),
    const Contact(
        avatar: 'https://randomuser.me/api/portraits/women/70.jpg',
        name: '杏田尤西子',
        nameIndexLetter: 'X',),
    const Contact(
        avatar: 'https://randomuser.me/api/portraits/men/25.jpg',
        name: 'Tom',
        nameIndexLetter: 'T',),
    const Contact(
        avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
        name: '黄淑仪',
        nameIndexLetter: 'H',),
    const Contact(
        avatar: 'https://randomuser.me/api/portraits/women/12.jpg',
        name: 'darling',
        nameIndexLetter: 'D',),
    const Contact(
        avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
        name: 'Tl',
        nameIndexLetter: 'T',),
    const Contact(
        avatar: 'https://randomuser.me/api/portraits/men/36.jpg',
        name: '晓雯',
        nameIndexLetter: 'X',),
    const Contact(
        avatar: 'https://randomuser.me/api/portraits/women/24.jpg',
        name: '迪丽热巴',
        nameIndexLetter: 'D',),
  ];
}