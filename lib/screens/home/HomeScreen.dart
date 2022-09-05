import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gdigitaldelivery/res/ResColor.dart';
import 'package:gdigitaldelivery/screens/home/OrderFoodScreen.dart';
import '../../../res/ResString.dart';
import '../../components/imageslider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late List<Widget> imageupperBanner = [];
  late List<String> productQuantity = ["600grm", "500grm", "250grm"];
  int upperBannerCurrentIndex = 0;
  String currentproductQuantity = "600grm";

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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                deliveringTo,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: greyColor,
                                    fontFamily: poppinsRegular,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Akshya Nagar",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: ralewayBold,
                                        color: blackColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 6),
                                    child: Image.asset(
                                      "${imagePath}ic_down.png",
                                      width: 9,
                                      height: 5,
                                    ),
                                  )
                                ],
                              )
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
                        const SizedBox(
                          height: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            whatYouWant,
                            style: TextStyle(
                                fontSize: 20,
                                color: blackColor,
                                fontFamily: ralewayBold),
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrderFoodScreen()),
                                      );
                                    },
                                    child: Image.asset(
                                      "${imagePath}img_orderFood.png",
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Image.asset(
                                    "${imagePath}img_orderGrocery.png",
                                    height: 100,
                                    fit: BoxFit.fill,
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Image.asset(
                                    "${imagePath}img_orderMedicine.png",
                                    height: 100,
                                    fit: BoxFit.fill,
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Image.asset(
                                    "${imagePath}img_onDemand.png",
                                    height: 100,
                                    fit: BoxFit.fill,
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                        const SizedBox(
                          height: 38,
                        ),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "${imagePath}img_trending_background.png"))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          celebrateNoCooking,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: blackColor,
                                              fontFamily: ralewayBold),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          trendingRestaurantNearYou,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: roseColor,
                                              fontFamily: poppinsRegular),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 72,
                                      height: 38,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: whiteColor),
                                      child: Center(
                                        child: TextButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ))),
                                          onPressed: () {},
                                          child: Text(
                                            viewAll,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blackColor,
                                                fontFamily: poppinsRegular),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              tredingResaurantListView(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Image.asset(
                              "${imagePath}middle_banner.png",
                              width: double.maxFinite,
                              height: 115,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "${imagePath}freshDeal_Background.png"))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          freshDeals,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: blackColor,
                                              fontFamily: ralewayBold),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          topDealsinGrocery,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: greenColor2,
                                              fontFamily: poppinsRegular),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 72,
                                      height: 38,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: whiteColor),
                                      child: Center(
                                        child: TextButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ))),
                                          onPressed: () {},
                                          child: Text(
                                            viewAll,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blackColor,
                                                fontFamily: poppinsRegular),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              freshDealsListView(),
                              const SizedBox(
                                height: 20,
                              ),
                              freshDealsListView(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Image.asset(
                              "${imagePath}middle_banner.png",
                              width: double.maxFinite,
                              height: 115,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "${imagePath}moonson_background.png"))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          mansooncare,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: blackColor,
                                              fontFamily: ralewayBold),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          topDealsinmedicine,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: blueColor,
                                              fontFamily: poppinsRegular),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 72,
                                      height: 38,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: whiteColor),
                                      child: Center(
                                        child: TextButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ))),
                                          onPressed: () {},
                                          child: Text(
                                            viewAll,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: blackColor,
                                                fontFamily: poppinsRegular),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              medicineListView(),
                              const SizedBox(
                                height: 20,
                              ),
                              medicineListView(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Center(
                            child: Image.asset(
                              "${imagePath}bottomBanner.png",
                              width: double.maxFinite,
                              height: 320,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
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

  Widget tredingResaurantListView() {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 340,
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
                    width: size.width / 1.2,
                    margin: const EdgeInsets.only(right: 15),
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
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(22),
                                    topLeft: Radius.circular(22)),
                                child: Image.asset(
                                  "${imagePath}pizza_temp.png",
                                  width: double.maxFinite,
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              ),
                              Positioned(
                                  right: 12,
                                  bottom: 12,
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
    );
  }

  freshDealsListView() {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 230,
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
                    height: 340,
                    decoration: BoxDecoration(
                        border: Border.all(color: greyColor3, width: 1),
                        borderRadius: BorderRadius.circular(16)),
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
                                  "${imagePath}banana_temp.png",
                                  width: double.maxFinite,
                                  fit: BoxFit.fitWidth,
                                  height: 135,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Banana",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: ralewayBold,
                                        color: blackColor),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          // Initial Value
                                          isDense: true,
                                          value: currentproductQuantity,
                                          // Array list of items
                                          icon: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 3),
                                            child: Image.asset(
                                              "${imagePath}ic_down_arrow.png",
                                              width: 13,
                                              height: 13,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          items: productQuantity
                                              .map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                items.toString(),
                                                style: TextStyle(
                                                    color: greyColor,
                                                    height: 1.0,
                                                    fontFamily: poppinsRegular,
                                                    fontSize: 11),
                                              ),
                                            );
                                          }).toList(),
                                          // After selecting the desired option,it will
                                          // change button value to selected value
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              currentproductQuantity =
                                                  newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "₹250",
                                    style: TextStyle(
                                        fontSize: 16,
                                        height: 1.2,
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
    );
  }

  medicineListView() {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 230,
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
                    height: 340,
                    decoration: BoxDecoration(
                        border: Border.all(color: greyColor3, width: 1),
                        borderRadius: BorderRadius.circular(16)),
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
                                  "${imagePath}temp_product2.png",
                                  width: double.maxFinite,
                                  fit: BoxFit.fitWidth,
                                  height: 135,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Banana",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: ralewayBold,
                                        color: blackColor),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          // Initial Value
                                          isDense: true,
                                          value: currentproductQuantity,
                                          // Array list of items
                                          icon: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 3),
                                            child: Image.asset(
                                              "${imagePath}ic_down_arrow.png",
                                              width: 13,
                                              height: 13,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          items: productQuantity
                                              .map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                items.toString(),
                                                style: TextStyle(
                                                    color: greyColor,
                                                    height: 1.0,
                                                    fontFamily: poppinsRegular,
                                                    fontSize: 11),
                                              ),
                                            );
                                          }).toList(),
                                          // After selecting the desired option,it will
                                          // change button value to selected value
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              currentproductQuantity =
                                                  newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "₹250",
                                    style: TextStyle(
                                        fontSize: 16,
                                        height: 1.2,
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
    );
  }
}
