import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfView extends StatefulWidget {
  final String? pathAsset;

  const PdfView({Key? key, this.pathAsset}) : super(key: key);

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onError: (e){},
        onPageError: (p,e){},
        onPageChanged: (p,t){},
      ).fromAsset(widget.pathAsset!),
    );
  }
}