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

class ShrinkAndGrowBottomNavigationBar extends StatefulWidget {
  const ShrinkAndGrowBottomNavigationBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.elevation,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor = Colors.grey,
    this.scrollControllers,
    this.selectedIconSize = 21.0,
    this.unselectedIconSize = 18.0, // Originally, the default iconSize was 24.0.
    this.selectedLabelSize = 10.5, // Originally, the default selectedFontSize was 14.0.
    this.unselectedLabelSize = 10.0,
    required this.onTap,
  })  : assert(items.length >= 2 && items.length <= 5),
        assert(0 <= currentIndex && currentIndex < items.length),
        assert(elevation == null || elevation >= 0.0),
        assert(unselectedIconSize >= 10.0),
        assert(selectedIconSize >= unselectedIconSize),
        super(key: key);

  final List<ShrinkAndGrowBottomNavigationItem> items;
  final int currentIndex;
  final double? elevation;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final List<ScrollController?>? scrollControllers;
  final double selectedIconSize;
  final double unselectedIconSize;
  final double selectedLabelSize;
  final double unselectedLabelSize;
  final Function(int) onTap;

  @override
  State<ShrinkAndGrowBottomNavigationBar> createState() => _ShrinkAndGrowBottomNavigationBarState();
}

class _ShrinkAndGrowBottomNavigationBarState extends State<ShrinkAndGrowBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _growAnimationIcon;
  late Animation<double> _growAnimationLabel;

  late Animation<double> _shrinkAnimationIcon;
  late Animation<double> _shrinkAnimationLabel;

  int lastIndex = -1;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _growAnimationIcon = TweenSequence(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: widget.unselectedIconSize,
            end: ((widget.unselectedIconSize / 100) * 92),
          ).chain(CurveTween(curve: Curves.ease)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: ((widget.unselectedIconSize / 100) * 92),
            end: widget.selectedIconSize,
          ).chain(CurveTween(curve: Curves.ease)),
          weight: 50.0,
        ),
      ],
    ).animate(_animationController);

    _growAnimationLabel = TweenSequence(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: widget.unselectedLabelSize,
            end: ((widget.unselectedLabelSize / 100) * 92), // 92% of unselectedLabelSize
          ).chain(CurveTween(curve: Curves.ease)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: ((widget.unselectedLabelSize / 100) * 92),
            end: widget.selectedLabelSize,
          ).chain(CurveTween(curve: Curves.ease)),
          weight: 50.0,
        ),
      ],
    ).animate(_animationController);

    _shrinkAnimationIcon = TweenSequence(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: widget.selectedIconSize, end: widget.unselectedIconSize)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 100.0,
        ),
      ],
    ).animate(_animationController);

    _shrinkAnimationLabel = TweenSequence(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: widget.selectedLabelSize, end: widget.unselectedLabelSize)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 100.0,
        ),
      ],
    ).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color selectedItemColor =
        widget.selectedItemColor ?? Theme.of(context).colorScheme.onSecondary;

    return Material(
      color: Colors.transparent,
      elevation: widget.elevation ?? 8.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: widget.backgroundColor ??
                Theme.of(context)
                    .canvasColor, // Theme.of().canvasColor; 0xFF303030 (Default Canvas Color Dark Themed) or just Colors.grey[850].
          ),
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.items.map((item) {
              var icon = item.icon;
              var label = item.label;

              int index = widget.items.indexOf(item);

              return GestureDetector(
                onTap: () {
                  lastIndex = widget.currentIndex;

                  // When the same index tapped. Animate to top.
                  if (index == lastIndex) {
                    widget.scrollControllers?[index]?.animateTo(0,
                        duration: const Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
                  }

                  widget.onTap(index);

                  // The controller contains 4 animations (Icon & Label grow, Icon & Label shrink).
                  // Resetting controller.
                  _animationController.reset();

                  if (!_animationController.isCompleted) {
                    _animationController.forward();
                  } else {
                    // Reverse will NEVER be called.
                    // Its controller always being reset to get the desired selectedIcon effect.
                    _animationController.reverse();
                  }
                },
                child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Container(
                        color: Colors.transparent, // onTap called when color pressed.
                        width: (kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom),
                        height:
                            (kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom) -
                                8.0,
                        child: Transform.scale(
                          scale: 1.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                icon.icon,
                                color: widget.currentIndex == index
                                    ? selectedItemColor
                                    : widget.unselectedItemColor,
                                size: widget.currentIndex == index
                                    ? _growAnimationIcon.value
                                    : (lastIndex == index
                                        ? _shrinkAnimationIcon.value
                                        : widget.unselectedIconSize),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.0),
                              ), // Remove padding when unnecessary.
                              Text(
                                label,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: widget.currentIndex == index
                                        ? _growAnimationLabel.value
                                        : (lastIndex == index
                                            ? _shrinkAnimationLabel.value
                                            : widget.unselectedLabelSize),
                                    color: widget.currentIndex == index
                                        ? selectedItemColor
                                        : widget.unselectedItemColor),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ShrinkAndGrowBottomNavigationItem {
  final Icon icon;
  final String label;

  ShrinkAndGrowBottomNavigationItem({
    required this.icon,
    required this.label,
  });
}
