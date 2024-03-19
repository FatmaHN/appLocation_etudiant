import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class functionproprietaire {
  final ImagePicker _picker = ImagePicker();

  Future<void> getImages(
      BuildContext context, List<XFile> _imageFiles, Function setState) async {
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null) {
      setState(() {
        _imageFiles.addAll(images);
      });
    }
  }
}
