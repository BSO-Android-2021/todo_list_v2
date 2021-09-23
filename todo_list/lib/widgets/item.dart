import 'package:flutter/material.dart';
import 'package:todo_list/pages/home.dart';
import 'package:todo_list/widgets/custom_textstyle.dart';
import 'package:todo_list/widgets/form.dart';

class Item extends StatefulWidget {
  ///Widget ini merupakan card yg barisi satuan item
  Item({Key? key}) : super(key: key);
  bool indicator = false;
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Card(
        //jika indicator bernilai false, maka elevation akan bernilai 5
        //sebaliknya jika true, elevation akan bernilai 0
        elevation: widget.indicator ? 0 : 5,
        shadowColor: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //indicator, checkbox, judul dan desc
            Row(
              children: [
                //Indicator garis berwarna ungu, akan berwarna ungu jika checkbox bernilai false
                //akan berwarna abu/abu jika checkbox bernilai ungu
                Container(
                  height: 80,
                  width: 3,
                  color: widget.indicator ? Colors.black38 : primaryColor,
                ),
                Checkbox(
                    value: widget.indicator,
                    onChanged: (value) {
                      widget.indicator = !widget.indicator;
                      setState(() {});
                    }),
                //Berisi judul dan deskripsi task
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //item title
                      Text(
                        "Learn flutter",
                        style: myCustomTextStyle(StyleType.black1),
                      ),
                      //memberi jarak setinggi 18 pixel antara judul dan deskripsi
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Im Ready to lear flutter in BSO Android 2021, and ill make my own app",
                        //maximal hanya akan satu baris
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: myCustomTextStyle(StyleType.black2),
                      )
                      //item desc
                    ],
                  ),
                ),
              ],
            ),
            //menu button
            PopupMenuButton(
              child: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context, builder: (context) => EditTask());
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Edit this task",
                          style: TextStyle(color: Colors.amber),
                        )
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) => const DeleteTaskDialog());
                  },
                    child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => const DeleteTaskDialog());
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
