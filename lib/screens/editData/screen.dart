import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:pariwisata/models/datamodel.dart';
import 'package:pariwisata/networks/updatedata.dart';
import 'package:pariwisata/screens/editData/layoutEdit.dart';
import 'package:pariwisata/styles/palete.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditData extends StatefulWidget {
  EditData({Key key, this.data}) : super(key: key);
  final Datum data;

  @override
  _EditDataState createState() => _EditDataState();
}

GlobalKey<FormBuilderState> _keyAddItem = GlobalKey<FormBuilderState>();

class _EditDataState extends State<EditData> {
  String token;

  postData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('LastToken');
    });
  }

  @override
  void initState() {
    super.initState();
    postData();
  }

  void onSave(BuildContext context, ) {
    _keyAddItem.currentState.save();
    if (_keyAddItem.currentState.validate()) {
      updateData(
        context,
        token: token,
        title: _keyAddItem.currentState.value["title"],
        desc: _keyAddItem.currentState.value["description"],
        city: _keyAddItem.currentState.value["city"],
        prov: _keyAddItem.currentState.value["province"],
        photo: _keyAddItem.currentState.value["photo"],
        id: widget.data.idProduct.toString()
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Add Item",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ProgressHUD(
          child: Builder(
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                top: 3,
                bottom: 3,
                right: 10,
                left: 10,
              ),
              child: FormBuilder(
                key: _keyAddItem,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    LayoutEditData(
                      title: "Title",
                      attribute: "title",
                      initialValue: widget.data.title,
                    ),
                    LayoutEditData(
                      maxLines: 5,
                      title: "Description",
                      attribute: "description",
                      initialValue: widget.data.description,
                    ),
                    LayoutEditData(
                      title: "City",
                      attribute: "city",
                      initialValue: widget.data.city,
                    ),
                    LayoutEditData(
                      title: "Province",
                      attribute: "province",
                      initialValue: widget.data.province,
                    ),
                    LayoutEditData(
                      title: "Photo Url",
                      attribute: "photo",
                      initialValue: widget.data.photo,
                      maxLines: 2,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 80, right: 80),
                      child: RaisedButton(
                        color: Colors.teal,
                        child: Text(
                          "Edit Data",
                          style: TextStyle(
                            color: P.white,
                          ),
                        ),
                        onPressed: () {
                          _keyAddItem.currentState.save();
                          onSave(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
