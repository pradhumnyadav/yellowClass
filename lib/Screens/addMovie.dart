import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yellow_class_proj/movie_model.dart';
import 'package:flutter/analysis_options_user.yaml';

class AddMovie extends StatefulWidget {
 
  final formkey = GlobalKey<FormState>();
  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  String title, detail;
  submitData() async {
    if (widget.formkey.currentState.validate()) {
      Box<MovieModel> todoBox = Hive.box<MovieModel>('todos');
      todoBox.add(MovieModel(title: title, detail: detail));
      Navigator.of(context).pop();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Movie",style: TextStyle(fontFamily: 'Montserrat'),
        ),
        
      ),
       body: Form(
          key: widget.formkey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Add title'),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Add description'),
                onChanged: (value) {
                  setState(() {
                    detail = value;
                  });
                },
              ),
              ElevatedButton(onPressed: submitData, child: Text('Submit Data'))
            ],
          )),
    );
  }
}