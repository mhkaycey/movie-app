import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:movies/screens/movie_detail.dart';
import 'package:movies/widget/app_large_text.dart';
import 'package:movies/widget/app_text.dart';
import 'package:movies/widget/movies.dart';

import '../widget/search.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Hi, User!",
                      color: Colors.white,
                      size: 20,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/movie3.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              searchWidget(),
              const Gap(10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 350,
                        width: double.infinity,
                        child: Swiper(
                          scrollDirection: Axis.horizontal,
                          autoplay: true,
                          itemCount: 7,
                          layout: SwiperLayout.DEFAULT,
                          itemWidth: 400,
                          itemHeight: 350,
                          viewportFraction: 0.6,
                          scale: 0.7,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(3),
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/movie3.jpg"),
                                    fit: BoxFit.cover),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 100,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(0, 196, 115, 193)
                                              .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: "Trending TV Series",
                            size: 18,
                            color: Colors.white,
                          ),
                          const Icon(
                            Icons.arrow_circle_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const Gap(10),
                      MoviesWidget(
                        imageString: 'assets/images/movie3.jpg',
                        click: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const MovieDetail();
                            },
                          ));
                        },
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: "Trending Movies",
                            size: 18,
                            color: Colors.white,
                          ),
                          const Icon(
                            Icons.arrow_circle_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const Gap(10),
                      MoviesWidget(
                        imageString: 'assets/images/movie4.jpg',
                        click: () {},
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: "All Movies and Series",
                            size: 18,
                            color: Colors.white,
                          ),
                          const Icon(
                            Icons.arrow_circle_right,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchFileWidget(searchController: searchController),
          // const Filter(),
        ],
      ),
    );
  }
}
