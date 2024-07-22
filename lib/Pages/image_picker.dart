import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/controller/image_controller.dart';

class screenImagePicker extends StatefulWidget {
  const screenImagePicker({super.key});

  @override
  State<screenImagePicker> createState() => _screenImagePickerState();
}

class _screenImagePickerState extends State<screenImagePicker> {
  Uint8List? image;

  imagePick(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
    print("No image Selected");
  }

  void selectimage() async {
    Uint8List img = await imagePick(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  UrlController url = UrlController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            image != null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: MemoryImage(image!),
                  )
                : const CircleAvatar(),
            ElevatedButton(
                onPressed: () {
                  selectimage();
                },
                child: const Text("Select Image")),
            TextButton(
              onPressed: () {
                url.launchingUrl();
              },
              child: Text("Url"),
            )
          ],
        ),
      ),
    );
  }
}
