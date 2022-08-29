import 'package:flutter/material.dart';
import 'package:flutter_basic_animations/pages/other/other_page.dart';
import 'package:flutter_basic_animations/pages/page_transition/page_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController? _animationController;
  late Tween<Size>? _tween;
  late Tween<double> _otherTween;
  late Animation<Size> _animation;
  // late Animation<double> _otherAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _tween = Tween(begin: const Size(100, 100), end: const Size(150, 150));
    _otherTween = Tween(begin: .0, end: 2);
    _animation = _tween!.animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.bounceOut));
    // _otherAnimation = _otherTween.animate(
    //     CurvedAnimation(parent: _animationController!, curve: Curves.linear));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // _animationController!.addListener(() {
    //   if (kDebugMode) {
    //     print(_animation.status);
    //   }
    //!   _animation.status == AnimationStatus.completed
    //? _animationController!
    //           .repeat(period: const Duration(milliseconds: 850))
    //       : _animationController!.forward();
    // });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(CustomPageRouteBuilder(child: const OtherPage()));
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return SizedBox.fromSize(
              size: _animation.value,
              // child: AnimatedBuilder(
              //     animation: _otherAnimation,
              //     builder: (context, _) {
              //       return Transform.rotate(
              //         angle: _otherAnimation.value * pi,
              child: const FlutterLogo(
                size: 100,
              ),
              //   );
              // }
              // )
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController!.status == AnimationStatus.completed
              ? _animationController!.reverse()
              : _animationController!.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
