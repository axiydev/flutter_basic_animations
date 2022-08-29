import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_animations/pages/flip/flip_page.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> with TickerProviderStateMixin {
  late AnimationController? _animationController;
  late Tween<Offset>? _tween;
  late Tween<Offset> _otherTween;
  late Animation<Offset> _animation;
  late Animation<Offset> _otherAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _tween = Tween(begin: const Offset(-3, 0), end: const Offset(0, 0));
    _otherTween = Tween(begin: const Offset(0, 0), end: const Offset(3, 0));
    _animation = _tween!.animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.bounceOut));
    _otherAnimation = _otherTween.animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.bounceIn));

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
        title: const Text('other page'),
        actions: [
          OpenContainer(
            closedColor: Colors.transparent,
            closedElevation: .0,
            transitionDuration: const Duration(seconds: 1),
            closedBuilder: (context, action) {
              return const Icon(Icons.search);
            },
            openBuilder: (context, action) {
              return const FlipPage();
            },
          )
        ],
      ),
      body: Center(
        // child: AnimatedBuilder(
        //   animation: _animation,
        //   builder: (context, _) {
        //     return Transform.translate(
        //       offset: _animation.value,
        // child: AnimatedBuilder(
        //     animation: _otherAnimation,
        //     builder: (context, _) {
        //       return Transform.rotate(
        //         angle: _otherAnimation.value * pi,
        child: Stack(
          children: [
            SlideTransition(
              position: _animation,
              child: const FlutterLogo(
                size: 100,
              ),
            ),
            SlideTransition(
              position: _otherAnimation,
              child: const FlutterLogo(
                size: 100,
              ),
            ),
          ],
        ),
        //   );
        // }
        // )
        // );
        //   },
        // ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              _animationController!.status == AnimationStatus.completed
                  ? _animationController!.reverse()
                  : _animationController!.forward();
            },
            child: const Icon(Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}
