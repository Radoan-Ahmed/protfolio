import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 100 : 30,
        vertical: 80,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF0D0D16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionLabel('ABOUT ME'),
          const SizedBox(height: 16),
          Text(
            'Passionate about building\nimpactful mobile experiences.',
            style: GoogleFonts.spaceGrotesk(
              fontSize: isWide ? 38 : 26,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 40),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _aboutText()),
                    const SizedBox(width: 60),
                    Expanded(child: _educationCard()),
                  ],
                )
              : Column(
                  children: [
                    _aboutText(),
                    const SizedBox(height: 32),
                    _educationCard(),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _aboutText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I am a Flutter Developer with 3+ years of professional experience building cross-platform mobile applications. I have worked across government, financial, and retail sectors — delivering production-grade solutions used by real clients and institutions nationwide.',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 15,
            color: Colors.white60,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Currently working as Software Engineer (Flutter) at Celloscope Ltd., I specialize in building clean, scalable Flutter apps with a strong focus on UI/UX, performance, and real-world impact.',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 15,
            color: Colors.white60,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _chip('📍 Dhaka, Bangladesh'),
            _chip('💼 Open to Opportunities'),
            _chip('🌐 Available for Relocation'),
          ],
        ),
      ],
    );
  }

  Widget _educationCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF12121E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🎓 Education',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          _eduItem(
            'M.Sc in CSE (PMSCS)',
            'Jahangirnagar University',
            '2024 – 2025  |  CGPA: 3.52',
          ),
          const SizedBox(height: 20),
          _eduItem(
            'B.Sc in CSE',
            'Daffodil International University',
            '2019 – 2023  |  CGPA: 3.68',
          ),
        ],
      ),
    );
  }

  Widget _eduItem(String degree, String institution, String detail) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 3,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF00D4FF),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                degree,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                institution,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 13,
                  color: const Color(0xFF00D4FF),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                detail,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 12,
                  color: Colors.white38,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _chip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        label,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 13,
          color: Colors.white70,
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
