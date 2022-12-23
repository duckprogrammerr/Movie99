import 'package:flutter/material.dart';
import 'package:movie99/features/walk_through/widgets/scrolling_listview.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: -10,
      child: Transform.rotate(
        angle: -0.08,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Row(mainAxisSize: MainAxisSize.min, children: const [
            ScrollingListView(duration: 20, starterIndex: 0),
            SizedBox(width: 10),
            ScrollingListView(duration: 30, reverse: true, starterIndex: 5),
            SizedBox(width: 10),
            ScrollingListView(duration: 40, starterIndex: 10),
            SizedBox(width: 10),
          ]),
        ),
      ),
    );
  }
}
