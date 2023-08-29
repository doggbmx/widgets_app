import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InifiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  const InifiniteScrollScreen({super.key});

  @override
  State<InifiniteScrollScreen> createState() => _InifiniteScrollScreenState();
}

class _InifiniteScrollScreenState extends State<InifiniteScrollScreen> {
  List<int> imgIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;

  final ScrollController scrollController = ScrollController();

  void addFiveImages() {
    final lastId = imgIds.last;
    imgIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imgIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imgIds[index]}/500/300'),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: isLoading ? () {} : () => context.pop(),
          child: isLoading
              ? SpinPerfect(
                  infinite: true,
                  child: const Icon(
                    Icons.refresh_outlined,
                  ),
                )
              : FadeIn(child: const Icon(Icons.arrow_back)),
        ));
  }
}
