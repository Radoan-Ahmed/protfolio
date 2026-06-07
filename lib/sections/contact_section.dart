import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 100 : 30,
        vertical: 80,
      ),
      decoration: const BoxDecoration(color: Color(0xFF0D0D16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionLabel('CONTACT'),
          const SizedBox(height: 16),
          Text(
            'Let\'s Work Together',
            style: GoogleFonts.spaceGrotesk(
              fontSize: isWide ? 38 : 26,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'I\'m currently open to new opportunities. Whether you have a project, a job offer, or just want to say hi — my inbox is always open!',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 15,
              color: Colors.white54,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _contactButton(
                icon: Icons.email_outlined,
                label: 'riyadradoan@gmail.com',
                color: const Color(0xFF00D4FF),
                onTap: () => launchUrl(Uri.parse('mailto:riyadradoan@gmail.com')),
              ),
              _contactButton(
                icon: Icons.link,
                label: 'LinkedIn Profile',
                color: const Color(0xFF0077B5),
                onTap: () => launchUrl(Uri.parse(
                    'https://www.linkedin.com/in/md-radoan-ahmed-33aa95213/')),
              ),
              _contactButton(
                icon: Icons.code,
                label: 'GitHub Profile',
                color: const Color(0xFF7C3AED),
                onTap: () => launchUrl(Uri.parse('https://github.com/Radoan-Ahmed')),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: const Color(0xFF12121E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF00D4FF).withOpacity(0.2)),
            ),
            child: Row(
              children: [
                const Text('📍', style: TextStyle(fontSize: 24)),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Based in Dhaka, Bangladesh',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Open to remote work and international relocation',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 13,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.spaceGrotesk(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.spaceGrotesk(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF00D4FF),
        letterSpacing: 3,
      ),
    );
  }
}
