import 'package:flutter/material.dart';
import 'package:todo_list/pages/home.dart';
import 'package:todo_list/widgets/action_success_dialog.dart';
import 'package:todo_list/widgets/custom_textstyle.dart';

class AddDialog extends StatelessWidget {
  ///Widget Custom yang mereturn AlertDialog, berfungsi sebagai widget
  ///yang ditampilkan ketika tombol add new diklik
  const AddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add"),
      //memberi ukuran ke content yang akan ditampilkan di dalam dialog
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 3.2,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text judul
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
            //text deskripsi
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
          ],
        ),
      ),
      //button cancel & submit
      actions: [
        //button cancel
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
          style: ElevatedButton.styleFrom(
              primary: Colors.grey.shade600,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
        ),
        //button submit
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => const AddSuccessDialog());
          },
          child: const Text("Submit Data"),
          style: ElevatedButton.styleFrom(
              primary: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
        )
      ],
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
          ],
        ),
      ),
      //button cancel & submit
      actions: [
        //Tomblo cancel
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
            //mengatur bentuk dan warna tombol
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                primary: Colors.grey.shade500)),
        //tombol submit
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const EditSuccessDialog());
            },
            child: const Text("Submit Data"),
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                primary: primaryColor))
      ],
    );
  }
}

class DeleteTaskDialog extends StatelessWidget {
  ///Merupakan Dialog yang akan mengkonfirmasi penghapusan
  const DeleteTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(
        Icons.warning_amber_rounded,
        size: 50,
        color: Colors.red,
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.width / 2,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Column(
          children: [
            const Text(
              "Are you want to delete this task?",
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                //Tomblo cancel
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                    //mengatur bentuk dan warna tombol
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        primary: Colors.grey.shade500)),
                //tombol delete
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => const DeleteSuccessDialog());
                    },
                    child: const Text("Yes delete it"),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.red,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        primary: primaryColor))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
