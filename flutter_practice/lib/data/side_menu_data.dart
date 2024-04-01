
import 'package:flutter/material.dart';
import 'package:flutter_practice/app/models/menu_model.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: 'Dashboard'),
    MenuModel(icon: Icons.person, title: 'Profile'),
    MenuModel(icon: Icons.category_outlined, title: 'categories'),
    MenuModel(icon: Icons.settings, title: 'change Password'),
    MenuModel(icon: Icons.history, title: 'history'),
       MenuModel(icon: Icons.history, title: 'myvehicles'),
        MenuModel(icon: Icons.history, title: 'theme'),
    MenuModel(icon: Icons.logout, title: 'SignOut'),
  ];
}