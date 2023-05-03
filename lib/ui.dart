import 'package:flutter/material.dart';

class AnimatedUI extends StatefulWidget {
  @override
  _AnimatedUIState createState() => _AnimatedUIState();
}

class _AnimatedUIState extends State<AnimatedUI> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animation.value * 2 * 3.14,
                  child: child,
                );
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Tap on the box to start the animation",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.repeat(reverse: true);
          }
        },
        child: Icon(_controller.isAnimating ? Icons.stop : Icons.play_arrow),
      ),
    );
  }
}
