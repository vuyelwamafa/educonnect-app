import 'package:flutter/material.dart';

class ITSupportTechnician extends StatelessWidget {
  const ITSupportTechnician({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        title: const Text("IT Support Technician Information"),
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
              "Become an IT Support Technician",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "An IT Support Technician is responsible for maintaining computer systems, "
              "troubleshooting hardware and software issues, and ensuring smooth day-to-day technology operations. "
              "They provide technical support to users, install software, and manage network connections.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),

            //  Certifications
            _infoCard(
              title: "Recommended Certifications",
              content: [
                "CompTIA A+",
                "CompTIA Network+",
                "Microsoft Certified: Modern Desktop Administrator Associate",
                "Google IT Support Professional Certificate",
                "Cisco Certified Technician (CCT)",
                "Apple Certified Support Professional (ACSP)",
              ],
            ),

            //  Skills & Tools
            _infoCard(
              title: "Essential Skills & Tools",
              content: [
                "Troubleshooting hardware and software issues",
                "Installing and configuring operating systems (Windows, macOS, Linux)",
                "Basic networking (TCP/IP, routers, switches)",
                "Active Directory and user account management",
                "Remote desktop tools and IT ticketing systems",
                "Communication and customer service skills",
                "Knowledge of cybersecurity basics and antivirus tools",
              ],
            ),

            //  Duration
            _infoCard(
              title: "How Long It Takes to Become an IT Support Technician",
              content: [
                "Entry Level: 6–12 months (with training or certification)",
                "Intermediate: 1–2 years (with hands-on experience)",
                "Advanced: 2–3 years (including specialized roles like system admin)",
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
                      "IT Support Technician Career Roadmap",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/ITsupport.png",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Prevent crash if image missing
                          return Container(
                            height: 200,
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: const Text(
                              "📷 Roadmap image not found.\nAdd it to assets/it_support_roadmap.png",
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
                      content: Text("Coming soon: Interactive IT Support Roadmap!"),
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
                icon: const Icon(Icons.computer, color: Colors.black),
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
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...content.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ",
                        style: TextStyle(fontSize: 18, color: Colors.indigo)),
                    Expanded(
                      child:
                          Text(item, style: const TextStyle(fontSize: 16, height: 1.4)),
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
