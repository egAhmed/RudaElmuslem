import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rudaelmoslem/app/lslamic/pdf_view.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';

class CardPDF extends StatefulWidget {
  final String? pathfile;

  const CardPDF({Key? key, this.pathfile}) : super(key: key);

  @override
  State<CardPDF> createState() => _CardPDFState();
}

class _CardPDFState extends State<CardPDF> {
   var image;

  @override
  void initState() {
   renderPdfImage(widget.pathfile);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/islamic/pdfview',arguments:  'assets/pdf/${widget.pathfile}.pdf');
      },
      child: Container(
        //height: 15.0.h,
       // width: 20.0.w,
        //color: Colors.amber,
        child: image!=null?Image(image: MemoryImage(image),
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,):
        Image.asset('assets/images/time.png'),
      ),
    );
  }

  Future<String> getLocalPath() async{
    var folder = await getApplicationDocumentsDirectory();
    return folder.path;
  }

  Future<File> getLocalFile(namefile) async{
    String path = await getLocalPath();
    return File('$path/$namefile');
  }

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return File(path).writeAsBytes(
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

   Future<void> renderPdfImage(String? path) async {
    // Get a path from a pdf file (we are using the file_picker package (https://pub.dev/packages/file_picker))
    // FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false,
    // type: FileType.custom, allowedExtensions: ['pdf']);
    // if (result != null) {
    // } else {
    //   // User canceled the picker
    // }
    String dir = await getLocalPath();
    if(FileSystemEntity.typeSync('$dir/$path.pdf') == FileSystemEntityType.notFound){
      var data = await rootBundle.load('assets/pdf/$path.pdf');
      await writeToFile(data, '$dir/$path.pdf');
      print('create');
    }
  

    // Initialize the renderer
     final pdf = PdfImageRendererPdf(path: '$dir/${path!}.pdf');
     
     // open the pdf document
    await pdf.open();
    // print(pdf.getPageCount());
    // open a page from the pdf document using the page index
    await pdf.openPage(pageIndex: 0);

    // get the render size after the page is loaded
    final size = await pdf.getPageSize(pageIndex: 0);

    // get the actual image of the page
    final img = await pdf.renderPage(
          pageIndex: 0,//pageIndex,
          x: 0,
          y: 0,
          width: size.width, // you can pass a custom size here to crop the image
          height: size.height, // you can pass a custom size here to crop the image
          scale: 1, // increase the scale for better quality (e.g. for zooming)
          background: Colors.white,
        );

    // close the page again
    await pdf.closePage(pageIndex: 0);

    // close the PDF after rendering the page
    pdf.close();

    // use setState to update the renderer
    setState(() {
      image = img!;
    });
  }
}