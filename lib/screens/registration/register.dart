import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:pariwisata/screens/registration/top_section.dart';
import 'package:pariwisata/styles/layout.dart';

import 'form_register.dart';

class Daftar extends StatefulWidget {
  const Daftar({Key key}) : super(key: key);

  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
 
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.vertical * 0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.cyan,
        ),
      ),
      body:ProgressHUD(
            child: Builder(
          builder: (context) => ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(bottom: SizeConfig.vertical * 5),
        children: <Widget>[
          Stack(
            children: <Widget>[
              TopSection(),
              Center(
                child: FormRegister(
                  konteks: context,
                ),
              )
            ],
          ),
        ],
      ),)) 
      
      
    );
  }
}
