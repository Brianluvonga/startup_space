import 'package:flutter/material.dart';
import 'package:startup_space/components/navigation.dart';

class PageTransition extends StatelessWidget {
  const PageTransition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: const Text('Proceed'),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Navigation();
              },
            ),
          );
        },
      ),
    );
  }
}
