import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarGlow(
              glowColor: Colors.blueGrey,
              duration: Duration(milliseconds: 2000),
              repeat: true,
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                  radius: 80.0,
                ),
              ),
            ),

            SizedBox(height: 20),
            Text('Jr Marquez'
            ,style: TextStyle(color: Colors.black, fontSize: 20),),
            SizedBox(height: 20),
            ElevatedButton.icon(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AnimatedScreen(),
                ));
              }, icon: Icon(Icons.phone), label: Text('call'))
           
          ],
        ),
      ),
    );
  }
}


class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 50.0, end: 150.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: _animation.value,
              height: _animation.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.5),
                    spreadRadius: _animation.value / 20,
                    blurRadius: _animation.value / 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Center(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        fit: BoxFit.cover,
                        width: _animation.value,
                        height: _animation.value,
                      ),
                    ),
                  ),
                ],
              ),
              
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
