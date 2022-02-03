import 'package:flutter/material.dart';

bool togglevalue = false;

class SwipeButton extends StatefulWidget {
  const SwipeButton({Key? key}) : super(key: key);

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 1000),
      height: 20,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: togglevalue ? const Color(0xffC51DA8) : Colors.grey.withOpacity(0.5),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(microseconds: 1000),
            curve: Curves.easeIn,
            child: InkWell(
              onTap: () {
                setState(() {
                  togglevalue = !togglevalue;
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: togglevalue
                    ? Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 15.0,
                        key: UniqueKey(),
                      )
                    : Icon(
                        Icons.circle,
                        color: Colors.grey,
                        size: 15.0,
                        key: UniqueKey(),
                      ),
              ),
            ),
            top: 3.0,
            left: togglevalue ? 40 : 0.0,
            right: togglevalue ? 0.0 : 40.0,
          ),
        ],
      ),
    );
  }
}
