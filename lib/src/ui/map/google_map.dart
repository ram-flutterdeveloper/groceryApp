import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';

import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const String googleApiKey = "AIzaSyAi3_Dls63iGs7Nccgdm-4FkS0rhT03-4U";

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng _selectedLocation = LatLng(20.5937, 78.9629);

  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _PhoneNumberController = TextEditingController();
  TextEditingController _addressTypeController = TextEditingController();
  TextEditingController _HouseNoController = TextEditingController();
  TextEditingController _RoadController = TextEditingController();
  TextEditingController _AlterNativeNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    LatLng currentLatLng = LatLng(position.latitude, position.longitude);

    setState(() {
      _selectedLocation = currentLatLng;
    });

    _getAddressFromLatLng(position.latitude, position.longitude);
  }

  Future<void> _getAddressFromLatLng(double lat, double lng) async {
    final String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleApiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data["status"] == "OK") {
          var result = data["results"][0]; // First result is most accurate

          _RoadController.text = result["formatted_address"];
          List components = result["address_components"];

          String roadName = "";
          String colony = "";
          String buildingName = "";
          String pincode = "";

          for (var component in components) {
            List types = component["types"];
            if (types.contains("route")) {
              roadName = component["long_name"]; // Road Name
            } else if (types.contains("sublocality_level_1") ||
                types.contains("locality")) {
              colony = component["long_name"]; // Colony Name
            } else if (types.contains("premise") ||
                types.contains("street_number")) {
              buildingName = component["long_name"]; // Building Name
            } else if (types.contains("postal_code")) {
              pincode = component["long_name"]; // Extract Pin Code
            }
          }

          // setState(() {
          //   //  _address = formattedAddress;
          //   _roadName = roadName;
          //   _colony = colony;
          //   _buildingName = buildingName;
          // });

          _pincodeController.text = pincode;
          _RoadController.text = result["formatted_address"];

          print(
              "Full Address: ${result["formatted_address"]}    ${response.body}  sdfsgd  ${pincode}");
          print("Road Name: $roadName");
          print("Colony: $colony");
          print("Building Name: $buildingName");
        } else {}
      } else {}
    } catch (e) {
      print("Error fetching address: $e");
    }
  }

  // On map tapped
  void _onMapTapped(LatLng tappedPoint) {
    setState(() {
      _selectedLocation = tappedPoint;
    });
    _getAddressFromLatLng(tappedPoint.latitude, tappedPoint.longitude);
  }

  // Update location based on entered pincode
  Future<void> _updateLocationFromPincode(String enteredPincode) async {
    if (enteredPincode.isEmpty) return;

    try {
      List<Location> locations = await locationFromAddress(enteredPincode);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        LatLng newLatLng = LatLng(location.latitude, location.longitude);

        setState(() {
          _selectedLocation = newLatLng;
        });

        _getAddressFromLatLng(location.latitude, location.longitude);
        mapController.animateCamera(CameraUpdate.newLatLng(newLatLng));
      }
    } catch (e) {
      print("Error fetching location from pincode: $e");
    }
  }

//   {
//   "name": "Socket Mall",
//   "pincode": "400001",
//   "phoneNumber": "+919876543210",
//   "alternatePhoneNumber": "+919876543211",
//   "addressLine": "123, Main Street, Apartment 4B",
//   "landmark": "Near Central Park",
//   "addressType": "HOME",
//   "isDefault": false,
//   "additionalInstructions": "Please ring doorbell twice"
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Delivery address")),
      body: Column(
        children: [
          Container(
            height: 200.h,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _selectedLocation,
                zoom: 14,
              ),
              onMapCreated: (controller) {
                mapController = controller;
              },
              markers: {
                Marker(
                  markerId: MarkerId("selected Location"),
                  position: _selectedLocation,
                )
              },
              onTap: _onMapTapped,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text("Selected Address:",
                  //     style: TextStyle(fontWeight: FontWeight.bold)),

                  // SizedBox(height: 5),
                  // Text(_address, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  TextField(
                    controller: _fullNameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Full Name (Required)*",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                    onSubmitted:
                        _updateLocationFromPincode, // Auto-update on enter
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _PhoneNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Phone Number (Required)*",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                    onSubmitted:
                        _updateLocationFromPincode, // Auto-update on enter
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _pincodeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Enter Pincode",
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {},
                          onSubmitted:
                              _updateLocationFromPincode, // Auto-update on enter
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _addressTypeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Address Type",
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {},
                          onSubmitted:
                              _updateLocationFromPincode, // Auto-update on enter
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _HouseNoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "House No, Building Name (Required)*",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                    onSubmitted:
                        _updateLocationFromPincode, // Auto-update on enter
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _RoadController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Road Name, Area , Colony(Required)*",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                    onSubmitted:
                        _updateLocationFromPincode, // Auto-update on enter
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      // print("fjnghkjfjghj");
                      // Provider.of<ProductProvider>(context, listen: false)
                      //     .customerLogOut(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      height: 50,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          color: APPCOLOR.lightGreen,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Save Address",
                            style: context.customMedium(Colors.white, 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pop(context, {
                  //       "location": _selectedLocation,
                  //       "address": _address,
                  //       "pincode": _pincode
                  //     });
                  //   },
                  //   child: Text("Confirm Location"),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
