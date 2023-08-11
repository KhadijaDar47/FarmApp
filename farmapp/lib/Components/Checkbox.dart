import 'package:flutter/material.dart';

class SquareCheckbox extends StatefulWidget {
  @override
  _SquareCheckboxState createState() => _SquareCheckboxState();
}

class _SquareCheckboxState extends State<SquareCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  bool isChecked = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Color.fromARGB(255, 56, 121, 233),
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
      if (isChecked) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: _colorAnimation.value,
              border: Border.all(
                color: isChecked
                    ? Color.fromARGB(255, 56, 121, 233)
                    : Colors.grey.shade400,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: isChecked
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16.0,
                  )
                : null,
          );
        },
      ),
    );
  }
}
