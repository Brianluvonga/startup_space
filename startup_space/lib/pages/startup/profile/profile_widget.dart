import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileSectionWidget extends StatelessWidget {
  final String? startupPicture;
  final bool isEdit;
  VoidCallback onClicked;
  ProfileSectionWidget(
      {Key? key,
      required this.startupPicture,
      this.isEdit = false,
      required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget startUpImage() {
    final image = NetworkImage(startupPicture!);
    return ClipOval(
      child: Material(
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
