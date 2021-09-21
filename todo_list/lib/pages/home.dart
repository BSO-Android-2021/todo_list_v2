import 'package:flutter/material.dart';
import 'package:todo_list/widgets/header.dart';
import 'package:todo_list/widgets/item_list.dart';

const Color primaryColor = Color(0xFF4044C9); 

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: [
          Container(
              height: 170,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Header()),
          const ItemList()
        ],
      ),
    );
  }
}

