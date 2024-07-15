import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:parking_app/Authontication/login_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()), // login page
    );
  }

  Widget _buildImage(String assetName, [double width = 400]) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Image.asset(assetName, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 15.0, color: Colors.blueGrey);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      //autoScrollDuration: 8000,
      pages: [
        PageViewModel(
          title: "Welcome to\n CAR PARKING APP",
          body:
              "Finding a parking spot has never been easier.\n  CAR PARKING APP helps you locate, book, and pay for parking in just a few taps.",
          image: _buildImage('images/onboarding1.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: " Real-Time Availability",
          body:
              "Discover available parking spots near your destination in real-time. Say goodbye to circling the block and hello to convenience.",
          image: _buildImage('images/onboarding2.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Discover More Features",
          body:
              "Start your journey with CAR PARKING APP now! Explore smart features like parking reminders, favorite spots, and exclusive deals. Tap below to get started and make parking a breeze!",
          image: _buildImage('images/onboarding3.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Let's Go !!",
          bodyWidget: const SizedBox(),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: _buildImage('images/onboarding1.jpg'),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,

      skip: const Text('Skip',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.blueGrey)),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.blueGrey,
      ),
      done: const Text('Done',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.blueGrey)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onBackToIntro(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnBoardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onBackToIntro(context),
              child: const Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}
