// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:geocoding/geocoding.dart';

// // class MapScreen extends StatefulWidget {
// //   @override
// //   _MapScreenState createState() => _MapScreenState();
// // }

// // class _MapScreenState extends State<MapScreen> {
// //   late GoogleMapController mapController;
// //   LatLng _selectedLocation = LatLng(20.5937, 78.9629); // Default: India
// //   String _address = "Select a location";
// //   String _pincode = "";

// //   @override
// //   void initState() {
// //     super.initState();
// //     _determinePosition();
// //   }

// //   // Get current location
// //   Future<void> _determinePosition() async {
// //     LocationPermission permission = await Geolocator.requestPermission();
// //     if (permission == LocationPermission.denied) {
// //       return;
// //     }
// //     Position position = await Geolocator.getCurrentPosition();
// //     setState(() {
// //       _selectedLocation = LatLng(position.latitude, position.longitude);
// //     });
// //     _getAddressFromLatLng(position.latitude, position.longitude);
// //   }

// //   // Get Address from LatLng
// //   Future<void> _getAddressFromLatLng(double lat, double lng) async {
// //     try {
// //       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
// //       Placemark place = placemarks[0];
// //       setState(() {
// //         _address =
// //             "${place.street}, ${place.locality}, ${place.administrativeArea}";
// //         _pincode = place.postalCode ?? "";
// //       });
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   // On map tapped
// //   void _onMapTapped(LatLng tappedPoint)
// //    {
// //     setState(()
// //     {
// //       _selectedLocation = tappedPoint;
// //     });
// //     _getAddressFromLatLng(tappedPoint.latitude, tappedPoint.longitude);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Pick Location")),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: GoogleMap(
// //               initialCameraPosition: CameraPosition(
// //                 target: _selectedLocation,
// //                 zoom: 5,
// //               ),
// //               onMapCreated: (controller) {
// //                 mapController = controller;
// //               },
// //               markers: {
// //                 Marker(
// //                   markerId: MarkerId("selectedLocation"),
// //                   position: _selectedLocation,
// //                 )
// //               },
// //               onTap: _onMapTapped,
// //             ),
// //           ),
// //           Container(
// //             padding: EdgeInsets.all(16),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
// //             ),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text("Selected Address:",
// //                     style: TextStyle(fontWeight: FontWeight.bold)),
// //                 SizedBox(height: 5),
// //                 Text(_address, style: TextStyle(fontSize: 16)),
// //                 SizedBox(height: 10),
// //                 TextField(
// //                   decoration: InputDecoration(labelText: "Enter Pincode"),
// //                   onChanged: (value) {
// //                     setState(()
// //                     {
// //                       _pincode = value;
// //                     });
// //                   },
// //                 ),
// //                 SizedBox(height: 10),
// //                 ElevatedButton(
// //                   onPressed: ()
// //                   {
// //                     Navigator.pop(context,
// //                      {
// //                       "location": _selectedLocation,
// //                       "address": _address,
// //                       "pincode": _pincode
// //                     });
// //                   },
// //                   child: Text("Confirm Location"),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng _selectedLocation = LatLng(20.5937, 78.9629); // Default: India
  String _address = "Fetching current location...";
  String _pincode = "";
  TextEditingController _pincodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  // Get current location
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
      desiredAccuracy: LocationAccuracy.low,
    );
    LatLng currentLatLng = LatLng(position.latitude, position.longitude);

    setState(() {
      _selectedLocation = currentLatLng;
    });

    _getAddressFromLatLng(position.latitude, position.longitude);
  }

  // Get Address from LatLng
  Future<void> _getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placemarks.first;
      setState(() {
        _address =
            "${place.street}, ${place.locality}, ${place.administrativeArea}";
        _pincode = place.postalCode ?? "";
        _pincodeController.text = _pincode;

        print(
            "jhsjhdfjdsgf ${place.street}, ${place.locality}, ${place.administrativeArea}   ${place.postalCode}  ${place.subLocality}  ${place.name}  ${place.subAdministrativeArea}");
      });
    } catch (e) {
      print(e);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick Location")),
      body: Column(
        children: [
          Expanded(
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
                  markerId: MarkerId("selectedLocation"),
                  position: _selectedLocation,
                )
              },
              onTap: _onMapTapped,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Selected Address:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(_address, style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                TextField(
                  controller: _pincodeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter Pincode",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _pincode = value;
                    });
                  },
                  onSubmitted:
                      _updateLocationFromPincode, // Auto-update on enter
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      "location": _selectedLocation,
                      "address": _address,
                      "pincode": _pincode
                    });
                  },
                  child: Text("Confirm Location"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;

// const String googleApiKey = "AIzaSyAi3_Dls63iGs7Nccgdm-4FkS0rhT03-4U";  // Replace with your API key

// class LocationScreen extends StatefulWidget {
//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   String _address = "Fetching location...";
//   String _roadName = "";
//   String _colony = "";
//   String _buildingName = "";

//   @override
//   void initState() {
//     super.initState();
//     _fetchCurrentLocation();
//   }

//   // Fetch Current Location
//   Future<void> _fetchCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.bestForNavigation,  // High Accuracy
//       );
//       _getAddressFromLatLng(position.latitude, position.longitude);
//     } catch (e) {
//       print("Error fetching location: $e");
//       setState(() {
//         _address = "Failed to get location.";
//       });
//     }
//   }

//   // Get Address from Latitude and Longitude
//   Future<void> _getAddressFromLatLng(double lat, double lng) async {
//     final String url =
//         "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleApiKey";

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         if (data["status"] == "OK") {
//           var result = data["results"][0]; // First result is most accurate

//           String formattedAddress = result["formatted_address"];
//           List components = result["address_components"];

//           String roadName = "";
//           String colony = "";
//           String buildingName = "";

//           for (var component in components) {
//             List types = component["types"];
//             if (types.contains("route")) {
//               roadName = component["long_name"]; // Road Name
//             } else if (types.contains("sublocality_level_1") || types.contains("locality")) {
//               colony = component["long_name"]; // Colony Name
//             } else if (types.contains("premise") || types.contains("street_number")) {
//               buildingName = component["long_name"]; // Building Name
//             }
//           }

//           setState(() {
//             _address = formattedAddress;
//             _roadName = roadName;
//             _colony = colony;
//             _buildingName = buildingName;
//           });

//           print("Full Address: $formattedAddress");
//           print("Road Name: $roadName");
//           print("Colony: $colony");
//           print("Building Name: $buildingName");
//         } else {
//           setState(() {
//             _address = "No address found";
//           });
//         }
//       } else {
//         setState(() {
//           _address = "Failed to fetch address";
//         });
//       }
//     } catch (e) {
//       print("Error fetching address: $e");
//       setState(() {
//         _address = "Error fetching address";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Location Details")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Full Address:", style: TextStyle(fontWeight: FontWeight.bold)),
//             Text(_address, style: TextStyle(fontSize: 16)),
//             SizedBox(height: 10),

//             Text("Road Name:", style: TextStyle(fontWeight: FontWeight.bold)),
//             Text(_roadName, style: TextStyle(fontSize: 16)),
//             SizedBox(height: 10),

//             Text("Colony:", style: TextStyle(fontWeight: FontWeight.bold)),
//             Text(_colony, style: TextStyle(fontSize: 16)),
//             SizedBox(height: 10),

//             Text("Building Name:", style: TextStyle(fontWeight: FontWeight.bold)),
//             Text(_buildingName, style: TextStyle(fontSize: 16)),
//             SizedBox(height: 20),

//             ElevatedButton(
//               onPressed: _fetchCurrentLocation,
//               child: Text("Refresh Location"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
