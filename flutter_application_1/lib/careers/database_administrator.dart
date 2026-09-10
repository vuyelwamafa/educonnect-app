import 'package:flutter/material.dart';

class DatabaseAdministrator extends StatelessWidget {
  const DatabaseAdministrator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        title: const Text("Database Administrator Information"),
        backgroundColor: Colors.blue.shade100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Intro
            const Text(
              "Become a Database Administrator (DBA)",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "A Database Administrator (DBA) manages, secures, and optimizes databases that store critical information for organizations. "
              "They ensure data availability, integrity, and performance across various platforms like MySQL, Oracle, and SQL Server.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),

            //  Certifications
            _infoCard(
              title: "Recommended Certifications",
              content: [
                "Oracle Certified Professional (OCP)",
                "Microsoft Certified: Azure Database Administrator Associate",
                "AWS Certified Database – Specialty",
                "IBM Certified Database Administrator",
                "MySQL Database Administrator Certification",
                "Google Cloud Professional Data Engineer",
              ],
            ),

            //  Required Skills
            _infoCard(
              title: "Essential Skills & Tools",
              content: [
                "SQL, PL/SQL, and T-SQL proficiency",
                "Database design and normalization",
                "Backup and recovery procedures",
                "Performance tuning and optimization",
                "Data security and access control",
                "Replication and clustering",
                "Knowledge of Linux and Windows servers",
                "Familiarity with cloud databases (AWS, Azure, GCP)",
              ],
            ),

            //  Duration
            _infoCard(
              title: "How Long It Takes to Become a DBA",
              content: [
                "Beginner: 2–3 years (including SQL mastery and certification)",
                "Intermediate (IT background): 1–2 years",
                "Accelerated Bootcamps: 6–12 months with hands-on labs",
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
                      "Database Administrator Career Roadmap",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/databaseAdmin.png",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Prevent crash if image is missing
                          return Container(
                            height: 200,
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: const Text(
                              "📷 Roadmap image not found.\nAdd it to assets/dba_roadmap.png",
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

            //  Explore More Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text("Coming soon: Interactive DBA Career Roadmap!"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.storage, color: Colors.black),
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
                        style: TextStyle(fontSize: 18, color: Colors.teal)),
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
