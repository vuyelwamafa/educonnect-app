import 'package:flutter/material.dart';

class CyberSecurity extends StatelessWidget {
  const CyberSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        title: const Text("Cybersecurity Information"),
        backgroundColor: Colors.blue.shade100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Introduction
            const Text(
              "Become a Cybersecurity Professional",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "A cybersecurity professional protects computer systems, networks, and data from digital attacks. "
              "They identify vulnerabilities, implement security measures, and respond to incidents to ensure data integrity and privacy.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),

            //  Certifications
            _infoCard(
              title: "Popular Certifications",
              content: [
                "CompTIA Security+",
                "Certified Ethical Hacker (CEH)",
                "Certified Information Systems Security Professional (CISSP)",
                "Certified Information Security Manager (CISM)",
                "Cisco Certified CyberOps Associate",
                "GIAC Security Essentials (GSEC)",
              ],
            ),

            //  Skills & Tools
            _infoCard(
              title: "Essential Skills & Tools",
              content: [
                "Network Security & Firewalls",
                "Linux & Windows Security Administration",
                "Penetration Testing & Vulnerability Assessment",
                "Incident Response & Digital Forensics",
                "Security Information and Event Management (SIEM)",
                "Knowledge of programming (Python, Bash, C/C++)",
                "Cloud Security (AWS, Azure, GCP)",
              ],
            ),

            //  Duration
            _infoCard(
              title: "How Long It Takes to Become a Cybersecurity Professional",
              content: [
                "Beginner: 2–4 years (including certifications and training)",
                "Intermediate: 1–2 years (with IT or networking background)",
                "Fast-track bootcamps: 6–12 months (intensive practical focus)",
              ],
            ),

            //  Roadmap Section
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Cybersecurity Career Roadmap",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/cybersecurity.png",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Prevent crash if image missing
                          return Container(
                            height: 200,
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: const Text(
                              "📷 Roadmap image not found.\nAdd it to assets/cybersecurity_roadmap.png",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Coming soon: Interactive Cybersecurity Roadmap!"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.shield, color: Colors.black),
                label: const Text(
                  "Explore Learning Path",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  Reusable Info Card Widget
  static Widget _infoCard({required String title, required List<String> content}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...content.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ",
                        style: TextStyle(fontSize: 18, color: Colors.deepPurple)),
                    Expanded(
                      child: Text(item,
                          style: const TextStyle(fontSize: 16, height: 1.4)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
