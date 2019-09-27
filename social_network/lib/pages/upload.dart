import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File file;

  handleTakePhoto() async {
    Navigator.pop(context);
    File file = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    setState(() {
      this.file = file;
    });
  }

  handleImageGallery() async {
    Navigator.pop(context);
    File file = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 675,
      maxWidth: 960,
    );
    setState(() {
      this.file = file;
    });
  }

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text("Postar"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("Foto da Câmera"),
                onPressed: handleTakePhoto,
              ),
              SimpleDialogOption(
                child: Text("Imagem da Galeria"),
                onPressed: handleImageGallery,
              ),
              SimpleDialogOption(
                child: Text("Cancelar"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  Container buildSplashscreen() {
    return Container(
      color: Theme.of(context).accentColor.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset("assets/images/upload.svg", height: 260),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Enviar imagem",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              onPressed: () => selectImage(context),
            ),
          ),
        ],
      ),
    );
  }

  buildUploadForm() {
    return Text("Imagem carregada");
  }

  @override
  Widget build(BuildContext context) {
    return file == null ? buildSplashscreen() : buildUploadForm();
  }
}
