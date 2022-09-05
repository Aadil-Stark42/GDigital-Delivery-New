import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gdigitaldelivery/res/ResColor.dart';
import '../../../res/ResString.dart';
import '../../components/imageslider/carousel_slider.dart';

class OrderFoodScreen extends StatefulWidget {
  @override
  OrderFoodScreenState createState() => OrderFoodScreenState();
}

class OrderFoodScreenState extends State<OrderFoodScreen> {
  late List<Widget> imageupperBanner = [];
  late List<String> productQuantity = ["600grm", "500grm", "250grm"];
  String seeMore = "See more";
  int seeMoreArrow = 0;
  late List<String> categories = [
    "cat_1.png",
    "cat_2.png",
    "cat_3.png",
    "cat_4.png",
    "cat_5.png",
    "cat_6.png",
    "cat_7.png",
    "cat_8.png",
    "cat_1.png",
    "cat_2.png",
    "cat_3.png",
    "cat_4.png",
    "cat_5.png",
    "cat_6.png",
    "cat_7.png",
    "cat_8.png"
  ];
  late List<String> categoriesName = [
    "Ice Cream",
    "Juice",
    "Burger",
    "Healthy",
    "Shake",
    "Cake",
    "Pizza",
    "Tea & Coffe",
    "Ice Cream",
    "Juice",
    "Burger",
    "Healthy",
    "Shake",
    "Cake",
    "Pizza",
    "Tea & Coffe",
  ];
  int upperBannerCurrentIndex = 0;
  String currentproductQuantity = "600grm";
  int shopByCategoriesLength = 8;

