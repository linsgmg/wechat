import 'package:flutter/material.dart';

class Peofile {
  final String avatar;
  final String name;
  final String account;

  const Peofile(
      {@required this.avatar, @required this.name, @required this.account});
}

const Peofile me = Peofile(
    name: 'jimmie reynolds',
    account: 'text_account',
    avatar: 'https://randomuser.me/api/portraits/men/17.jpg');
