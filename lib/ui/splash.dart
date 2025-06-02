import 'package:drive_mate/ui/view/login/login_view.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final backgroundColor = Colors.black;

  const Splash({super.key});

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  bool isFaded = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isFaded = true;
      });
    });

    return Material(
      child: ColoredBox(
        color: widget.backgroundColor,
        child: Center(
          child: AnimatedOpacity(
            onEnd: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            curve: Curves.decelerate,
            duration: const Duration(milliseconds: 2000),
            opacity: isFaded ? 1 : 0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: [
                  Icon(
                    Icons.hub_outlined,
                    size: 100,
                    color: Color.fromARGB(120, 255, 184, 184),
                  ),
                  Text(
                    'Drive Mate',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '연결하고, 운전하고, 즐기세요',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 70),
                  Image(image: AssetImage('assets/images/car.png')),
                ]
              )
            )
          )
        )
      )
    );
  }
}
