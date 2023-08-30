import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  final Function updateValue;
  UploadImage({required this.updateValue});

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  // NetworkImage? _nimage;
  late var pickedFile;
  Future getImage() async {
    final picker = ImagePicker();
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: const Color(0XFF2879E9),
          ),
          padding: const EdgeInsets.all(8),
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Choose Image',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.white),
                title: const Text('Photo Library',
                    style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.pop(context);
                  pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);

                  setState(() {
                    if (pickedFile != null) {
                      _image = File(pickedFile.path); //for mobile
                      // _nimage = NetworkImage(pickedFile.path); //for web
                      widget.updateValue(pickedFile.path);
                    } else {
                      print('No image selected.');
                    }
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.white),
                title:
                    const Text('Camera', style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.pop(context);
                  pickedFile =
                      await picker.pickImage(source: ImageSource.camera);
                  setState(() {
                    if (pickedFile != null) {
                      _image = File(pickedFile.path);
                      widget.updateValue(pickedFile.path);
                    } else {
                      print('No image selected.');
                    }
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: _image == null //_nimage == null
                        ? Container(color: Colors.grey[300])
                        // : Image.network(_nimage! as String, width: 20, height: 20),
                        : Image.file(_image!, width: 20, height: 20),
                  ),
                ),
                IconButton(
                  icon: CircleAvatar(
                    radius: 35,
                    backgroundColor: const Color(0XFF2879E9),
                    child: Center(
                      child: Icon(
                        _image == null ? Icons.add : Icons.edit,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ),
                  onPressed: getImage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
