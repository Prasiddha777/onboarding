import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:onboardingscreen/slide.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  List<Slide> _slides = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    _currentPage = 0;
    _slides = [
      Slide("I'm going to make him \n an offer he can't refuse !",
          'assets/01.jpg'),
      Slide("I think this is the \n beginning of a beautiful friendship",
          'assets/02.jpg'),
      Slide("I'll get you, my pretty,\n and your little dog, too!",
          'assets/03.jpg'),
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  // ignore: unused_element
  Widget _buildPageIndicator() {
    Row row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    );
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        row.children.add(SizedBox(
          width: 12,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 10 : 8,
      height: index == _currentPage ? 10 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPage ? Colors.red[900] : Colors.grey,
      ),
    );
  }

  Widget _GradientRaisedButton() {
    // return const TextButton(onPressed: null, child: Text('data'));
    return GradientButton(
      callback: () {},
      gradient: const LinearGradient(colors: [
        Color.fromRGBO(153, 0, 0, 2),
        Color.fromRGBO(105, 105, 105, 1),
      ]),
      // elevation: 0.0,
      // increaseHeightBy: 10,
      // increaseWidthBy: 25,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Text("Next"),
    );
  }

  Widget _buildSlide(Slide slide) {
    return Stack(
      children: [
        // Container(
        //   color: Colors.blue,
        // )
        Image.asset(
          slide.image,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 57.0),
            child: Text(
              slide.heading,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handlingOnPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Colors.red[900],
            ),
            PageView(
              controller: _pageController,
              onPageChanged: _handlingOnPageChanged,
              physics: const BouncingScrollPhysics(),
              children: _buildSlides(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: _buildPageIndicator(),
              ),
            ),
          ],
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.visibility),
        ));
  }
}
