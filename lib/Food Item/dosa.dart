import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/Food%20Item/recommended.dart';

class DosaPage extends StatefulWidget {
  const DosaPage({super.key});

  @override
  State<DosaPage> createState() => _DosaPageState();
}

class _DosaPageState extends State<DosaPage> {
  final List<String> price = [
    '₹ 102',
  ];

  final List<String> image = [
    'assets/dosa.jpeg',
  ];

  final List<String> calories = [
    'Calories 160',
  ];

  final List<String> name = [
    'Plain Dosa',
  ];
  bool _isExpanded = true;
  @override
  void initState() {
    _isExpanded = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>ControllerProvider(),
      child: SingleChildScrollView(
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
                      "Dosa",
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
                                  height: 36,
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
                                 Consumer<ControllerProvider>(
                                    builder: (context,provider,_) {
                                      return Container(
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
                                                  ? provider.count < 1
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
                                      );
                                    }
                                  ),                            ],
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
      ),
    );
  }
}
