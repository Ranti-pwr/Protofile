import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  final double height = 100;

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Could not launch URL
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            children: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.facebookF,
                  color: Color(0xFF4267B2),
                ),
                onPressed: () => _launchURL('https://facebook.com/sofiandd'),
                tooltip: 'Facebook',
              ),
              // IconButton(
              //   icon: Icon(FontAwesomeIcons.twitter, color: Color(0xFF1DA1F2)),
              //   onPressed: () => _launchURL('https://twitter.com/sofiandd'),
              //   tooltip: 'Twitter',
              // ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.instagram,
                  color: Color(0xFFE1306C),
                ),
                onPressed: () => _launchURL('https://instagram.com/sofiandd'),
                tooltip: 'Instagram',
              ),
              // IconButton(
              //   icon: Icon(FontAwesomeIcons.linkedin, color: Color(0xFF0A66C2)),
              //   onPressed: () => _launchURL('https://linkedin.com/in/sofiandd'),
              //   tooltip: 'LinkedIn',
              // ),
              IconButton(
                icon: Icon(Icons.email, color: Color(0xFF007AFF)),
                onPressed: () => _launchURL('mailto:sofiand855@gmail.com'),
                tooltip: 'Email',
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.github,
                  color: Color.fromARGB(255, 80, 86, 92),
                ),
                onPressed: () => _launchURL('https://github.com/Ranti-pwr'),
                tooltip: 'GitHub',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '© ${DateTime.now().year} Sofiandd. All rights reserved.',
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
