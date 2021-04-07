import 'package:dio/dio.dart';

Future<List> getInformation() async {
  var dio = Dio();
  final flutterUri = 'https://connpass.com/api/v1/event/?keyword=flutter';
  Response res;
  try{

    res = await dio.get(flutterUri);
    final List data = res.data['events'];
    // print(data[0]['event_url']);

    return data;
  }catch(e){
    print(e);
  }
}