import 'package:url_launcher/url_launcher.dart';

class ContactHelper {
  ContactHelper._();

  static Future<void> callHospital(
    String phoneNumber,
  ) async {
    final cleanedNumber = phoneNumber
        .replaceAll(' ', '')
        .replaceAll('-', '')
        .trim();

    if (cleanedNumber.isEmpty) {
      throw Exception(
        'Hospital phone number is empty.',
      );
    }

    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: cleanedNumber,
    );

    final launched = await launchUrl(
      phoneUri,
    );

    if (!launched) {
      throw Exception(
        'Could not open phone dialer.',
      );
    }
  }
}