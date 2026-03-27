import 'package:flutter/material.dart';
import 'package:winning_streak_app/routes/route_generator.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(
      begin: 0,
      end: -20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _bounceAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _bounceAnimation.value),
                  child: child,
                );
              },
              child: Icon(
                Icons.emoji_events_rounded,
                size: 80,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "-------------Winning Streak Quiz Game    -------------",
              style: GoogleFonts.pressStart2p(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80),
            ElevatedButton.icon(
              icon: Icon(Icons.play_arrow_rounded),
              label: Text('Start a Streak'),
              onPressed: () =>
                  Navigator.pushNamed(context, RouteGenerator.streakPage),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.leaderboard_rounded),
              label: Text('View High Scores'),
              onPressed: () =>
                  Navigator.pushNamed(context, RouteGenerator.highScorePage),
            ),
            SizedBox(height: 16),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () =>
                  Navigator.pushNamed(context, RouteGenerator.settingsPage),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
