import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/it_careers.dart';
import 'package:flutter_application_1/pages/it_higher_certificate_page.dart';
import 'package:flutter_application_1/pages/it_diploma_page.dart';
import 'package:flutter_application_1/pages/computer_networking_page.dart';
import 'package:flutter_application_1/pages/logout.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/cut_community/feed_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FacultiesPage extends StatefulWidget {
  const FacultiesPage({super.key});

  @override
  State<FacultiesPage> createState() => _FacultiesPageState();
}

class _FacultiesPageState extends State<FacultiesPage> {
  final TextEditingController _searchController = TextEditingController();

  // Navigate to a WebView page showing Google search results
  void _searchOnInternet(String query) {
    if (query.trim().isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebSearchPage(query: query),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6EFF6),
      appBar: AppBar(
        title: const Text("Courses"),
        backgroundColor: Colors.blue.shade900,
      ),

      // Drawer Menu
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0D47A1)),
              child: Center(
                child: Text(
                  'EduConnect',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_alt),
              title: const Text("CUT Community"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FeedPage()),
                );
              },
            ),
                        ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Logout()),
                );
              },
            ),

          ],
        ),
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search the Internet...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onSubmitted: (query) => _searchOnInternet(query),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 63, 123, 212),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => _searchOnInternet(_searchController.text),
                  child: const Text("Search"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 🧱 Grid of Course Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                children: const [
                  HigherCertificateCard(),
                  DiplomaITCard(),
                  NetworkingDiplomaCard(),
                  ITCareersCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
//  Web Search Page (In-App Browser)
//
class WebSearchPage extends StatefulWidget {
  final String query;

  const WebSearchPage({super.key, required this.query});

  @override
  State<WebSearchPage> createState() => _WebSearchPageState();
}

class _WebSearchPageState extends State<WebSearchPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final url = 'https://www.google.com/search?q=${Uri.encodeComponent(widget.query)}';

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            if (mounted) setState(() => _isLoading = false);
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.query),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

//
//  Individual Course Cards
//
class HigherCertificateCard extends StatelessWidget {
  const HigherCertificateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCourseCard(
      color: Colors.blue.shade100,
      title: "Higher Certificate in IT",
      icon: Icons.school,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ItHigherCertificatePage()),
        );
      },
    );
  }
}

class DiplomaITCard extends StatelessWidget {
  const DiplomaITCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCourseCard(
      color: Colors.blue.shade100,
      title: "Diploma in IT",
      icon: Icons.computer,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ItDiplomaPage()),
        );
      },
    );
  }
}

class NetworkingDiplomaCard extends StatelessWidget {
  const NetworkingDiplomaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCourseCard(
      color: Colors.blue.shade100,
      title: "Diploma in Networking",
      icon: Icons.router,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ComputerNetworkingPage()),
        );
      },
    );
  }
}

class ITCareersCard extends StatelessWidget {
  const ITCareersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCourseCard(
      color: Colors.blue.shade100,
      title: "IT Careers & Roadmaps",
      icon: Icons.work_outline,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ItCareers()),
        );
      },
    );
  }
}

//
// Reusable Animated Card Widget (Safe & Smooth)
//
class AnimatedCourseCard extends StatefulWidget {
  final Color color;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const AnimatedCourseCard({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  State<AnimatedCourseCard> createState() => _AnimatedCourseCardState();
}

class _AnimatedCourseCardState extends State<AnimatedCourseCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  bool _isTapped = false;

  void _onTapDown(TapDownDetails details) {
    if (!mounted) return;
    setState(() => _scale = 0.95);
  }

  void _onTapCancel() {
    if (!mounted) return;
    setState(() => _scale = 1.0);
  }

  Future<void> _handleTap() async {
    if (_isTapped) return;
    _isTapped = true;

    if (mounted) setState(() => _scale = 0.9);
    await Future.delayed(const Duration(milliseconds: 100));

    if (mounted) setState(() => _scale = 1.0);
    await Future.delayed(const Duration(milliseconds: 100));

    if (mounted) widget.onTap();

    await Future.delayed(const Duration(milliseconds: 300));
    _isTapped = false;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      child: InkWell(
        onTapDown: _onTapDown,
        onTapCancel: _onTapCancel,
        onTap: _handleTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(2, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 50, color: Colors.blue.shade900),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
