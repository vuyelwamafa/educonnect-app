import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard_pages/file_upload_page.dart';
import 'package:flutter_application_1/dashboard_pages/view_study_material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

// Import your pages here
//import 'file_upload_page.dart'; // Upload Material page
// import 'view_material_page.dart';
// import 'tutorials_page.dart';

class ItHigherCertificatePage extends StatelessWidget {
  const ItHigherCertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_DashboardCard> cards = [
      _DashboardCard(
        title: "Upload Material",
        icon: Icons.cloud_upload_outlined,
        color: Colors.blue.shade100,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FileUploadPage()),
          );
        },
      ),
      _DashboardCard(
        title: "View Study Material",
        icon: Icons.menu_book_outlined,
        color: Colors.blue.shade100,
        onTap: () {
                    Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ViewStudyMaterial()),
          );

        },
      ),
      _DashboardCard(
        title: "Tutorials",
        icon: Icons.school_outlined,
        color: Colors.blue.shade100,
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Tutorials page coming soon!")),
          );
        },
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE6EFF6),
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              "Welcome to IT Higher Certificate",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D47A1),
              ),
            ),
            const SizedBox(height: 30),

            //  Swiper for cards
            Expanded(
              child: Swiper(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return cards[index];
                },
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
                viewportFraction: 0.8,
                scale: 0.9,
                autoplay: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///  Card Widget
class _DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.blue.shade900),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
