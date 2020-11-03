import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/charts.dart';
import 'pages/expanse_list.dart';
import './services/expanse_provider.dart';
import 'package:jalali_calendar/jalali_calendar.dart';

class ExpanseHome extends StatefulWidget {
  static const PageRoute = "/ExpanseHome";

  @override
  _ExpanseHomeState createState() => _ExpanseHomeState();
}

class _ExpanseHomeState extends State<ExpanseHome> {
  int _currentpage = 0;
  StateSetter modalsetter;
  String selectedTime = "";

  final pagelists = [ExpanseList(), Charts()];
  _changepage(int index) {
    setState(() {
      _currentpage = index;
    });
  }

  Future<String> _selectedDateTime() async {
    String Temp =
        await jalaliCalendarPicker(context: context, showTimePicker: true);
    modalsetter(() {
      selectedTime = Temp;
    });
  }

  void _showAddExpanse(BuildContext ctx) //in yani chi???
  {
    final provider = Provider.of<ExpanseProvider>(context, listen: false);
    final titlecontroller = TextEditingController();
    final pricecontroller = TextEditingController();
    selectedTime = "";
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return StatefulBuilder(builder: (modalctx, setter) {
            modalsetter = setter;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "ثبت خرج جدید",
                    style: Theme.of(ctx)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "عنوان",
                    ),
                    controller: titlecontroller,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "قیمت"),
                    controller: pricecontroller,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      RaisedButton(
                        onPressed: () {
                          _selectedDateTime();
                        },
                        child: Text("زمان"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      selectedTime.isEmpty
                          ? Text("زمانی انتخاب نشده است")
                          : Text(provider.getFormatedTime(selectedTime)),
                    ],
                  ),
                  FlatButton(
                    onPressed: () {
                      provider.addExpanse(titlecontroller.text,
                          int.parse(pricecontroller.text), selectedTime);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "ثبت",
                      style: Theme.of(ctx).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.w100, color: Colors.white),
                    ),
                    color: Colors.black,
                  )
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EXPANSES",
          style: TextStyle(
              fontWeight: FontWeight.w200, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: pagelists[_currentpage],
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          children: [
            Expanded(
                child: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                _changepage(0);
              },
              color: _currentpage == 0 ? Colors.white : Colors.black,
            )),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.insert_chart),
                onPressed: () {
                  _changepage(1);
                },
                color: _currentpage == 1 ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddExpanse(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

/*BottomNavigationBar(
          backgroundColor: Colors.red[500],
          onTap: (index) {
            setState(() {
              _currentpage = index;
            });
          },
          currentIndex: _currentpage,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("مخارج")),
            BottomNavigationBarItem(
                icon: Icon(Icons.multiline_chart), title: Text("آمار")),
          ]
          ),*/
