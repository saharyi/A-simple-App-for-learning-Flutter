import 'package:flutter/material.dart';
import 'package:forthappv3/makharej/services/expanse_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/expanse_Item.dart';

class ExpanseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expanses = Provider.of<ExpanseProvider>(context);
    return Scaffold(
      body: Center(
          child: ListView(
        children: expanses.expansess.map((ex) {
          return ExpanseItem(ex.id, ex.title, ex.price, ex.dateTime);
        }).toList(),
      )),
    );
  }
}
