import 'package:flutter/material.dart';
import 'package:mvpproject/screens/notification_screen.dart';
import 'package:mvpproject/screens/authorize_screen.dart';
import 'package:mvpproject/screens/dashboard_screen.dart';
import 'package:mvpproject/screens/login_screen.dart';
import 'package:mvpproject/screens/signup_screen.dart';
import 'package:mvpproject/screens/home_screen.dart';
import 'package:mvpproject/screens/club_details_screen.dart';
import 'package:mvpproject/screens/profile_screen.dart';
import 'package:mvpproject/screens/subs_screen.dart';
import 'package:mvpproject/widgets/custom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

//#f6fbff
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SubManage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF14A39A)),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          case '/signup':
            return MaterialPageRoute(builder: (_) => const SignupScreen());
          case '/home':
            return MaterialPageRoute(builder: (_) => const Shell());
          case '/club':
            return MaterialPageRoute(builder: (_) => ClubDetailScreen(club: settings.arguments as Map<String, dynamic>));
          default:
            return MaterialPageRoute(builder: (_) => const Shell(initialIndex: 0));
        }
      },
      routes: {
        '/dashboard': (_) => const DashboardScreen(),
        '/home': (_) => const Shell(initialIndex: 0),
        '/subs': (_) => const Shell(initialIndex: 1),
        '/profile': (_) => const Shell(initialIndex: 2),
        '/alerts': (_) => const Shell(initialIndex: 3),
        '/authorize': (_) => const AuthorizeScreen(),
        '/signup': (_) => const SignupScreen(),
      },
    );
  }
}

class Shell extends StatefulWidget {
  const Shell({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  late int _index;

  final List<Widget> _tabs = const <Widget>[
    HomeScreen(),
    SubsScreen(),
    ProfileScreen(),
    NotificationScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  void _onNavigationTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF6FBFF),
        ),
        child: _tabs[_index],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _index,
        onTap: _onNavigationTap,
      ),
    );
  }
}
