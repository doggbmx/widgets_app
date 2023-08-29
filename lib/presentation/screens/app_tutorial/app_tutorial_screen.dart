import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imagePath;

  const SlideInfo({
    required this.title,
    required this.caption,
    required this.imagePath,
  });
}

final slides = <SlideInfo>[
  const SlideInfo(
      title: 'Busca la comida',
      caption: 'Laborum non magna nostrud ad.',
      imagePath: 'assets/images/1.png'),
  const SlideInfo(
      title: 'Entrega Rapida',
      caption:
          'Sint nulla sint aliquip cupidatat quis velit cupidatat quis est aliqua eu.',
      imagePath: 'assets/images/2.png'),
  const SlideInfo(
      title: 'Disfruta la comida',
      caption: 'Anim veniam aliqua voluptate velit aliqua adipisicing.',
      imagePath: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imagePath: slideData.imagePath,
                  ),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Skip'),
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imagePath;
  const _Slide({
    required this.title,
    required this.caption,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imagePath),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
