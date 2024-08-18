import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/cubits/comments_cubit/comments_cubit.dart';
import '../business_logic/cubits/comments_cubit/comments_state.dart';
import '../widgets/my_custom_app_bar.dart';
import 'list_of_comments.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});
  static String route = '/comments_screen';

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final List<String> comments = [];
  final TextEditingController _controller = TextEditingController();

  void _addComment() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        comments.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocListener<CommentsCubit, CommentsState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight + 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0)),
            child: MyCustomAppBar(
              label: 'التعليقات',
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 30.0,
            ),
            child: Column(
              children: [
                ListOfComments(),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: "Add a comment...",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: _addComment,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