  @override
  void initState() {
    addUpperBannerData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: homeView(),
      ),
    );
  }

  Widget homeView() {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: size.height - 85,
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: false,
                  backgroundColor: whiteColor,
                  floating: true,
                  snap: false,
                  flexibleSpace: const FlexibleSpaceBar(),
                  elevation: 0.0,
                  automaticallyImplyLeading: false,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "${imagePath}ic_back.png",
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                orderFood,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: ralewayBold,
                                    color: blackColor),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "${imagePath}img_coupon.png",
                                width: 37,
                                height: 37,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Image.asset(
                                "${imagePath}img_heart.png",
                                width: 37,
                                height: 37,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Image.asset(
                                "${imagePath}img_account.png",
                                width: 37,
                                height: 37,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 500),
                      childAnimationBuilder: (widget) => FadeInAnimation(
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: [
                        searchView(),
                        topBannerView(),
                        topCategoriesView(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (seeMoreArrow == 0) {
                                shopByCategoriesLength = 16;
                                seeMore = "See less";
                                seeMoreArrow = 180;
                              } else {
                                shopByCategoriesLength = 8;
                                seeMore = "See more";
                                seeMoreArrow = 0;
                              }
                            });
                          },
                          child: Container(
                            height: 45,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: greyColor3, width: 1),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  seeMore,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: blackColor,
                                      fontFamily: ralewaySemiBold),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                RotationTransition(
                                  turns: AlwaysStoppedAnimation(
                                      seeMoreArrow / 360),
                                  child: Image.asset(
                                    "${imagePath}ic_down_arrow.png",
                                    width: 13,
                                    height: 13,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        topRestaurantView(),
                        trendingThisWeek(),
                        restaurantAroundYouView()
                      ],
                    ),
                  )
                ]))
              ],
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              margin: const EdgeInsets.only(left: 15),
              child: Stack(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                      radius: 50,
                      foregroundImage:
                          AssetImage("${imagePath}banana_temp.png"),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("${imagePath}pizza_temp.png")),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: blackColor, width: 2)),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "2 item",
                  style: TextStyle(
                      fontSize: 15,
                      color: whiteColor,
                      fontFamily: poppinsRegular),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 1.5,
                  height: 14,
                  color: whiteColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "₹200",
                  style: TextStyle(
                      fontSize: 15, color: whiteColor, fontFamily: poppinsBold),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  "${imagePath}ic_double_arrow.png",
                  width: 24,
                  height: 19,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget searchView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          height: 52,
          margin: const EdgeInsets.only(left: 15, right: 15, top: 18),
          decoration: BoxDecoration(
              color: greyColor5,
              border: Border.all(
                color: greyColor3,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(13)),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                "${imagePath}ic_search.png",
                width: 18,
                height: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                searchFood,
                style: TextStyle(
                    fontSize: 13,
                    color: greyColor,
                    fontFamily: segoeUiSemibold),
              )
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 1.3,
          color: greyColor3,
          margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
        )
      ],
    );
  }

  void addUpperBannerData() {
    imageupperBanner.add(imageSlideView());
    imageupperBanner.add(imageSlideView());
    imageupperBanner.add(imageSlideView());
    imageupperBanner.add(imageSlideView());
  }

  Widget imageSlideView() {
    return Container(
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: FadeInImage(
            fit: BoxFit.cover,
            image: AssetImage("${imagePath}upper_banner.png"),
            placeholder: AssetImage("${imagePath}upper_banner.png"),
          ),
        ));
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 5,
      width: isActive ? 18 : 12,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isActive ? mainColor : greyColor3,
              isActive ? mainColor2 : greyColor3,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    print("upperBannerCurrentIndex +$upperBannerCurrentIndex");
    List<Widget> indicators = [];
    for (int i = 0; i < imageupperBanner.length; i++) {
      if (upperBannerCurrentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  topCategoriesView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Text(
            shopByCategories,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
                fontSize: 17, fontFamily: ralewayBold, color: blackColor),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        AnimationLimiter(
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            crossAxisCount: 4,
            mainAxisSpacing: 15,
            crossAxisSpacing: 0,
            children: List.generate(
              shopByCategoriesLength,
              (int index) {
                return AnimationConfiguration.staggeredGrid(
                  columnCount: 4,
                  position: index,
                  duration: Duration(milliseconds: animationTime),
                  child: ScaleAnimation(
                    scale: 0.5,
                    child: FadeInAnimation(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              imagePath + categories[index],
                              width: double.maxFinite,
                              height: 78,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 3, left: 5, right: 5),
                                child: Text(
                                  categoriesName[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: ralewayBold,
                                    fontSize: 13,
                                    color: greyColor,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  topBannerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 18,
        ),
        CarouselSlider(
          items: imageupperBanner,
          options: CarouselOptions(
              height: 155,
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  print("indexindexindex  $index");
                  upperBannerCurrentIndex = index;
                });
              }),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildIndicator(),
        ),
      ],
    );
  }

  topRestaurantView() {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "${imagePath}img_badge.png",
                width: 25,
                height: 25,
              ),
              const SizedBox(
                width: 9,
              ),
              Text(
                topRatedRestaurant,
                style: TextStyle(
                    fontSize: 17, color: blackColor, fontFamily: ralewayBold),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 156,
          child: AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 14),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: Duration(milliseconds: animationTime),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: FadeInAnimation(
                          child: Container(
                        width: 110,
                        margin: const EdgeInsets.only(right: 15),
                        height: 156,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    "${imagePath}img_temp.png",
                                    width: double.maxFinite,
                                    height: 110,
                                  ),
                                ),
                                persontagView(index, 0)
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Island Grill",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: ralewayBold,
                                        color: blackColor),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "40 mins",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: poppinsRegular,
                                        color: greyColor),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 156,
          child: AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 14),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: Duration(milliseconds: animationTime),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: FadeInAnimation(
                          child: Container(
                        width: 110,
                        margin: const EdgeInsets.only(right: 15),
                        height: 156,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    "${imagePath}img_temp.png",
                                    width: double.maxFinite,
                                    height: 110,
                                  ),
                                ),
                                persontagView(index, 2)
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Island Grill",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: ralewayBold,
                                        color: blackColor),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "40 mins",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: poppinsRegular,
                                        color: greyColor),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  persontagView(int index, int viewIndex) {
    if (index == viewIndex) {
      return Positioned(
          bottom: 8,
          right: 0,
          left: 0,
          child: Container(
            width: 77,
            height: 28,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(imagePath + "offers_pers_bg.png"),
            )),
            child: Center(
              child: Text(
                "upto 60% off",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 10, fontFamily: poppinsBold, color: whiteColor),
              ),
            ),
          ));
    } else {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  trendingThisWeek() {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "${imagePath}img_badge.png",
                width: 25,
                height: 25,
              ),
              const SizedBox(
                width: 9,
              ),
              Text(
                topRatedRestaurant,
                style: TextStyle(
                    fontSize: 17, color: blackColor, fontFamily: ralewayBold),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 250,
          child: AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 14),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: Duration(milliseconds: animationTime),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: FadeInAnimation(
                          child: Container(
                        width: size.width / 2.2,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: greyColor3, width: 1),
                            borderRadius: BorderRadius.circular(18)),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(16),
                                        topLeft: Radius.circular(16)),
                                    child: Image.asset(
                                      "${imagePath}pizza_temp2.png",
                                      width: double.maxFinite,
                                      fit: BoxFit.fitWidth,
                                      height: 150,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 7,
                                    right: 7,
                                    top: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mexicano Pizza",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: ralewayBold,
                                            color: blackColor),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "El Pirata Porch",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: greyColor,
                                            fontFamily: poppinsRegular,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "₹250",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: poppinsSemiBold,
                                            fontWeight: FontWeight.bold,
                                            color: blackColor),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Positioned(
                                right: -3,
                                bottom: -3,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "${imagePath}ic_add.png",
                                    fit: BoxFit.cover,
                                  ),
                                  iconSize: 35,
                                )),
                            Positioned(
                                right: 10,
                                bottom: 108,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 3, bottom: 3),
                                  decoration: BoxDecoration(
                                      color: greenColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          "4.1",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: poppinsMedium,
                                              color: whiteColor),
                                        ),
                                        Image.asset(
                                          "${imagePath}ic_star.png",
                                          width: 15,
                                          height: 15,
                                          fit: BoxFit.cover,
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  restaurantAroundYouView() {
    Size size = MediaQuery.of(context).size;
    late List<Widget> restaurantImages = [];
    int restaurantCurrentIndex = 0;
    restaurantImages.add(restaurantImageSlider());
    restaurantImages.add(restaurantImageSlider());
    restaurantImages.add(restaurantImageSlider());
    restaurantImages.add(restaurantImageSlider());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "${imagePath}img_rest_around_you.png",
                width: 25,
                height: 25,
              ),
              const SizedBox(
                width: 9,
              ),
              Text(
                restaurantAroundYou,
                style: TextStyle(
                    fontSize: 17, color: blackColor, fontFamily: ralewayBold),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        AnimationLimiter(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: Duration(milliseconds: animationTime),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: FadeInAnimation(
                        child: Container(
                      width: size.width,
                      margin:
                          const EdgeInsets.only(right: 15, top: 20, left: 15),
                      height: 340,
                      decoration: BoxDecoration(
                          border: Border.all(color: greyColor3, width: 1),
                          borderRadius: BorderRadius.circular(22)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: double.maxFinite,
                            child: Stack(
                              children: [
                                CarouselSlider(
                                  items: restaurantImages,
                                  options: CarouselOptions(
                                      height: 200,
                                      autoPlay: false,
                                      enlargeCenterPage: false,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 1,
                                      onPageChanged: (bindex, reason) {
                                        setState(() {
                                          restaurantCurrentIndex = bindex;
                                        });
                                      }),
                                ),
                                Positioned(
                                    right: 12,
                                    bottom: 12,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, top: 3, bottom: 3),
                                      decoration: BoxDecoration(
                                          color: greenColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Text(
                                              "4.1",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: poppinsMedium,
                                                  color: whiteColor),
                                            ),
                                            Image.asset(
                                              "${imagePath}ic_star.png",
                                              width: 15,
                                              height: 15,
                                              fit: BoxFit.cover,
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                                Positioned(
                                    bottom: 10,
                                    right: 0,
                                    left: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: _buildIndicator2(index),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 13,
                              right: 13,
                              top: 18,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bangalore Spices",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: ralewayBold,
                                      color: blackColor),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "Japanese • Curry • Asia • Ramen",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: poppinsRegular,
                                      color: greyColor),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "${imagePath}ic_clock.png",
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "30 mins • 2km",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: poppinsRegular,
                                          color: greyColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "${imagePath}ic_rupees.png",
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "₹200 for one person",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: poppinsRegular,
                                          color: greyColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  List<Widget> _buildIndicator2(int index) {
    print("upperBannerCurrentIndex +$index");
    List<Widget> indicators = [];
    for (int i = 0; i < 4; i++) {
      if (2 == i) {
        indicators.add(_indicator2(true));
      } else {
        indicators.add(_indicator2(false));
      }
    }

    return indicators;
  }

  Widget _indicator2(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: isActive ? whiteColor : greyColor4,
          borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget restaurantImageSlider() {
    return SizedBox(
        width: double.maxFinite,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: FadeInImage(
            fit: BoxFit.cover,
            image: AssetImage("${imagePath}pizza_temp2.png"),
            placeholder: AssetImage("${imagePath}pizza_temp2.png"),
          ),
        ));
  }
}
