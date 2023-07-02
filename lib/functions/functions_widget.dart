import 'package:url_launcher/url_launcher.dart';

Future<void> openURL({required Uri uri}) async {
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

Uri parseURL({required String url}) {
  final Uri uri = Uri.parse(url);
  return uri;
}
