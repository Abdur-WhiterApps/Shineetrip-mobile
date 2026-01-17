import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;

  const ImageCarousel({
    super.key,
    required this.images, required double viewportFraction, required int height, required bool autoPlay,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => index = i),
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  widget.images[i],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.image,
                        size: 60,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 6),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
                (i) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 6,
              width: index == i ? 18 : 6,
              decoration: BoxDecoration(
                color: index == i ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
