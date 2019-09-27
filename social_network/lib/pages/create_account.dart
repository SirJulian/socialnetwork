import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  String username;

  submit(){
    _formKey.currentState.save();
    Navigator.pop(context, username);
  }
  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
        appBar: header(context, isAppTitle: false, titleText: "Crie sua conta"),
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
                        child: TextFormField(
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
