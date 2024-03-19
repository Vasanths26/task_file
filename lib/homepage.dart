import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'Food Item/biriyani.dart';
import 'Food Item/dosa.dart';
import 'Food Item/recommended.dart';
import 'Food Item/soups.dart';
import 'Food Item/tanduri.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> catogary = [
    'Recommended',
    'Biryani',
    'Soups',
    'Tanduri',
    'Dosa'
  ];

  final List<double> width = [120, 90, 70, 90, 70];
  int selectedIndex = 0;
  bool isNonVeg = true;
  bool isBestSeller = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isNonVeg = true;
    isBestSeller = true;
  }

  void select(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ControllerProvider(),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              leading: const Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.black,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const Text(
                          'Chettinad Restaurant',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Chinese-North Indian-South Indian',
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 16,
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green[800],
                              ),
                              child: const Center(
                                child: Text(
                                  '4.5',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '489 User rating',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isNonVeg = !isNonVeg;
                          });
                        },
                        splashColor: Colors.white,
                        child: Container(
                          height: 40,
                          width: 90,
                          margin: const EdgeInsets.only(
                            left: 10,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isNonVeg == true
                                  ? Colors.grey.shade400
                                  : Colors.white),
                          child: Center(
                            child: Text(
                              'Non-Veg',
                              style: TextStyle(
                                  color: isNonVeg == true
                                      ? Colors.greenAccent[700]
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isBestSeller = !isBestSeller;
                          });
                        },
                        splashColor: Colors.white,
                        child: Container(
                          height: 40,
                          width: 90,
                          margin: const EdgeInsets.only(
                            left: 10,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isBestSeller == true
                                  ? Colors.grey.shade400
                                  : Colors.white),
                          child: Center(
                            child: Text(
                              'BestSeller',
                              style: TextStyle(
                                  color: isBestSeller == true
                                      ? Colors.greenAccent[700]
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      children: const [
                        RecommendedPage(),
                        BriyaniPage(),
                        SoupsPage(),
                        TanduriPage(),
                        DosaPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(color: Colors.white),
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        select(index);
                      },
                      child: Container(
                        height: 30,
                        width: width[index],
                        margin: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectedIndex == index
                                ? Colors.deepPurple[700]
                                : Colors.grey),
                        child: Center(
                          child: Text(
                            catogary[index],
                            style: TextStyle(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.green[700]),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Positioned(
            bottom: 60,
            child:
                Consumer<ControllerProvider>(builder: (context, provider, _) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Colors.deepPurple[700],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          provider.count.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Proxima Nova Alt',
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.center,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Text(
                      'Add Items worth ₹ 1250 more to get flat ₹ 200 off',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Proxima Nova Alt',
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
