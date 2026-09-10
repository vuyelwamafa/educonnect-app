import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/dashboard_pages/view_study_material.dart';

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({super.key});

  @override
  State<FileUploadPage> createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  File? _selectedFile;
  String? _fileName;
  bool _isUploading = false;
  bool _isImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6EFF6),
      appBar: AppBar(
        title: const Text("Upload Study Material"),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ViewStudyMaterial(),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: _selectedFile == null
                  ? const Center(child: Text("No file selected"))
                  : _isImage
                      ? Image.file(_selectedFile!, fit: BoxFit.contain)
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.insert_drive_file,
                                  size: 80, color: Colors.grey),
                              const SizedBox(height: 10),
                              Text(_fileName ?? '',
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: _fileName ?? "",
              decoration: const InputDecoration(
                labelText: "Rename File",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _fileName = value,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _pickFile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  icon: const Icon(Icons.attach_file, color: Colors.white),
                  label: const Text("Select File",
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton.icon(
                  onPressed: _isUploading ? null : _uploadFile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  icon: const Icon(Icons.cloud_upload, color: Colors.white),
                  label: _isUploading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text("Upload File",
                          style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null || result.files.single.path == null) return;

    final file = File(result.files.single.path!);
    final fileName = result.files.single.name;
    final isImage = ['.png', '.jpg', '.jpeg', '.gif', '.bmp']
        .any((ext) => fileName.toLowerCase().endsWith(ext));
    final fileSize = await file.length();
    final canPreviewImage = isImage && fileSize <= 1024 * 1024;

    setState(() {
      _selectedFile = file;
      _fileName = fileName;
      _isImage = canPreviewImage;
    });
  }

  Future<void> _uploadFile() async {
    if (_selectedFile == null || _fileName == null) return;
    setState(() => _isUploading = true);

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("User not logged in");
      }

      final storageRef =
          FirebaseStorage.instance.ref().child('uploads/$_fileName');
      final uploadTask = await storageRef.putFile(_selectedFile!);
      final fileUrl = await uploadTask.ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('uploads').add({
        'fileName': _fileName,
        'fileUrl': fileUrl,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': user.uid, // ✅ Store UID for linking
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ File uploaded successfully!")),
      );

      setState(() {
        _selectedFile = null;
        _fileName = null;
        _isImage = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Upload failed: $e")),
      );
    } finally {
      setState(() => _isUploading = false);
    }
  }
}
