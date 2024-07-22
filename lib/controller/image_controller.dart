import 'package:url_launcher/url_launcher.dart';

class UrlController {
  final Uri _url = Uri.parse("https://www.youtube.com/");

  Future<void> launchingUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
