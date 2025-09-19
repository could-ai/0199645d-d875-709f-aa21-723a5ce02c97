import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professional CV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'sans-serif',
      ),
      home: const CVPage(),
    );
  }
}

class CVPage extends StatelessWidget {
  const CVPage({super.key});

  // Helper method to launch URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 30),
              _buildSectionTitle('Professional Summary'),
              const SizedBox(height: 8),
              // TODO: Add your professional summary here
              const Text(
                'A highly motivated and results-oriented professional with 5+ years of experience in software development in France. Seeking to leverage my expertise in a challenging role within a dynamic Moroccan company. Fluent in French, Arabic, and English.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 30),
              _buildSectionTitle('Work Experience'),
              // TODO: Add your work experience here
              _buildExperienceItem(
                company: 'Tech Solutions SARL, Paris, France',
                role: 'Senior Software Engineer',
                period: 'Jan 2019 - Present',
                description:
                    '- Led the development of a cross-platform mobile application using Flutter.\n- Collaborated with a team of 5 developers to deliver high-quality software.\n- Mentored junior developers and conducted code reviews.',
              ),
              _buildExperienceItem(
                company: 'Innovatech, Lyon, France',
                role: 'Software Developer',
                period: 'Jun 2016 - Dec 2018',
                description:
                    '- Developed and maintained web applications using Dart and Angular.\n- Contributed to the full software development lifecycle.',
              ),
              const SizedBox(height: 30),
              _buildSectionTitle('Education'),
              // TODO: Add your education details here
              _buildEducationItem(
                institution: 'University of Paris-Saclay, France',
                degree: 'Master of Science in Computer Science',
                period: '2014 - 2016',
              ),
              const SizedBox(height: 30),
              _buildSectionTitle('Skills'),
              const SizedBox(height: 10),
              // TODO: Add your skills here
              _buildSkillsGrid([
                'Flutter', 'Dart', 'Firebase', 'REST APIs', 'Git',
                'Agile Methodologies', 'Problem Solving', 'Teamwork'
              ]),
              const SizedBox(height: 30),
              _buildSectionTitle('Languages'),
              const SizedBox(height: 10),
              // TODO: Add your languages here
              _buildLanguageItem('Arabic', 'Native'),
              _buildLanguageItem('French', 'Fluent'),
              _buildLanguageItem('English', 'Professional Working Proficiency'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO: Add your name here
        const Text(
          'YOUR NAME',
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // TODO: Add your job title here
        const Text(
          'Senior Flutter Developer',
          style: TextStyle(fontSize: 20, color: Colors.blueGrey),
        ),
        const SizedBox(height: 20),
        // TODO: Add your contact information here
        _buildContactInfo(Icons.phone, '+33 6 12 34 56 78', 'tel:+33612345678'),
        const SizedBox(height: 8),
        _buildContactInfo(Icons.email, 'your.email@example.com', 'mailto:your.email@example.com'),
        const SizedBox(height: 8),
        _buildContactInfo(Icons.location_on, 'Paris, France', ''),
        const SizedBox(height: 8),
        _buildContactInfo(Icons.link, 'linkedin.com/in/yourprofile', 'https://linkedin.com/in/yourprofile'),
      ],
    );
  }

  Widget _buildContactInfo(IconData icon, String text, String url) {
    return InkWell(
      onTap: url.isNotEmpty ? () => _launchURL(url) : null,
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey, size: 20),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        color: Colors.blueGrey,
      ),
    );
  }

  Widget _buildExperienceItem({required String company, required String role, required String period, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$role | $company',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            period,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem({required String institution, required String degree, required String period}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            degree,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            institution,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            period,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(List<String> skills) {
    return Wrap(
      spacing: 12.0,
      runSpacing: 12.0,
      children: skills.map((skill) => Chip(
        label: Text(skill),
        backgroundColor: Colors.blueGrey.withOpacity(0.1),
        labelStyle: const TextStyle(color: Colors.blueGrey),
      )).toList(),
    );
  }

  Widget _buildLanguageItem(String language, String proficiency) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text('$language: ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(proficiency, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
