import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/experience_section.dart';
import 'sections/contact_section.dart';
import 'widgets/navbar.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radoan Ahmed | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00D4FF),
          secondary: Color(0xFF7C3AED),
          surface: Color(0xFF12121A),
        ),
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.8, -0.8),
                radius: 1.2,
                colors: [
                  Color(0xFF0D1B2A),
                  Color(0xFF0A0A0F),
                ],
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 80),
                HeroSection(key: _heroKey, onContactTap: () => _scrollTo(_contactKey)),
                AboutSection(key: _aboutKey),
                SkillsSection(key: _skillsKey),
                ExperienceSection(key: _experienceKey),
                ProjectsSection(key: _projectsKey),
                ContactSection(key: _contactKey),
                _buildFooter(),
              ],
            ),
          ),
          // Navbar
          Navbar(
            onHomeTap: () => _scrollTo(_heroKey),
            onAboutTap: () => _scrollTo(_aboutKey),
            onSkillsTap: () => _scrollTo(_skillsKey),
            onProjectsTap: () => _scrollTo(_projectsKey),
            onExperienceTap: () => _scrollTo(_experienceKey),
            onContactTap: () => _scrollTo(_contactKey),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Text(
        '© 2025 Md. Radoan Ahmed. Built with Flutter Web.',
        style: GoogleFonts.spaceGrotesk(
          color: Colors.white30,
          fontSize: 13,
        ),
      ),
    );
  }
}
