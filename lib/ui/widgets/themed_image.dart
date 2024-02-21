import 'package:flutter/material.dart';

class ThemedImage extends StatelessWidget {
  final String imgString;
  final double? width;
  final double? height;
  const ThemedImage(
      {super.key, required this.imgString, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imgString,
          width: width,
          height: height,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(); // Return an empty container when loading
          },
        ),
        Positioned(
          child: Image.network(
            imgString,
            width: width,
            height: height,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                SizedBox(), // Hide if there's an error
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded || frame != null) {
                return SizedBox(); // Image is loaded, hide the progress indicator
              }
              return CircularProgressIndicator(
                  color: Colors.white); // Show progress indicator while loading
            },
          ),
        ),
      ],
    );
  }
}
