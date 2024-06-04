import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp_challenge/app/injection.dart';
import 'package:pinapp_challenge/presentation/bloc/posts_bloc.dart';
import 'package:pinapp_challenge/presentation/pages/_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PostsBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PostRead App',
        home: const PostListPage(),
      ),
    );
  }
}
