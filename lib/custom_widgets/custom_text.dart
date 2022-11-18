import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final textTitle, textDetails;
  const CustomText({Key? key,
    required this.textTitle,
    required this.textDetails
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 175,
            child: Text(textTitle),
          ),
          const VerticalDivider(width: 40,),
          SizedBox(
            height: 50,
            width: 172,
            child: Text(textDetails),
          )
        ],
      ),
    );
  }
}
