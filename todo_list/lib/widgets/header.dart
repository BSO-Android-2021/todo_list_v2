import 'package:flutter/material.dart';
import 'package:todo_list/pages/home.dart';
import 'package:todo_list/widgets/custom_textstyle.dart';
import 'package:todo_list/widgets/form.dart';

class Header extends StatelessWidget {
  ///Widget ini berisi item bagian atas,
  ///seperti judul, logo android, tombol sorting,
  ///
  ///jumlah task, dan tombol add
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
