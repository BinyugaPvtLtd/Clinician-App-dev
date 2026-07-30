import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';

/// Full-screen PDF viewer that downloads a PDF from a network URL
/// (caching it locally) and renders it using the open-source `pdfx`
/// package — no license key required.
class PdfViewerPage extends StatefulWidget {
  final String pdfUrl;
  final String title;

  const PdfViewerPage({
    super.key,
    required this.pdfUrl,
    this.title = "Document",
  });

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  PdfControllerPinch? _pdfController;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      final file = await _downloadOrGetCachedFile(widget.pdfUrl);
      final document = PdfDocument.openFile(file.path);

      setState(() {
        _pdfController = PdfControllerPinch(document: document);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Failed to load document.";
        _isLoading = false;
      });
    }
  }

  Future<File> _downloadOrGetCachedFile(String url) async {
    final dir = await getTemporaryDirectory();
    final fileName = url.split('/').last.split('?').first; // strips query params
    final filePath = '${dir.path}/$fileName';
    final file = File(filePath);

    // Return cached copy if it already exists.
    if (await file.exists()) {
      return file;
    }

    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to download PDF (${response.statusCode})');
    }

    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!));
    }

    return PdfViewPinch(controller: _pdfController!);
  }
}