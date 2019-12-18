import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LayoutEditData extends StatefulWidget {
  final String attribute, title;
  final int maxLines;
  final String initialValue;

  LayoutEditData(
      {Key key, this.attribute, this.title, this.maxLines, this.initialValue})
      : super(key: key);

  @override
  _LayoutEditDataState createState() => _LayoutEditDataState();
}

class _LayoutEditDataState extends State<LayoutEditData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5,
          ),
          FormBuilderTextField(
            maxLines: widget.maxLines ?? 1,
            keyboardType: TextInputType.text,
            cursorColor: Colors.blue,
            initialValue: widget.initialValue,
            attribute: widget.attribute,
            decoration: InputDecoration(
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              // labelText: "Anda Harus Mengisi Form Ini"
            ),
            validators: [
              FormBuilderValidators.required(
                  errorText: "Anda Harus Mengisi Form Ini"),
            ],
          ),
          SizedBox(
            height: 17,
          )
        ],
      ),
    );
  }
}
