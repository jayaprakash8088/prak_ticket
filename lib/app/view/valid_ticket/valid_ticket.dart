import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class ValidTicketScreen extends StatelessWidget {
  const ValidTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child:
                  const Icon(Icons.menu, color: blackColor, size: 24.0),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            
          ],
        ),
      ),
    ));
  }
}
