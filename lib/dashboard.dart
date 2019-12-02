import 'package:flutter/material.dart';
import 'package:flutter_statefulwidget_loginpage_luthfi/addlist.dart';
import 'package:flutter_statefulwidget_loginpage_luthfi/detailpage.dart';
import 'box_widget.dart';
import 'detailpage.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _InputData {
  String deskripsi = '';
  int urutan;
}

_InputData data = _InputData();

class _DashboardState extends State<Dashboard> {
  List<Todo> kerjaan =
      List.generate(20, (index) => Todo('Kerjaan', 'Deskripsi'));

  handleToDo(val) {
    setState(() {
      kerjaan.add(Todo('Kerjaan', val));
    });
  }

  editKerjaan(todo, index) {
    setState(() {
      kerjaan[index] = todo;
    });
  }

  removeWidget(index){
    setState(() {
      kerjaan.removeAt(index);
    });
  }

  clickCheckBox(cek, index) {
    setState(() {
      kerjaan[index].checked = cek;
    });
  }
  clickCheckAll(val){
    setState(() {
      for (var item in kerjaan) {
        item.checked = val;
      }
      checkAll = val;
    });
  }
  clickDeleteButton(){
    setState(() {
      //int total = kerjaan.length;
      for (int i = 0;i<kerjaan.length;i++) {
        if(kerjaan[i].checked){
          kerjaan.removeAt(i);
          i--;
        }
        else{

        }
      }
    });
  }

  int jumlahChecked(){
    int jumlah = 0;
    setState(() {
      for (var item in kerjaan) {
        if(item.checked){
          jumlah++;
        }
      }
    });
    return jumlah;
  }
  bool checkAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Kerjaan ${kerjaan.length}')),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Box(
                status: 'Done',
                warna: Colors.green,
                jumlah: jumlahChecked(),
                icon: Icon(Icons.check),
              ),
              Box(
                status: 'Kerjain',
                warna: Colors.red,
                jumlah: kerjaan.length - jumlahChecked(),
                icon: Icon(Icons.calendar_today),
              ),
              Box(
                status: 'Total',
                warna: Colors.black,
                jumlah: kerjaan.length,
                icon: Icon(Icons.people),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width*14/15,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Check All'),
                Checkbox(
                  value: checkAll,
                  onChanged: (val){
                    clickCheckAll(val);
                  },
                ),
                Text('Delete Checked'),
                RaisedButton.icon(
                  elevation: 0,
                  label: Card(
                    
                  ),
                  color: Colors.transparent,
                  icon: Icon(Icons.delete),
                  onPressed: (){
                    clickDeleteButton();
                  },
                ),
            ],),
          ),
          BikinContainer(kerjaan: kerjaan,editKerjaan: editKerjaan,clickCheckBox: clickCheckBox,removeWidget: removeWidget,),
         ],
       ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddList(handleToDo)));
        },
        icon: Icon(Icons.work),
        label: Text('Add'),
      ),
    );
  }
}


class BikinContainer extends StatelessWidget{

  final List<Todo> kerjaan;
  final editKerjaan;
  final clickCheckBox;
  final removeWidget;

  const BikinContainer({Key key, this.kerjaan, this.editKerjaan, this.clickCheckBox, this.removeWidget}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width*14/15,
            height: MediaQuery.of(context).size.height*6/10,
            child: kerjaan.length == 0 
            ? Text('''Tambahkan Kerjaan!



          ==>''',style: TextStyle(color: Colors.blue,fontSize: 48),)
            :ListView.builder(
              shrinkWrap: true,
              itemCount: kerjaan.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      removeWidget(index);
                    },
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreenEdit(
                                        kerjaan: kerjaan[index],
                                        index: index,
                                        fungsi: editKerjaan,
                                      )));
                        },
                        leading: Icon(Icons.work),
                        trailing: Checkbox(
                          value: kerjaan[index].checked,
                          onChanged: (val) {
                            clickCheckBox(val, index);
                          },
                        ),
                        title: kerjaan[index].checked 
                        ? Text('${kerjaan[index].deskripsi} [${index + 1}]',style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.green))
                        : Text('${kerjaan[index].deskripsi} [${index + 1}]',style: TextStyle(decoration: TextDecoration.none, color: Colors.red)),
                      
                      ),
                    ));
              },
            ),
          );
  }

}

