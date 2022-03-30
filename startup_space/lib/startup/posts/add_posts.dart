import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/startup/model/startup_post_model.dart';
import 'package:startup_space/startup/posts/post_api/post_api.dart';
import 'package:startup_space/startup/posts/post_notifier/post_notifier.dart';
import 'package:startup_space/startup/startup_posts.dart';

class StartupPosts extends StatefulWidget {
  final bool isUpdating;
  const StartupPosts({Key? key, required this.isUpdating}) : super(key: key);

  @override
  _StartupPostsState createState() => _StartupPostsState();
}

class _StartupPostsState extends State<StartupPosts> {
  File? _postImageFile;
  static StartupPost _currentPost = StartupPost();
  String? _postImageUrl;
  final postImage = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();
    StartupPostNotifier postNotifier =
        Provider.of<StartupPostNotifier>(context, listen: false);
    getStartupPosts(postNotifier);

    // ignore: unnecessary_null_comparison
    if (postNotifier.currentPost != null) {
      _currentPost = postNotifier.currentPost;
    } else {
      _currentPost = StartupPost();
    }

    _postImageUrl = _currentPost.postImages;
  }

  _showPickedImage() {
    if (_postImageFile == null && _postImageUrl == null) {
      return Text("image placeholder");
    } else if (_postImageFile != null) {
      print('showing image from local file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _postImageFile!,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: const Text(
              'Change Image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => imageOptionsDialog(),
          )
        ],
      );
    } else if (_postImageUrl != null) {
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.network(
            _postImageUrl!,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: 250,
          ),
          // ignore: deprecated_member_use
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: const Text(
              'Change Post Image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => imageOptionsDialog(),
          )
        ],
      );
    }
  }

  _getImage() async {
    var getImage = (await postImage.pickImage(source: ImageSource.camera));

    if (getImage != null) {
      setState(() {
        _postImageFile = File(getImage.path);
      });
    }
  }

  pickImage(ImageSource sourceImage) async {
    final image = await ImagePicker().pickImage(source: sourceImage);
    setState(
      () {
        _postImageFile = File(image!.path);
      },
    );
    Navigator.pop(context);
  }

  imageOptionsDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () => pickImage(ImageSource.gallery),
              child: const Text(
                "gallery",
              ),
            ),
            SimpleDialogOption(
              onPressed: () => pickImage(ImageSource.camera),
              child: const Text(
                "camera",
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
              ),
            )
          ],
        );
      },
    );
  }

  _onPostDetailsUploaded(StartupPost post) {
    StartupPostNotifier startupNotifier =
        Provider.of<StartupPostNotifier>(context, listen: false);
    startupNotifier.addPost(post);
    Navigator.pop(context);
  }

  Future<void> postStartupDetails() async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      uploadPostWithImage(_currentPost, widget.isUpdating, _postImageFile!,
          _onPostDetailsUploaded);

      print("_imageFile ${_postImageFile.toString()}");
      print("_imageUrl $_postImageUrl");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.blueAccent,
          content: Text("Posted Successfully", style: TextStyle()),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          // ignore: prefer_const_constructors
          builder: (BuildContext context) => PostsByStartups(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Startup Posts"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 96, 32, 0),
              child: Column(
                children: <Widget>[
                  _showPickedImage(),
                  const SizedBox(height: 16),
                  SizedBox(height: 16),
                  _postImageFile == null && _postImageUrl == null
                      ? ButtonTheme(
                          child: MaterialButton(
                            onPressed: () => imageOptionsDialog(),
                            child: const Text(
                              'Add Image',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      : const SizedBox(height: 0),
                  const SizedBox(height: 10),
                  postDescription(),
                  const SizedBox(height: 36),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10),
                      minWidth: 200,
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        postStartupDetails();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              // ignore: prefer_const_constructors
                              return PostsByStartups();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'Post',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget postDescription() {
    return TextFormField(
      maxLines: 8,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        filled: true,
        hintText: 'Post Description',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        labelStyle: const TextStyle(color: Colors.black),
      ),
      onSaved: (String? value) {
        _currentPost.aboutPosted = value;
      },
    );
  }
}
