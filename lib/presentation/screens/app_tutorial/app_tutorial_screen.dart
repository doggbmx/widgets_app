import 'package:flutter/material.dart';

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
      body: PageView(
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
    return const Placeholder();
  }
}
