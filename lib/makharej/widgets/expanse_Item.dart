import 'dart:js';

import 'package:flutter/material.dart';
import '../services/expanse_provider.dart';
import 'package:provider/provider.dart';

class ExpanseItem extends StatelessWidget {
  final price;
  final title;
  final id;
  final dateTime;
  ExpanseItem(this.id, this.title, this.price, this.dateTime);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpanseProvider>(context, listen: false);
    return Container(
      child: Card(
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(price.toString()),
                      )),
                      Text("تومان")
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    provider.getFormatedTime(dateTime),
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  AlertDialog alert = AlertDialog(
                    title: Text("حذف"),
                    content: Text("آیا از حذف این آیتم اطمینان دارید؟"),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          provider.deleteExpanse(id);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "بلی",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.w100, color: Colors.white),
                        ),
                        color: Colors.black,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "خیر",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.w100, color: Colors.white),
                        ),
                        color: Colors.black,
                      )
                    ],
                  );
                  showDialog(context: context, builder: (_) => alert);
                },
              ),
            ],
          )),
    );
  }
}
