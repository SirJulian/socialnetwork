import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String username;

  submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      SnackBar snackbar = SnackBar(
        content: Text("Bem vindo $username"),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar);
      Timer(Duration(seconds: 2), () {
        Navigator.pop(context, username);
      });
    }
  }

  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: header(
          context,
          isAppTitle: false,
          titleText: "Crie sua conta",
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Center(
                      child: Text(
                        "Crie sua conta Aqui",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      child: Form(
                        key: _formKey,
                        autovalidate: true,
                        child: TextFormField(
                          validator: (val) {
                            if (val.trim().length < 3 || val.isEmpty) {
                              return "Nome de usuário muito curto";
                            } else if (val.trim().length > 15) {
                              return "Nome de usuário muito longo";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (val) => username = val,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Usuário",
                            labelStyle: TextStyle(fontSize: 15),
                            hintText: "Mínime 3 caracteres",
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: submit,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        "Enviar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
