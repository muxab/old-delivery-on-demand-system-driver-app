import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CircularProgressIndicator(
            // valueColor: AlwaysStoppedAnimation(
            //   Colors.red,
            // ),
            // // strokeWidth: 4,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
