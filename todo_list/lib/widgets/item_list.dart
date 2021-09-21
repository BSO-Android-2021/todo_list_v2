import 'package:flutter/material.dart';
import 'package:todo_list/widgets/item.dart';

class ItemList extends StatelessWidget {
  ///Widget ini berisi search bar dan list of Task
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Container putih, bagian atas melengkung, berfungsi sebagai background
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 170,
          minWidth: MediaQuery.of(context).size.width),
      child: Column(
        children: [
          //Search Bar
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 45,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFBABFC7), width: 1)),
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          //List of card item,
          for (var i = 0; i < 20; i++) Item()
        ],
      ),
    );
  }
}
