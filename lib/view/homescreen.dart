import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.amber,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                "Bhagvat Gita API ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: FutureBuilder(
              future: homeController.apigita(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "${snapshot.error}",
                    ),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(
                              '/second',
                              arguments: index,
                            );
                          },
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,

                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${homeController.dataList[index].id}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${homeController.dataList[index].slug}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,fontStyle: FontStyle.italic,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: homeController.dataList.length,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              },
            ),
            ),
        );
    }
}
