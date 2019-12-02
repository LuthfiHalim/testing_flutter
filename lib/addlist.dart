import 'package:flutter/material.dart';
class AddList extends StatelessWidget {
  final handleToDo;
  AddList(this.handleToDo);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kerjaan')
      ),
      body: Container(
        child: TextField(
          decoration: InputDecoration(
            helperText: 'Tuliskan Tugas Hari Ke- Berapa'
          ),
          onSubmitted: (val) {
            handleToDo(val);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}