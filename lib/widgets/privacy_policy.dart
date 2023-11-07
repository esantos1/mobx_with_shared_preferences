import 'package:flutter/material.dart';
import 'package:mobxtest/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () => _openUrl('https://www.google.com/'),
        child: Text(
          'Política de privacidade',
          style: TextStyle(color: whiteColor),
        ),
      ),
    );
  }

  void _openUrl(String url) async => await launchUrl(Uri.parse(url));
}
