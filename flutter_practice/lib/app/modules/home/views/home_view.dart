import 'package:flutter_practice/app/models/vehicles.dart';
import 'package:flutter_practice/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_practice/app/routes/app_pages.dart';
import 'package:flutter_practice/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getCategories();
          await controller.getVehicles();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 15,
                  right: 15,
                  bottom: 20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<ProfileController>(
                      init: ProfileController(),
                      builder: (controller) => Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // This centers the children of the Row
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Welcome!\n',
                                  style: TextStyle(
                                    fontSize: 27,
                                    color: Colors.white,
                                    fontFamily: 'monospace',
                                  ),
                                ),
                                TextSpan(
                                  text: controller
                                          .profileResponse?.user?.fullName ??
                                      'Name',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              'https://ui-avatars.com/api/?name=${controller.profileResponse?.user?.fullName ?? 'User'}&background=0D8ABC&color=fff',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        showSearch(context: context, delegate: SearchView());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(0.8),
                        child: const TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Search",
                            labelStyle: TextStyle(
                              color: Colors.teal,
                            ),
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search, color: Colors.teal),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GetBuilder<HomeController>(
                builder: (controller) {
                  if (controller.vehiclesResponse == null ||
                      controller.categoryResponse == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        child: Text(
                          'Top Categories',

                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              controller.categoryResponse?.categories?.length ??
                                  0,
                          itemBuilder: (context, index) {
                            var category =
                                controller.categoryResponse!.categories?[index];

                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  Routes.SINGLE_CATEGORY,
                                  arguments: category,
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 15),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    category?.category ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(
                          'Recommended for you',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              controller.vehiclesResponse?.vehicles.length ?? 0,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) {
                            var vehicle =
                                controller.vehiclesResponse?.vehicles[index];
                            return VehicleCard(vehicle: vehicle!);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_VEHICLE);
        },
        child: const Icon(
         
          Icons.add,
         
        ),
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleCard({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_VEHICLE, arguments: vehicle);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Hero(
                tag: vehicle.vehicleId,
                child: Image(
                  image: NetworkImage(getImageUrl(vehicle.imageUrl)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          vehicle.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            vehicle.category,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Rs.${vehicle.perDayPrice}/day",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var controller = Get.find<HomeController>();
    var vehicles = controller.vehiclesResponse?.vehicles ?? [];
    var suggestions = [];
    suggestions = query.trim().isEmpty
        ? []
        : vehicles.where((element) {
            return (element.name)
                    .toLowerCase()
                    .contains(query.toLowerCase().trim()) ||
                (element.category)
                    .toLowerCase()
                    .contains(query.toLowerCase().trim()) ||
                (element.perDayPrice)
                    .toLowerCase()
                    .contains(query.toLowerCase().trim());
          }).toList();

    if (suggestions.isEmpty && query.trim().isNotEmpty) {
      return const Center(
        child: Text('No results found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      );
    }

    if (suggestions.isEmpty && query.trim().isEmpty) {
      return const Center(
        child: Text('Search for vehicles',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          height: 200,
          child: SearchCard(vehicle: suggestions[index]),
        );
      },
    );
  }
}

class SearchCard extends StatelessWidget {
  final Vehicle vehicle;
  const SearchCard({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_VEHICLE, arguments: vehicle);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Image(
                // width: double.infinity,
                image: NetworkImage(
                  getImageUrl(vehicle.imageUrl),
                ),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.name,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 7,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        vehicle.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      "Rs.${vehicle.perDayPrice}/day",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
