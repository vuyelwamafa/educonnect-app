import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewStudyMaterial extends StatelessWidget {
  const ViewStudyMaterial({super.key});

  // Function to open a file URL
  Future<void> _openFile(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open file';
    }
  }

  // Fetch uploader info (name, email, photo)
  Future<Map<String, String>> _getUserInfo(String? userId) async {
    if (userId == null || userId.isEmpty) {
      return {'name': 'Unknown User', 'email': '', 'photoUrl': ''};
    }

    try {
      final userDoc =
          await FirebaseFirestore.instance.collection('users').doc(userId).get();

      if (userDoc.exists) {
        final data = userDoc.data()!;
        return {
          'name': (data['name'] as String?)?.isNotEmpty == true
              ? data['name'] as String
              : 'Unknown User',
          'email': (data['email'] as String?) ?? '',
          'photoUrl': (data['photoUrl'] as String?) ?? '',
        };
      }
    } catch (e) {
      // ignore errors, return defaults
    }

    return {'name': 'Unknown User', 'email': '', 'photoUrl': ''};
  }

  // Show popup profile view
  void _showUploaderProfile(BuildContext context, Map<String, String> user) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: user['photoUrl']!.isNotEmpty
                    ? NetworkImage(user['photoUrl']!)
                    : null,
                child: user['photoUrl']!.isEmpty
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
              const SizedBox(height: 15),
              Text(
                user['name']!,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                user['email']!,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.close, color: Colors.white),
                label: const Text("Close",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6EFF6),
      appBar: AppBar(
        title: const Text("Study Materials"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('uploads')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final uploads = snapshot.data!.docs;

          if (uploads.isEmpty) {
            return const Center(child: Text("No study materials uploaded yet 😅"));
          }

          return ListView.builder(
            itemCount: uploads.length,
            itemBuilder: (context, index) {
              final data = uploads[index].data() as Map<String, dynamic>;
              final fileName = (data['fileName'] as String?) ?? 'Unnamed File';
              final fileUrl = (data['fileUrl'] as String?) ?? '';
              final userId = data['userId'] as String?;
              final timestamp = data['timestamp'] != null
                  ? (data['timestamp'] as Timestamp).toDate()
                  : null;

              return FutureBuilder<Map<String, String>>(
                future: _getUserInfo(userId),
                builder: (context, userSnapshot) {
                  final uploader = userSnapshot.data ??
                      {'name': 'Loading...', 'email': '', 'photoUrl': ''};
                  final uploaderName = uploader['name']!;
                  final uploaderPhoto = uploader['photoUrl']!;

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Uploader info (tappable)
                          GestureDetector(
                            onTap: () => _showUploaderProfile(context, uploader),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: uploaderPhoto.isNotEmpty
                                      ? NetworkImage(uploaderPhoto)
                                      : null,
                                  child: uploaderPhoto.isEmpty
                                      ? const Icon(Icons.person, size: 20)
                                      : null,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      uploaderName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    if (timestamp != null)
                                      Text(
                                        "Uploaded on: ${timestamp.toLocal().toString().split('.')[0]}",
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),

                          // File info row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  fileName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.download,
                                    color: Colors.green),
                                onPressed: () => _openFile(fileUrl),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
