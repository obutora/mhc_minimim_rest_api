import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async{
  try {
    await launch(url);
  } catch(e){
    print(e);
  }
}