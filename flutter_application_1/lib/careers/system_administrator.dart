import 'package:flutter/material.dart';

class SystemAdministrator extends StatelessWidget {
  const SystemAdministrator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        title: const Text("System Administrator Information"),
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
              "Become a System Administrator",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "A System Administrator (SysAdmin) is responsible for installing, configuring, and maintaining computer systems and servers. "
              "They ensure networks are running efficiently, manage user accounts, implement security measures, and handle system backups.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),

            //  Certifications
            _infoCard(
              title: "Recommended Certifications",
              content: [
                "CompTIA Server+",
                "Microsoft Certified: Windows Server Hybrid Administrator Associate",
                "Red Hat Certified System Administrator (RHCSA)",
                "Linux Professional Institute Certification (LPIC-1)",
                "AWS Certified SysOps Administrator – Associate",
                "Google Cloud Associate Cloud Engineer",
              ],
            ),

            //  Skills & Tools
            _infoCard(
              title: "Essential Skills & Tools",
              content: [
                "System installation and configuration (Windows, Linux, macOS)",
                "User account and permission management (Active Directory, LDAP)",
                "Network administration and security",
                "Server monitoring and performance tuning",
                "Scripting with PowerShell, Bash, or Python",
                "Backup and disaster recovery planning",
                "Virtualization (VMware, Hyper-V, Docker)",
                "Cloud systems management (AWS, Azure, GCP)",
              ],
            ),

            //  Duration
            _infoCard(
              title: "How Long It Takes to Become a System Administrator",
              content: [
                "Entry Level: 1–2 years (with IT or networking background)",
                "Intermediate: 2–3 years (including certifications and hands-on experience)",
                "Advanced: 3–5 years (with specialization in security or cloud systems)",
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
                      "System Administrator Career Roadmap",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/system-admin.png",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Prevent crash if image is missing
                          return Container(
                            height: 200,
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: const Text(
                              "📷 Roadmap image not found.\nAdd it to assets/sysadmin_roadmap.png",
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
                      content: Text("Coming soon: Interactive System Admin Roadmap!"),
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
                icon: const Icon(Icons.settings, color: Colors.black),
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
                        style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
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
