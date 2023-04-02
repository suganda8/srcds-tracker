/*
MIT License

Copyright (c) 2023 Tegar Bangun Suganda (OVERMIND)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import 'package:flutter/material.dart';

class FadeIndexedStack extends StatefulWidget {
  const FadeIndexedStack({
    Key? key,
    this.alignment = AlignmentDirectional.topStart,
    this.textDirection,
    this.sizing = StackFit.loose,
    required this.index,
    this.duration = const Duration(milliseconds: 250),
    this.children = const <Widget>[],
  }) : super(key: key);

  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final StackFit sizing;
  final Duration duration;
  final List<Widget> children;

  /// The index of the child to show.
  final int index;

  @override
  State<FadeIndexedStack> createState() => _FadeIndexedStackState();
}

class _FadeIndexedStackState extends State<FadeIndexedStack> with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  late final Animation<double> _animation = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ),
  );

  @override
  void initState() {
    _animationController.value =
        1.0; // Init only called once, make sure no animation first time called.
    super.initState();
  }

  // According to documentation. didUpdateWidget called whenever the widget configuration changes.
  @override
  void didUpdateWidget(covariant FadeIndexedStack oldWidget) {
    // If index updated, animation controller move forward from 0.0.
    if (widget.index != oldWidget.index) {
      // 'from: 0.0' works like using reset() before forward animation.
      _animationController.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: IndexedStack(
        alignment: widget.alignment,
        textDirection: widget.textDirection,
        sizing: widget.sizing,
        index: widget.index,
        children: widget.children,
      ),
    );
  }
}
