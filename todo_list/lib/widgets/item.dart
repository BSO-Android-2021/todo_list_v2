import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/pages/home.dart';
import 'package:todo_list/widgets/custom_textstyle.dart';
import 'package:todo_list/widgets/form.dart';

class Item extends StatefulWidget {
  ///Widget ini merupakan card yg barisi satuan item
  Item({Key? key, required this.index}) : super(key: key);
  int index;
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
        elevation: listOfTask[widget.index].isDone == true ? 0 : 5,
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
                  color: listOfTask[widget.index].isDone == true
                      ? Colors.black38
                      : primaryColor,
                ),
                Checkbox(
                    value: listOfTask[widget.index].isDone,
                    onChanged: (value) {
                      listOfTask[widget.index].isDone =
                          !listOfTask[widget.index].isDone;
                      print(listOfTask[widget.index].isDone);
                      listFinished.add(listOfTask[widget.index]);
                      listOfTask.removeAt(widget.index);
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
                        listOfTask[widget.index].title,
                        style: myCustomTextStyle(StyleType.black1),
                      ),
                      //memberi jarak setinggi 18 pixel antara judul dan deskripsi
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        listOfTask[widget.index].desc,
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
                          context: context,
                          builder: (context) => EditTask(
                                index: widget.index,
                              ));
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
                    child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => DeleteTaskDialog(
                              index: widget.index,
                            ));
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
