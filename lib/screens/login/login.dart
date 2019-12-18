import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:pariwisata/screens/home/home.dart';
import 'package:pariwisata/screens/login/top_section.dart';
import 'package:pariwisata/styles/layout.dart';
import 'package:pariwisata/styles/palete.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'form_login.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool loginStatus = prefs.getBool('login') ?? false;
    return loginStatus;
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Scaffold(
            body: Container(
              child: Center(),
            ),
          );
        } else {
          return (snapshot.data) ? HomePage() : uiLogin(context);
        }
      },
    );
  }

  Widget uiLogin(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.vertical * 0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.cyan,
          ),
        ),
        body: ProgressHUD(
            child: Builder(
          builder: (context) => ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  TopSection(),
                  Center(
                    child: FormLogin(),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Text(
                      'Copyright 2019 Caca Wilda Andika',
                      style: TextStyle(
                          color: P.deepDark,
                          fontSize: SizeConfig.horizontal * 3,
                          fontWeight: FontWeight.w600),
                    )),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
