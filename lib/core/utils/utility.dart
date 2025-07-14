import 'package:url_launcher/url_launcher.dart';

import '../utils/app_log.dart';
import '../utils/toast.dart';

String cleanPhoneNumber(String input) {
  return input.replaceAll(RegExp(r'\s+'), '');
}

void openDialer(String number) async {
  final url = "tel:${cleanPhoneNumber(number)}";
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

void openInAppWebView({String? path, String? fragment}) async {
  Uri uri = Uri(scheme: 'https', host: 'vejentiljura.dk', path: path ?? '/', fragment: fragment);
  AppLog.log(uri.toString());
  try {
    await launchUrl(uri, mode: LaunchMode.inAppWebView);
  } catch (e) {
    showToastMessage('Could not launch $path');
  }
}

void openEmail({required String emailAddress}) async {
  try {
    Uri email = Uri(
      scheme: 'mailto',
      path: "manishpaul.dev@gmail.com",
      queryParameters: {'subject': "Testing subject"},
    );
    await launchUrl(email);
  } catch (e) {
    AppLog.log(e.toString());
  }
}

void openMap(double lat, double lon) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
