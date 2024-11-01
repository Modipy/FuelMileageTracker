import 'package:flutter/material.dart';

class DrawerItem {
  String name = "Default";
  Text nameAsText = const Text("Default");
  Icon icon = const Icon(Icons.block);
  int index = -1;

  DrawerItem(this.name, this.icon, this.index) { nameAsText = Text(name); }

  String getName() { return name; }

  Text getNameAsText() { return nameAsText; }

  Icon getIcon() { return icon; }

  int getIndex() { return index; }

}