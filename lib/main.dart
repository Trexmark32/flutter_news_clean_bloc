import 'package:flutter/material.dart';
import 'package:flutter_clean_demo/features/article/presentation/pages/news_feed_page.dart';
import 'package:flutter_clean_demo/injection_container.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 61, 199, 183),
        ),
        useMaterial3: true,
      ),
      home: const NewsFeedPage(),
    );
  }
}
