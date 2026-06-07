import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 100 : 30,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionLabel('SKILLS'),
          const SizedBox(height: 16),
          Text(
            'Tech Stack',
            style: GoogleFonts.spaceGrotesk(
              fontSize: isWide ? 38 : 26,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 48),
          _skillCategory('📱 Mobile Development', [
            'Flutter', 'Dart', 'Android (Java)', 'Cross-platform',
          ], const Color(0xFF00D4FF)),
          const SizedBox(height: 32),
          _skillCategory('🔥 Backend & Database', [
            'Firebase', 'REST APIs', 'Node.js', 'PostgreSQL', 'MySQL',
          ], const Color(0xFF7C3AED)),
          const SizedBox(height: 32),
          _skillCategory('🛠️ Tools & Platforms', [
            'Git', 'GitHub', 'VS Code', 'Figma', 'Postman', 'Android Studio',
          ], const Color(0xFF10B981)),
          const SizedBox(height: 32),
          _skillCategory('💻 Languages', [
            'Dart', 'Java', 'Python', 'JavaScript', 'C', 'C++', 'SQL',
          ], const Color(0xFFF59E0B)),
        ],
      ),
    );
  }

  Widget _skillCategory(String title, List<String> skills, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills.map((skill) => _skillChip(skill, color)).toList(),
        ),
      ],
    );
  }

  Widget _skillChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Text(
        label,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 13,
          color: color,
          fontWeight: FontWeight.w600,
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
