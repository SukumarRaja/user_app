//Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/app/ui/widgets/common_divider.dart';
import 'package:user_app/app/ui/widgets/common_text.dart';

import '../../../controllers/google_map_controller/google_map_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      key: MapController.to.scaffoldKey,
      drawer: Container(
        // height: 250,
        color: Colors.white,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 150,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Image.asset(""),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText(
                            text: "Profile Name",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CommonText(
                            text: "Visit Profile",
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              CommonDivider(),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: CommonText(
                  text: "History",
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: CommonText(
                  text: "Visit Profile",
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: CommonText(
                  text: "About",
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Obx(
            () => GoogleMap(
              padding:
                  EdgeInsets.only(bottom: MapController.to.bottomPaddingOfMap),
              initialCameraPosition: MapController.to.googlePlex,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                MapController.to.mapController.complete(controller);
                MapController.to.newGoogleMapController = controller;
                MapController.to.getCurrentLocation();
                MapController.to.bottomPaddingOfMap = 300.0;
              },
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            child: GestureDetector(
              onTap: () {
                MapController.to.scaffoldKey.currentState!.openDrawer();
              },
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: Offset(0.7, 0.7)),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  radius: 20.0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white70,
                        blurRadius: 16,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7))
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    CommonText(
                      text: "Hi there",
                    ),
                    CommonText(
                      text: "Where to?",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 16,
                                spreadRadius: 0.5,
                                offset: Offset(0.7, 0.7))
                          ]),
                      // color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.purpleAccent,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Search Drop off")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Add Home",
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            CommonText(
                              text: "Your living home address",
                              size: 14,
                              color: Colors.grey,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CommonDivider(
                      width: Get.width,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Add Work",
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            CommonText(
                              text: "Your office address",
                              size: 14,
                              color: Colors.grey,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
