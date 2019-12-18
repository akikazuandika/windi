import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pariwisata/networks/reqLogin.dart';
import 'package:pariwisata/screens/registration/register.dart';
import 'package:pariwisata/styles/layout.dart';
import 'package:pariwisata/styles/palete.dart';


class FormLogin extends StatefulWidget {
  const FormLogin({Key key}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool password = false;

  @override
  void initState() {
    password = false;
    super.initState();
  }

  final GlobalKey<FormBuilderState> _loginKey = GlobalKey<FormBuilderState>();
  bool autoValidate = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.vertical * 29.5),
      width: SizeConfig.horizontal * 85,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.vertical * 5,
              ),
              padding: EdgeInsets.only(
                  right: SizeConfig.horizontal * 8,
                  left: SizeConfig.horizontal * 8),
              child: FormBuilder(
                key: _loginKey,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                        validators: [
                          FormBuilderValidators.required(
                              errorText: "Username Wajib Diisi"),
                          // FormBuilderValidators.numeri-c(
                          //     errorText: "Hanya Dapat Diisi Angka")
                        ],
                        attribute: "username",
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Masukkan Username Anda",
                            labelText: "Username",
                            labelStyle: TextStyle(
                                fontSize: SizeConfig.horizontal * 3.3),
                            hintStyle: TextStyle(
                                fontSize: SizeConfig.horizontal * 3.3),
                            contentPadding: EdgeInsets.only(bottom: 12),
                            suffixIcon: Icon(
                              Icons.people_outline,
                              color: Theme.of(context).primaryColorDark,
                            ))),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.vertical * 3),
                      child: FormBuilderTextField(
                        validators: [
                          FormBuilderValidators.required(
                              errorText: "Password Wajib Diisi")
                        ],
                        attribute: "password",
                        obscureText: !password,
                        decoration: InputDecoration(
                          hintText: "Masukkan Password Anda",
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: SizeConfig.horizontal * 3.3),
                          hintStyle: TextStyle(
                              fontSize: SizeConfig.horizontal * 3.3),
                          contentPadding: EdgeInsets.only(bottom: 12),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              password
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of password variable
                              setState(() {
                                password = !password;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: SizeConfig.vertical * 5.5,
                      width: SizeConfig.horizontal * 45,
                      margin: EdgeInsets.only(top: SizeConfig.vertical * 6.5),
                      child: FlatButton(
                        color: Colors.teal,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.lock,
                                color: P.white,
                                size: SizeConfig.horizontal * 4.5,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.horizontal * 1.5),
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      color: P.white,
                                      fontSize: SizeConfig.horizontal * 3.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          _loginKey.currentState.save();
                          if (_loginKey.currentState.validate()) {
                            requestLoginAPI(
                                context,
                                _loginKey.currentState.value['username'],
                                _loginKey.currentState.value['password']);
                           
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.vertical * 4.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Belum Punya Akun ?",
                            style: TextStyle(
                                fontSize: SizeConfig.horizontal * 3,
                             ),
                          ),
                          Container(
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Text(
                                "Buat Akun",
                                style: TextStyle(
                                    fontSize: SizeConfig.horizontal * 3,
                                  
                                    color: Colors.cyan),
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Daftar()),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
