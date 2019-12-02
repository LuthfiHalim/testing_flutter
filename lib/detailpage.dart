import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String deskripsi;
  bool checked = false;

  Todo(this.title, this.deskripsi);
}

class DetailScreen extends StatelessWidget {
  
  final Todo todo;
  DetailScreen({Key key, @required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
        ),
      body: TextFormField(
        initialValue: '${todo.deskripsi}',
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
        hintText: 'Jelasin detailnya bro..', labelText: 'Deskripsi'),

      ),
    );
  }
}

class DetailScreenEdit extends StatelessWidget {
  final Todo kerjaan;
  final index;
  final fungsi;
  DetailScreenEdit({Key key,@required this.kerjaan, this.fungsi, this.index}): super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Kerjaan')
      ),
      body: TextFormField(
        initialValue: kerjaan.deskripsi,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
        hintText: 'Jelasin detailnya bro..', labelText: 'Deskripsi'),

         onFieldSubmitted: (val) {
           Todo kerj = Todo('title', val);
            fungsi(kerj, index);
            Navigator.pop(context);
          },
      ),
    );
  }
}