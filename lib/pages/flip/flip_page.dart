import 'package:flutter/material.dart';

class FlipPage extends StatefulWidget {
  const FlipPage({super.key});

  @override
  State<FlipPage> createState() => _FlipPageState();
}

class _FlipPageState extends State<FlipPage> with TickerProviderStateMixin {
  late AnimationController? _animationController;
  late Tween<double> _tween;
  late Animation<double> _animation;
  late Tween<AlignmentGeometry> _tweenAlign;
  late Animation<AlignmentGeometry> _animationAlign;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _tween = Tween(begin: .0, end: 1);

    _animation = _tween.animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.linear));

    _tweenAlign = Tween<AlignmentGeometry>(
        begin: Alignment.centerLeft, end: Alignment.centerRight);
    _animationAlign = _tweenAlign.animate(CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(0.2, 0.8, curve: Curves.bounceIn)));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flip'),
      ),
      body: Column(
        children: [
          AlignTransition(
            alignment: _animationAlign,
            child: const FlutterLogo(
              size: 200,
            ),
          ),
          SizeTransition(
            sizeFactor: _animation,
            child: const FlutterLogo(
              size: 200,
            ),
          ),

          ///PositionTransition
        ],
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

  Widget get _humanIconWidget => Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Icon(
          Icons.accessibility,
          size: 50,
          color: Colors.white,
        ),
      );
}
