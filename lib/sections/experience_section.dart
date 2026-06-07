import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
          _sectionLabel('EXPERIENCE'),
          const SizedBox(height: 16),
          Text(
            'Work History',
            style: GoogleFonts.spaceGrotesk(
              fontSize: isWide ? 38 : 26,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 48),
          _experienceItem(
            title: 'Software Engineer (Flutter)',
            company: 'Celloscope Ltd.',
            period: 'Feb 2025 – Present',
            color: const Color(0xFF00D4FF),
            bullets: [
              'Developing Hisablipi — an internal accounting & financial management app',
              'Maintaining and enhancing the Agrani Smart Bank App',
              'Building cross-platform Flutter apps for Android and iOS',
              'Integrating REST APIs and managing state for smooth UX',
              'Participating in code reviews and agile sprints',
            ],
          ),
          const SizedBox(height: 32),
          _experienceItem(
            title: 'Flutter Developer',
            company: 'Doer Services PLC (DOER)',
            period: 'Apr 2023 – Feb 2025',
            color: const Color(0xFF7C3AED),
            bullets: [
              'Developed the Microcredit Regulatory Authority (MRA) mobile app — a government fintech solution',
              'Built Shaha POS — a point of sale app delivered to and used by real clients',
              'Implemented complex UI/UX designs improving user retention',
              'Collaborated with cross-functional teams in agile environment',
            ],
          ),
          const SizedBox(height: 32),
          _experienceItem(
            title: 'Android Developer Intern',
            company: 'Pioneer Alpha Company',
            period: 'Apr 2022 – Jul 2022',
            color: const Color(0xFF10B981),
            bullets: [
              'Built Android features using Java and Android Studio',
              'Gained experience in mobile UI, activity lifecycle, and API integration',
            ],
          ),
        ],
      ),
    );
  }

  Widget _experienceItem({
    required String title,
    required String company,
    required String period,
    required Color color,
    required List<String> bullets,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 2,
              height: bullets.length * 36.0 + 60,
              color: color.withOpacity(0.2),
            ),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF12121E),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        period,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 11,
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  company,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 13,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                ...bullets.map((b) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('▸ ',
                              style: TextStyle(color: color, fontSize: 12)),
                          Expanded(
                            child: Text(
                              b,
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 13,
                                color: Colors.white60,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
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
