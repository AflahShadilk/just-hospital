import 'package:url_launcher/url_launcher.dart';

class ContactHelper {
  ContactHelper._();

  static Future<void> callHospital(String phone) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
      return;
    }

    throw Exception('Could not launch phone dialer');
  }
}