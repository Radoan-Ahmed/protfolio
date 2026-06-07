import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;
  const HeroSection({super.key, required this.onContactTap});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 600),
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 100 : 30,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Greeting
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF00D4FF).withOpacity(0.4)),
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF00D4FF).withOpacity(0.06),
            ),
            child: Text(
              '👋 Hello, World!',
              style: GoogleFonts.spaceGrotesk(
                color: const Color(0xFF00D4FF),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Name
          Text(
            'Md. Radoan Ahmed',
            style: GoogleFonts.spaceGrotesk(
              fontSize: isWide ? 58 : 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.1,
              letterSpacing: -2,
            ),
          ),
          const SizedBox(height: 16),
          // Animated role
          Row(
            children: [
              Text(
                'I build ',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: isWide ? 28 : 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white54,
                ),
              ),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Flutter Apps.',
                    textStyle: GoogleFonts.spaceGrotesk(
                      fontSize: isWide ? 28 : 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF00D4FF),
                    ),
                    speed: const Duration(milliseconds: 80),
                  ),
                  TypewriterAnimatedText(
                    'Mobile Solutions.',
                    textStyle: GoogleFonts.spaceGrotesk(
                      fontSize: isWide ? 28 : 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF7C3AED),
                    ),
                    speed: const Duration(milliseconds: 80),
                  ),
                  TypewriterAnimatedText(
                    'Production Apps.',
                    textStyle: GoogleFonts.spaceGrotesk(
                      fontSize: isWide ? 28 : 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF00D4FF),
                    ),
                    speed: const Duration(milliseconds: 80),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Subtitle
          SizedBox(
            width: isWide ? 560 : double.infinity,
            child: Text(
              'Flutter Developer with 3+ years of experience building production-grade mobile applications for government, financial, and retail sectors.',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                color: Colors.white54,
                height: 1.7,
              ),
            ),
          ),
          const SizedBox(height: 40),
          // CTA Buttons
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ElevatedButton(
                onPressed: onContactTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4FF),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: Text(
                  'Get In Touch →',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () => launchUrl(Uri.parse('https://github.com/Radoan-Ahmed')),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white24),
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  'View GitHub',
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          // Stats
          Wrap(
            spacing: 40,
            runSpacing: 24,
            children: [
              _statItem('3+', 'Years Experience'),
              _statItem('10+', 'Projects Delivered'),
              _statItem('2', 'Companies'),
              _statItem('1', 'Govt. Project'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF00D4FF),
            height: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13,
            color: Colors.white38,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
