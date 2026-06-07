import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
          _sectionLabel('PROJECTS'),
          const SizedBox(height: 16),
          Text(
            'Featured Work',
            style: GoogleFonts.spaceGrotesk(
              fontSize: isWide ? 38 : 26,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 48),
          isWide
              ? GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.4,
                  children: _projects(),
                )
              : Column(
                  children: _projects()
                      .map((p) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: p,
                          ))
                      .toList(),
                ),
        ],
      ),
    );
  }

  List<Widget> _projects() {
    return [
      _projectCard(
        emoji: '📊',
        title: 'Hisablipi',
        subtitle: 'Accounting App — In Progress',
        description: 'Internal Flutter-based accounting and financial management app at Celloscope Ltd. Full-cycle development including UI, API integration, and business logic.',
        tags: ['Flutter', 'Dart', 'REST API'],
        color: const Color(0xFF00D4FF),
        liveUrl: null,
        githubUrl: null,
        badge: 'In Progress',
      ),
      _projectCard(
        emoji: '🛒',
        title: 'Shaha POS',
        subtitle: 'Point of Sale — Client Deployed',
        description: 'Production POS application delivered to a real client. Handles retail workflows including sales, inventory, and transaction management.',
        tags: ['Flutter', 'Dart', 'Firebase'],
        color: const Color(0xFF7C3AED),
        liveUrl: null,
        githubUrl: null,
        badge: 'Live',
      ),
      _projectCard(
        emoji: '🏥',
        title: 'Aculife Healthcare',
        subtitle: 'Flutter Web — Client Deployed',
        description: 'Healthcare website with appointment booking, doctor listing, services, and location. Built with Flutter Web and deployed to production.',
        tags: ['Flutter Web', 'Dart'],
        color: const Color(0xFF10B981),
        liveUrl: 'https://aculifehealthcareandresearch.com',
        githubUrl: 'https://github.com/Radoan-Ahmed/website',
        badge: 'Live',
      ),
      _projectCard(
        emoji: '🏦',
        title: 'Agrani Smart Bank',
        subtitle: 'Banking App — Live',
        description: 'Mobile banking application for the fintech sector. Maintained and shipped multiple feature updates with zero critical production issues.',
        tags: ['Flutter', 'Dart', 'REST API'],
        color: const Color(0xFFF59E0B),
        liveUrl: null,
        githubUrl: null,
        badge: 'Live',
      ),
      _projectCard(
        emoji: '🏛️',
        title: 'MRA App',
        subtitle: 'Government App — Live',
        description: 'Government-deployed mobile application for the Microcredit Regulatory Authority of Bangladesh. Used by microfinance institutions nationwide.',
        tags: ['Flutter', 'Dart', 'Firebase'],
        color: const Color(0xFFEF4444),
        liveUrl: null,
        githubUrl: null,
        badge: 'Government',
      ),
    ];
  }

  Widget _projectCard({
    required String emoji,
    required String title,
    required String subtitle,
    required String description,
    required List<String> tags,
    required Color color,
    required String? liveUrl,
    required String? githubUrl,
    required String badge,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF12121E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 28)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badge,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 11,
                    color: color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              description,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 13,
                color: Colors.white54,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags
                .map((tag) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 11,
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ))
                .toList(),
          ),
          if (liveUrl != null || githubUrl != null) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                if (liveUrl != null)
                  TextButton.icon(
                    onPressed: () => launchUrl(Uri.parse(liveUrl)),
                    icon: const Icon(Icons.open_in_new, size: 14),
                    label: Text('Live', style: GoogleFonts.spaceGrotesk(fontSize: 13)),
                    style: TextButton.styleFrom(foregroundColor: color),
                  ),
                if (githubUrl != null)
                  TextButton.icon(
                    onPressed: () => launchUrl(Uri.parse(githubUrl)),
                    icon: const Icon(Icons.code, size: 14),
                    label: Text('GitHub', style: GoogleFonts.spaceGrotesk(fontSize: 13)),
                    style: TextButton.styleFrom(foregroundColor: Colors.white54),
                  ),
              ],
            ),
          ],
        ],
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
