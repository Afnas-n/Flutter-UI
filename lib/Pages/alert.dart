import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DialogExample(),
            SnakBar1(),
            TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "This is Center Short Toast",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.black,
                      fontSize: 16.0);
                },
                child: Text("Toast"))
          ],
        ),
      ),
    );
  }
}

class SnakBar1 extends StatelessWidget {
  const SnakBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          // const SnackBar(content: );
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("its snak bar"),
          ));
        },
        child: const Text("Button"));
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
