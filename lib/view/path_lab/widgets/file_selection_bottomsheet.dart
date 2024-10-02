

import 'package:flutter/material.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/view_model/path_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FileSelectionBottomSheet extends StatefulWidget {
  @override
  _FilePickerExampleState createState() => _FilePickerExampleState();
}

class _FilePickerExampleState extends State<FileSelectionBottomSheet> {

  @override
  Widget build(BuildContext context) {
    final pathViewModel = Provider.of<PathViewModel>(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
      width: screenWidth,
      color: Colors.white,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: screenWidth/2.5,
            child: ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                pathViewModel.pickImage(ImageSource.gallery, context);
                // Navigator.of(context).pop();
              },
            ),
          ),
          SizedBox(
            width: screenWidth/2.5,
            child: ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                pathViewModel.pickImage(ImageSource.camera, context);
                // Navigator.of(context).pop();
              },
            ),
          ),
        ],
      )
    );
  }
}

