import 'dart:io';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

//Membuat method _pickimage dengan parameter source
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gallery Picker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image == null
              ? Text("No image selected")
              : Image.file(_image!, width: 200, height: 200),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Text("Pick from Gallery"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: Text("Take Photo"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}