
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pariwisata/networks/RegisterApi.dart';
import 'package:pariwisata/styles/alert.dart';
import 'package:pariwisata/styles/layout.dart';
import 'package:pariwisata/styles/palete.dart';

class FormRegister extends StatefulWidget {
  final BuildContext konteks;
  FormRegister({Key key, this.konteks}) : super(key: key);
  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool password = false;

  // FocusNode
  final FocusNode _nama = FocusNode();
  final FocusNode _tempat = FocusNode();

  final FocusNode _tlp = FocusNode();
  final FocusNode _password = FocusNode();
  final FocusNode _username = FocusNode();
  final FocusNode _konf = FocusNode();
  final FocusNode _email = FocusNode();

  String getnik;

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
      margin: EdgeInsets.only(top: SizeConfig.vertical * 22.5),
      width: SizeConfig.horizontal * 92,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          margin: EdgeInsets.only(
            top: SizeConfig.vertical * 3.5,
          ),
          padding: EdgeInsets.only(
              right: SizeConfig.horizontal * 8,
              left: SizeConfig.horizontal * 8),
          child: FormBuilder(
            key: _loginKey,
            child: Column(
              children: <Widget>[
                TextField(
                  attribute: "nama",
                  inputType: TextInputType.text,
                  hintText: "Masukkan Nama Lengkap Anda",
                  labelText: "Nama Lengkap",
                  validasi: [
                    FormBuilderValidators.required(
                        errorText: "Nama Lengkap Wajib Diisi"),
                    FormBuilderValidators.minLength(4,
                        errorText: "Nama harus lebih dari 3 charater")
                  ],
                  max: 1,
                  inputAction: TextInputAction.next,
                  focus: _nama,
                  onsubmitted: (term) {
                    _fieldFocusChange(context, _nama, _tlp);
                  },
                ),
                TextField(
                  attribute: "notlp",
                  inputType: TextInputType.number,
                  hintText: "Masukkan Nomor Telepon Anda",
                  max: 1,
                  labelText: "Nomor Telepon",
                  validasi: [
                    FormBuilderValidators.required(
                        errorText: "Nomor Telepon Wajib Diisi"),
                    FormBuilderValidators.numeric(
                        errorText: "Hanya Dapat Diisi Angka")
                  ],
                  inputAction: TextInputAction.next,
                  focus: _tlp,
                  onsubmitted: (term) {
                    _fieldFocusChange(context, _tlp, _email);
                  },
                ),
                TextField(
                  attribute: "email",
                  caps: TextCapitalization.none,
                  inputType: TextInputType.emailAddress,
                  hintText: "Masukkan Email Anda",
                  max: 1,
                  labelText: "Alamat Email",
                  validasi: [
                    FormBuilderValidators.required(
                        errorText: "Alamat Email Wajib Diisi"),
                    FormBuilderValidators.email(errorText: "Email Tidak Valid")
                  ],
                  inputAction: TextInputAction.next,
                  focus: _email,
                  onsubmitted: (term) {
                    _fieldFocusChange(context, _email, _username);
                  },
                ),
                TextField(
                  attribute: "username",
                  inputType: TextInputType.text,
                  hintText: "Masukkan Username Anda",
                  labelText: "Username",
                  validasi: [
                    FormBuilderValidators.required(
                        errorText: "Username Wajib Diisi"),
                    FormBuilderValidators.minLength(4,
                        errorText: "Username harus lebih dari 3 charater")
                  ],
                  max: 1,
                  inputAction: TextInputAction.next,
                  focus: _username,
                  onsubmitted: (term) {
                    _fieldFocusChange(context, _username, _password);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.vertical * 3),
                  child: FormBuilderTextField(
                    style: TextStyle(fontSize: SizeConfig.horizontal * 4.3),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "Password Wajib Diisi"),
                      
                    ],
                    textInputAction: TextInputAction.next,
                    attribute: "password",
                    obscureText: !password,
                    focusNode: _password,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _password, _konf);
                    },
                    decoration: InputDecoration(
                      errorStyle:
                          TextStyle(fontSize: SizeConfig.horizontal * 3),
                      contentPadding: EdgeInsets.all(SizeConfig.horizontal * 3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                      hintText: "Masukkan Password Anda",
                      labelText: "Password",
                      labelStyle:
                          TextStyle(fontSize: SizeConfig.horizontal * 3.3),
                      hintStyle:
                          TextStyle(fontSize: SizeConfig.horizontal * 3.3),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          password ? Icons.visibility : Icons.visibility_off,
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
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.vertical * 3),
                  child: FormBuilderTextField(
                    style: TextStyle(fontSize: SizeConfig.horizontal * 4.3),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "Konfirmasi Password Wajib Diisi"),                    
                    ],
                    textInputAction: TextInputAction.done,
                    attribute: "konfirmasi",
                    obscureText: !password,
                    focusNode: _konf,
                    decoration: InputDecoration(
                      errorStyle:
                          TextStyle(fontSize: SizeConfig.horizontal * 3),
                      contentPadding: EdgeInsets.all(SizeConfig.horizontal * 3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                      hintText: "Konfirmasi Password Anda",
                      labelText: "Konfirmasi Password",
                      labelStyle:
                          TextStyle(fontSize: SizeConfig.horizontal * 3.3),
                      hintStyle:
                          TextStyle(fontSize: SizeConfig.horizontal * 3.3),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          password ? Icons.visibility : Icons.visibility_off,
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
                  height: SizeConfig.vertical * 5.8,
                  width: SizeConfig.horizontal * 45,
                  margin: EdgeInsets.only(
                      top: SizeConfig.vertical * 6.5,
                      bottom: SizeConfig.vertical * 5),
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
                              "Buat Akun",
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

                      if (_loginKey.currentState.validate() &&
                          _loginKey.currentState.value['password'] ==
                              _loginKey.currentState.value['konfirmasi']) {
                        registerApi(
                          context: context,
                          username: _loginKey.currentState.value['username'],
                          nama: _loginKey.currentState.value['nama'],
                          email: _loginKey.currentState.value['email'],
                          telepon: _loginKey.currentState.value['notlp'],
                          password: _loginKey.currentState.value['password'],
                        );
                        // print( _loginKey.currentState.value['username']);
                        // print( _loginKey.currentState.value['nama']);
                        // print( _loginKey.currentState.value['email']);
                        // print( _loginKey.currentState.value['notlp']);
                        // print( _loginKey.currentState.value['password']);
                      } else {
                        showErrorAlert(context, "Mohon Periksa Formulir",
                            "Pastikan telah Terisi Semua\ndan pastikan password dengan konfirmasinya sama");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

class TextField extends StatefulWidget {
  final String attribute, hintText, labelText;
  final TextEditingController value;
  final List<String Function(dynamic)> validasi;
  final TextInputType inputType;
  final int max;
  final TextInputAction inputAction;
  final String helper;
  final FocusNode focus;
  final void Function(String) onsubmitted;
  final Widget icon;
  final TextCapitalization caps;

  TextField({
    Key key,
    this.attribute,
    this.hintText,
    this.labelText,
    this.value,
    this.validasi,
    this.inputType,
    this.max,
    this.inputAction,
    this.focus,
    this.onsubmitted,
    this.icon,
    this.helper,
    this.caps,
  }) : super(key: key);

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.vertical * 2.5),
      child: FormBuilderTextField(
          textCapitalization: widget.caps ?? TextCapitalization.words,
          onFieldSubmitted: widget.onsubmitted,
          focusNode: widget.focus,
          textInputAction: widget.inputAction,
          maxLines: widget.max,
          validators: widget.validasi,
          controller: widget.value,
          attribute: widget.attribute,
          style: TextStyle(fontSize: SizeConfig.horizontal * 4.3),
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            helperText: widget.helper,
            suffixIcon: widget.icon,
            errorStyle: TextStyle(fontSize: SizeConfig.horizontal * 3),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
            hintText: widget.hintText,
            labelText: widget.labelText,
            labelStyle: TextStyle(fontSize: SizeConfig.horizontal * 3.3),
            hintStyle: TextStyle(fontSize: SizeConfig.horizontal * 3.3),
            contentPadding: EdgeInsets.all(SizeConfig.horizontal * 3.3),
          )),
    );
  }
}
