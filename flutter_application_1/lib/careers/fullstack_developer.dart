import 'package:flutter/material.dart';

class FullstackDeveloper extends StatelessWidget {
  const FullstackDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        title: const Text("Fullstack Developer Information"),
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
              "Become a Fullstack Developer",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "A fullstack developer works on both the front-end and back-end of web applications, "
              "understanding how the complete system works from design to deployment.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),

            //  Certifications
            _infoCard(
              title: "Certifications Needed",
              content: [
                "Fullstack Web Development Certification",
                "AWS Certified Developer",
                "Microsoft Azure Developer Associate",
                "Google Associate Cloud Engineer",
                "Meta or IBM Fullstack Developer Certificates",
              ],
            ),

            //  Languages
            _infoCard(
              title: "Languages & Technologies",
              content: [
                "HTML, CSS, JavaScript, and TypeScript",
                "Frontend: React.js, Angular, or Vue.js",
                "Backend: Node.js, Express, or Django",
                "Databases: MySQL, MongoDB, PostgreSQL",
                "APIs: RESTful & GraphQL",
                "Version Control: Git & GitHub",
                "Cloud Platforms: AWS, Azure, GCP",
              ],
            ),

            //  Duration
            _infoCard(
              title: "Duration to Become a Fullstack Developer",
              content: [
                "Beginner: 2–3 years (learning from scratch)",
                "Intermediate: 1–2 years (some programming experience)",
                "Fast-track bootcamps: 6–12 months (intensive)",
              ],
            ),

            // 🗺️ Roadmap Section
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
                      "Fullstack Developer Roadmap",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/fullstack.png",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          //  Prevent crash if image not found
                          return Container(
                            height: 200,
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: const Text(
                              "📷 Roadmap image not found.\nAdd it to assets/fullstack.png",
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
                      content: Text("Coming soon: Interactive Fullstack Roadmap!"),
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
                icon: const Icon(Icons.auto_graph, color: Colors.black),
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
                        style: TextStyle(fontSize: 18, color: Colors.blue)),
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
