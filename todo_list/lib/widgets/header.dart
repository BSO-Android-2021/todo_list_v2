import 'package:flutter/material.dart';
import 'package:todo_list/pages/home.dart';
import 'package:todo_list/widgets/custom_textstyle.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Icon andro, titleapp, icon sort
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Icon Andro
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.android,
                size: 24,
                color: Colors.white,
              ),
            ),
            //App Title
            Text("My Todolist", style: myCustomTextStyle(StyleType.type1)),
            //Tombol Sort
            PopupMenuButton(
              icon: const Icon(
                Icons.sort,
                size: 24,
                color: Colors.white,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      child: Row(
                    children: const [
                      Icon(
                        Icons.circle,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Finished"),
                    ],
                  )),
                  PopupMenuItem(
                      child: Row(
                    children: const [
                      Icon(
                        Icons.circle,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Finished"),
                    ],
                  ))
                ];
              },
            )
          ],
        ),
        //Total task, tombol add
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Total task
            Column(
              children: [
                Text(
                  "Total Task",
                  style: myCustomTextStyle(StyleType.type1),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "24 Task",
                  style: myCustomTextStyle(StyleType.type2),
                )
              ],
            ),
            //Add new button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text(
                "Add New",
                style: myCustomTextStyle(StyleType.primary2),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddDialog();
                    });
              },
            )
          ],
        ),
      ],
    );
  }
}

class AddDialog extends StatelessWidget {
  ///Widget Custom yang mereturn AlertDialog, berfungsi sebagai widget
  ///yang ditampilkan ketika tombol add new diklik
  const AddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add"),
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
        ElevatedButton(
          onPressed: () {},
          child: Text("Cancel"),
          style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Submit Data"),
          style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
        )
      ],
    );
  }
}
