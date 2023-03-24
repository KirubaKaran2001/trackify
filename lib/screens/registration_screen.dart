import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int selectedIndex = 0;
  List<String> carouselImages = [
    'assets/delivery.png',
    'assets/location.png',
    'assets/Fast.png',
  ];
  List<String> carouselTexts = [
    'Send a new parcel or track the one which your friend have sent.',
    'Track your parcels from anywhere.',
    'Get notified within seconds.',
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.of(context).size.height.toString());
    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: const Color(0xff16797a),
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: carouselImages.length,
              itemBuilder: ((context, index, realIndex) {
                return CarouselContent(
                  selectedIndex: selectedIndex,
                  carouselImage: carouselImages[selectedIndex],
                  carouselText: carouselTexts[selectedIndex],
                );
              }),
              options: CarouselOptions(
                disableCenter: true,
                height: MediaQuery.of(context).size.height * 0.60,
                enlargeCenterPage: true,
                onPageChanged: (index, _) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
                viewportFraction: 0.8,
              ),
            ),
            if (selectedIndex > 0)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: const Color(0xff16797a),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 177, 229, 232),
                        size: 20,
                      ),
                      onPressed: () {
                        if (selectedIndex >= 1) {
                          setState(() {
                            selectedIndex -= 1;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashBoard');
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Color.fromARGB(255, 177, 229, 232),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: (selectedIndex == 2)
                  ? MediaQuery.of(context).size.width * 0.60
                  : 200,
              left: MediaQuery.of(context).size.width * 0.40,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedSmoothIndicator(
                        count: 3,
                        activeIndex: selectedIndex,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Color(0xff209fa1),
                          dotColor: Color(0xff1a888a),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (selectedIndex == 2)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 60.0,
                  left: 20,
                  right: 20,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/dashBoard');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFcdeded),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Color(0xff16797a),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CarouselContent extends StatefulWidget {
  final int? selectedIndex;
  final String? carouselImage;
  final String? carouselText;

  const CarouselContent({
    required this.selectedIndex,
    required this.carouselImage,
    required this.carouselText,
    Key? key,
  }) : super(key: key);

  @override
  State<CarouselContent> createState() => _CarouselContentState();
}

class _CarouselContentState extends State<CarouselContent> {
  PageController controller = PageController();
  int? selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff16797a),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            widget.carouselImage!,
            width: MediaQuery.of(context).size.width * 0.90,
          ),
          SizedBox(
            width: 310,
            child: Text(
              widget.carouselText!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFfffffff),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
