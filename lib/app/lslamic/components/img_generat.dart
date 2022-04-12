// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:printing/printing.dart';

// Future getImage() async {
//   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//   final tempDir = await getTemporaryDirectory();
//   final path = tempDir.path;
//   int rand = new Math.Random().nextInt(10000000);
//   imge.Image imagee = imge.decodeImage(image.readAsBytesSync());
//   imge.Image smallerImage = imge.copyResize(imagee, 500);
//   setState(() {
//    var  _image =  new   File('$path/img_$rand.jpg')..writeAsBytesSync(imge.encodeJpg(smallerImage, quality: 85));

//    _sharePdf(_image);
//   });


// }



//  PDFDocument _generateDocument(File _image)  {
//     final pdf = new PDFDocument(deflate: zlib.encode);
//     final page = new PDFPage(pdf, pageFormat: PDFPageFormat.LETTER);
//     final g = page.getGraphics();
//     final font = new PDFFont(pdf);
//     final top = page.pageFormat.height;

//     print(top);

//     imge.Image img = imge.decodeImage(_image.readAsBytesSync());


//     PDFImage image = new PDFImage(
//        pdf,
//        image: img.data.buffer.asUint8List(),
//        width: img.width,
//        height: img.height);

//    g.drawImage(image, 100.0, top - 150.0, 80.0, 100.0);

//     return pdf;
//   }

//   void _sharePdf(File _image) {
//     print("Share ...");
//     final pdf = _generateDocument(_image);

//     // Calculate the widget center for iPad sharing popup position
//     final RenderBox referenceBox =
//     shareWidget.currentContext.findRenderObject();
//     final topLeft =
//     referenceBox.localToGlobal(referenceBox.paintBounds.topLeft);
//     final bottomRight =
//     referenceBox.localToGlobal(referenceBox.paintBounds.bottomRight);
//     final bounds = new Rect.fromPoints(topLeft, bottomRight);

//     Printing.sharePdf(document: pdf, bounds: bounds, bytes: null);
//   }