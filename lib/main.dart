import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/navigation_bar.dart';
import 'widgets/footer.dart';
import 'widgets/project_list.dart';
import 'widgets/testimonials.dart';
import 'widgets/dark_mode_toggle.dart';
import 'widgets/scroll_to_top_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: PortfolioApp(),
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode(bool isOn) {
    _isDarkMode = isOn;
    notifyListeners();
  }
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  // Define a bold, modern color palette
  static const MaterialColor primarySwatch =
      MaterialColor(0xFF6C63FF, <int, Color>{
        50: Color(0xFFEDEBFF),
        100: Color(0xFFC9C6FF),
        200: Color(0xFFA39FFF),
        300: Color(0xFF7F77FF),
        400: Color(0xFF655EFF),
        500: Color(0xFF4B45FF),
        600: Color(0xFF3F3BFF),
        700: Color(0xFF342FFF),
        800: Color(0xFF2925FF),
        900: Color(0xFF1A14FF),
      });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: primarySwatch,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: primarySwatch,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: NavigationBarWidget(),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Center(child: AnimatedTextWidget(text: 'Project SAYA')),
                const SizedBox(height: 32),
                ProjectListWidget(),
                const SizedBox(height: 32),
                TestimonialsWidget(),
                const SizedBox(height: 32),
                Center(
                  child: DarkModeToggle(
                    onToggle: (isOn) {
                      themeProvider.toggleDarkMode(isOn);
                    },
                  ),
                ),
                const SizedBox(height: 80), // space for footer
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const FooterWidget(),
      floatingActionButton: ScrollToTopButton(
        scrollController: _scrollController,
      ),
    );
  }
}

class AnimatedTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const AnimatedTextWidget({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final defaultStyle =
        style ??
        Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color:
              isDarkMode ? Colors.amberAccent : Theme.of(context).primaryColor,
        );
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TyperAnimatedText(
          text,
          textStyle: defaultStyle,
          speed: const Duration(milliseconds: 100),
        ),
        ScaleAnimatedText(
          text.toUpperCase(),
          textStyle: defaultStyle,
          duration: const Duration(milliseconds: 1500),
        ),
        ColorizeAnimatedText(
          text,
          textStyle: defaultStyle,
          colors: [Colors.blue, Colors.purple, Colors.yellow, Colors.red],
        ),
      ],
      isRepeatingAnimation: true,
      pause: const Duration(milliseconds: 1000),
    );
  }
}
