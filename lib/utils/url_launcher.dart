import 'package:url_launcher/url_launcher.dart';

Future<void> gitHubLaunchUrl(String stringUrl) async {
  try {
    final url = Uri.parse(stringUrl);
    await launchUrl(url, mode: LaunchMode.platformDefault);
  } catch (e) {
    throw Exception(e.toString());
  }
}
