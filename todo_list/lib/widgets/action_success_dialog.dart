import 'package:flutter/material.dart';
import 'package:todo_list/pages/home.dart';

class EditSuccessDialog extends StatelessWidget {
  const EditSuccessDialog({Key? key}) : super(key: key);

  dismissDialog(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5))
        .then((value) => dismissDialog(context));

    return const AlertDialog(
      title: Icon(
        Icons.done,
        size: 35,
        color: Colors.amber,
      ),
      content: Text(
        "Change saved",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}

class AddSuccessDialog extends StatelessWidget {
  const AddSuccessDialog({Key? key}) : super(key: key);
  dismissDialog(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5))
        .then((value) => dismissDialog(context));
    return const AlertDialog(
      title: Icon(
        Icons.done,
        size: 35,
        color: Colors.green,
      ),
      content: Text(
        "Change saved",
        style: TextStyle(color: Colors.green),
      ),
    );
  }
}

class DeleteSuccessDialog extends StatelessWidget {
  const DeleteSuccessDialog({Key? key}) : super(key: key);
  dismissDialog(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5))
        .then((value) => dismissDialog(context));
    return const AlertDialog(
      title: Icon(
        Icons.done,
        size: 35,
        color: Colors.red,
      ),
      content: Text(
        "Task Deleted",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
