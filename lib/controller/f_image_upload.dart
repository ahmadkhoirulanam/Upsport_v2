// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageUpload {
  static void dariGaleri(
      {Function(String imageBlob)? onGetImageBlob,
      Function(File imageFile)? onGetImageFile}) async {
    File imageFile;
    try {
      ImagePicker imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      imageFile = File(image!.path);
      if (onGetImageFile != null) {
        onGetImageFile(imageFile);
      } else if (onGetImageBlob != null) {
        var bytes = imageFile.readAsBytesSync();
        String imagenConvertida = base64.encode(bytes);
        onGetImageBlob(imagenConvertida);
      }
    } catch (e) {
      print("Erorr saat mengupload Foto $e");
    }
  }

  static void dariKamera(
      {Function(String imageBlob)? onGetImageBlob,
      Function(File imageFile)? onGetImageFile}) async {
    File imageFile;
    try {
      ImagePicker imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(
          source: ImageSource.camera,
          imageQuality: 50,
          preferredCameraDevice: CameraDevice.front);
      imageFile = File(image!.path);
      if (onGetImageFile != null) {
        onGetImageFile(imageFile);
      } else if (onGetImageBlob != null) {
        var bytes = imageFile.readAsBytesSync();
        String imagenConvertida = base64.encode(bytes);
        onGetImageBlob(imagenConvertida);
      }
    } catch (e) {
      print("Erorr saat mengupload Foto $e");
    }
  }
}
