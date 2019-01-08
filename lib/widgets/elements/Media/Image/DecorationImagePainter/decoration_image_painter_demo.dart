import 'package:flutter/material.dart';

class DecorationImagePainterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

// class ImagePainter extends CustomPainter{


//   Future<ui.Image> getImage(String path) async {
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
//     FrameInfo frameInfo = await codec.getNextFrame();
//     image = frameInfo.image;
//     return image;
// }

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//     ..color = Colors.black12
//     ..strokeCap = StrokeCap.round
//     ..strokeWidth = 3.0;
//     Image _image = Image(image: AssetImage('assets/images/food03.jpeg'),);
//     canvas.drawImage(_image,Offset.zero & size,paint));
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return false;
//   }
// }