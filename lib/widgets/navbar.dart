import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onContactTap;

  const Navbar({
    super.key,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF0A0A0F).withOpacity(0.92),
          border: const Border(
            bottom: BorderSide(color: Color(0xFF1E1E2E), width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Text(
                'Radoan.dev',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF00D4FF),
                  letterSpacing: -0.5,
                ),
              ),
              if (isWide)
                Row(
                  children: [
                    _navItem('Home', onHomeTap),
                    _navItem('About', onAboutTap),
                    _navItem('Skills', onSkillsTap),
                    _navItem('Experience', onExperienceTap),
                    _navItem('Projects', onProjectsTap),
                    _navItem('Contact', onContactTap),
                    const SizedBox(width: 16),
                    _resumeButton(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String label, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: GoogleFonts.spaceGrotesk(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _resumeButton() {
    return OutlinedButton(
      onPressed: () => launchUrl(Uri.parse(
          'https://www.linkedin.com/in/md-radoan-ahmed-33aa95213/')),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF00D4FF)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      child: Text(
        'LinkedIn',
        style: GoogleFonts.spaceGrotesk(
          color: const Color(0xFF00D4FF),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
