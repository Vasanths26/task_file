import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControllerProvider extends ChangeNotifier {
  int _count = 0;
  int _selectedIndex = 0;

  int get count => _count;
  int get selectedIndex => _selectedIndex;

  void select(index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void add() {
    _count = _count + 1;
    notifyListeners();
  }

  void remove() {
    _count = _count - 1;
    notifyListeners();
  }
}

class RecommendedPage extends StatefulWidget {
  const RecommendedPage({super.key});

  @override
  State<RecommendedPage> createState() => _RecommendedPageState();
}

class _RecommendedPageState extends State<RecommendedPage> {
  bool _isExpanded = true;
  final List<String> price = ['₹ 150', '₹ 170', '₹ 130', '₹ 102'];

  final List<String> image = [
    'assets/chicken-biryani.png',
    'assets/mutton-soup.jpeg',
    'assets/chicken-soup.jpeg',
    'assets/dosa.jpeg',
  ];

  final List<String> calories = [
    'Calories 360',
    'Calories 420',
    'Calories',
    'Calories 160'
  ];

  final List<String> name = [
    'Chicken Biryani',
    'Mutton Soup',
    'Chicken Soup',
    'Plain Dosa'
  ];

  @override
  void initState() {
    _isExpanded = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ControllerProvider(),
      child: Consumer<ControllerProvider>(builder: (context, provider, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Row(
                    children: [
                      const Text(
                        "Recommended",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'ProximaNovaA',
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: RotationTransition(
                          turns: _isExpanded
                              ? const AlwaysStoppedAnimation(0)
                              : const AlwaysStoppedAnimation(0.5),
                          child: const Icon(
                            Icons.expand_less,
                            color: Color(0xff313840),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: Container(),
                  secondChild: SingleChildScrollView(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey,
                        );
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: image.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(left: 10),
                          height: 85,
                          decoration: const BoxDecoration(
                            color: Color(0xffFFFFFF),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  image[index],
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 148,
                                    height: 26,
                                    child: Text(
                                      name[index],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text(
                                    calories[index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    price[index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.green,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '0.0',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (provider.selectedIndex == index) {
                                        if (provider.count > 0) {
                                          provider.remove();
                                        } else {
                                          provider.add();
                                        }
                                      } else {
                                        provider.add();
                                        provider.select(index);
                                      }
                                    },
                                    child: Container(
                                      width: 66,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.purple,
                                            Colors.deepPurple.shade700
                                          ],
                                        ),
                                      ),
                                      child: provider.selectedIndex == index
                                          ? provider._count < 1
                                              ? const Center(
                                                  child: Text(
                                                    "ADD",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                              : Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        provider.remove();
                                                      },
                                                      child: const Icon(
                                                        Icons
                                                            .remove_circle_outline,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      provider.count.toString(),
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        provider.add();
                                                      },
                                                      child: const Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                          : const Center(
                                              child: Text(
                                                "ADD",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
