import 'package:flutter/material.dart';

import '../models/item.dart';

class CustomListTile extends StatelessWidget {
  final List<Item> items;
  const CustomListTile(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var item in items)
          Card(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(item.title),
              child: ListTile(
                leading: CircleAvatar(foregroundColor: Colors.grey, child: item.icon),
                title: Text(item.title),
              ),
            ),
          ),
      ],
    );
  }
}
