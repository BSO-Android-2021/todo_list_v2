import 'package:flutter/material.dart';
import 'package:todo_list/pages/home.dart';
import 'package:todo_list/widgets/action_success_dialog.dart';
import 'package:todo_list/widgets/custom_textstyle.dart';

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
        //sebaliknya jika false, elevation akan bernilai 0
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
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class EditTask extends StatelessWidget {
  ///Widget Custom yang mereturn AlertDialog, berfungsi sebagai widget
  ///yang ditampilkan ketika tombol edit diklik
  const EditTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit"),
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 3.2,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Judul", style: myCustomTextStyle(StyleType.black1)),
            //Input box
            Container(
              height: 38,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                //membuat border melengkung
                borderRadius: BorderRadius.circular(12),
                //memberi warna dan ketebalan pada border
                border: Border.all(width: 1, color: Colors.grey.shade600),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Task Tittle",
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
            //text
            Text(
              "Desc",
              style: myCustomTextStyle(StyleType.black1),
            ),
            //Input box
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                //membuat border melengkung
                borderRadius: BorderRadius.circular(12),
                //memberi warna dan ketebalan pada border
                border: Border.all(width: 1, color: Colors.grey.shade600),
              ),
              child: const TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: "Task Tittle",
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
            //button cancel &
          ],
        ),
      ),
      actions: [
        //Tomblo cancel
        ElevatedButton(
          onPressed: () {},
          child: Text("Cancel"),
          style: ButtonStyle(
              //Mengatur warna button
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey.shade600),
              //mengatur bentuk button
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))))),
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => const EditSuccessDialog());
          },
          child: const Text("Submit Data"),
          style: ButtonStyle(
              //Mengatur warna button
              backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
              //mengatur bentuk button
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))))),
        )
      ],
    );
  }
}
