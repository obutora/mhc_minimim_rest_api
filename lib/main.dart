import 'package:flutter/material.dart';
import 'package:mhc_minimum_rest_api/model/url_launcher.dart';
import 'model/api_access.dart';
import 'model/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Model _model = Model();

  // final info = await getInformation();
  // final List<Model> modelList = _model.getModelList(info);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: FutureBuilder(
            future: getInformation(),//GET
            builder: (context, snapshot) {
              if(snapshot.connectionState != ConnectionState.done){
                return CircularProgressIndicator(
                );
              }

              if(snapshot.connectionState == ConnectionState.done){
               final List<Model> modelList = _model.getModelList(snapshot.data);
               print(modelList[0].title);

                return ListView.builder(
                 itemCount: 10,
                 itemBuilder: (context, index) {
                   final Model model = modelList[index];
                   return Padding(
                     padding: const EdgeInsets.all(4.0),
                     child: InfoCard(model: model),
                   );
                 },);
              }

              else {
                return SizedBox();
              }


            }
          ),
        ));
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key key,
    @required this.model,
  }) : super(key: key);

  final Model model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      title: Text(model.title, style: kGrayText(),),
      subtitle: Text(model.date.month.toString()+'月'+model.date.day.toString()+'日'),
      trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white
          ),
          onPressed: () async{
        await openUrl(model.url);
      }, child: Text('🔎 詳細', style: kGrayText(),)),
    );
  }
}

TextStyle kGrayText() => TextStyle(color: Colors.black87);