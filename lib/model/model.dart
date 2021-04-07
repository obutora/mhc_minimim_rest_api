import 'package:flutter/material.dart';

class Model{
  String title;
  DateTime date;
  String url;

  Model({
   this.title,
   this.date,
   this.url
});

  List<Model> getModelList(List dataList){
    List<Model> modelList =[];

    dataList.forEach((element) {
      final Model model = Model(
        title: element['title'],
        date: DateTime.parse(element['started_at']),
        url: element['event_url'],
      );
      modelList.add(model);
    });

    return modelList;
  }
}