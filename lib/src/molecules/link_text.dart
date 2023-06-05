import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class DsLink extends StatelessWidget {
  final String url;
  final String text;
  final String alternativeText;
  final TextStyle? style;

  const DsLink({
    Key? key,
    required this.url,
    required this.text,
    required this.alternativeText,
    this.style,
  }) : super(key: key);

  Future<void> _launchURL(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $urlString, status code: ${response.statusCode}';
      }
    } else {
      throw 'Could not launch $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      link: true,
      label: alternativeText,
      child: GestureDetector(
        onTap: () => _launchURL(url),
        child: Text(
          text,
          style: style ?? const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
