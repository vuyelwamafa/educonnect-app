import 'package:flutter/material.dart';
import 'package:flutter_application_1/careers/cybersecurity.dart';
import 'package:flutter_application_1/careers/database_administrator.dart';
import 'package:flutter_application_1/careers/it_support_technician.dart';
import 'package:flutter_application_1/careers/fullstack_developer.dart';
import 'package:flutter_application_1/careers/system_administrator.dart';



class ItCareers extends StatelessWidget {
  const ItCareers({super.key});

  @override
  Widget build(BuildContext context) {
    final programmes = [
      {
        "title": "FullStack Developer",
                "subtitle": "",

        "page": const FullstackDeveloper(),
      },
      {
        "title": "Cybersecurity Officer",
                "subtitle": "",

        "page": const CyberSecurity(),
      },
      {
        "title": "Database Administrator",
                "subtitle": "",

        "page": const DatabaseAdministrator(),
      },
      {
        "title": "IT Support Technician",
                "subtitle": "",

        "page": const ITSupportTechnician(),
      },
      {
        "title": "System Administrator",
        "subtitle": "",
        "page": const SystemAdministrator(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Explore IT Careers"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // TODO: Add share functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Share clicked")),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: programmes.length,
        itemBuilder: (context, index) {
          final programme = programmes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.school, color: Colors.blueGrey),
              title: Text(
                programme["title"] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(programme["subtitle"] as String),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => programme["page"] as Widget,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ---------- SAMPLE PAGES (replace with your real pages) ----------

class ComputerNetworkingAdvancedPage extends StatelessWidget {
  const ComputerNetworkingAdvancedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Computer Networking - Advanced Diploma")),
      body: const Center(child: Text("Details about Computer Networking Advanced Diploma")),
    );
  }
}



class ITAdvancedDiplomaPage extends StatelessWidget {
  const ITAdvancedDiplomaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Information Technology - Advanced Diploma")),
      body: const Center(child: Text("Details about IT Advanced Diploma")),
    );
  }
}
