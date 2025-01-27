// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:grocery_app/utils/constants/assets_constant.dart';
// import 'package:grocery_app/utils/constants/color_constant.dart';
// import 'package:grocery_app/utils/extensions/uicontext.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final cSearch = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: Center(
//           child: SizedBox(
//             height: 20,
//             width: 20,
//             child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: SvgPicture.asset(
//                   APPASSETS.back,
//                   height: 20,
//                   width: 20,
//                 )
//                 ),
//           ),
//         ),
//         title: const Text(
//           "Confirm Delivery Location",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             color: Colors.grey.withOpacity(0.4),
//             child: const Center(
//               child: Text("Map"),
//             ),
//           ),
//           Positioned(
//             top: 15,
//             left: 15,
//             right: 15,
//             child: Container(
//               height: 50,
//               width: MediaQuery.sizeOf(context).width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: TextFormField(
//                 controller: cSearch,
//                 onChanged: (c) {
//                   setState(() {});
//                 },
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   fillColor: Colors.transparent,
//                   prefixIcon: Icon(MdiIcons.magnify),
//                   hintText: 'Search',
//                   hintStyle: context.customRegular(APPCOLOR.grey666666, 18),
//                   isCollapsed: true,
//                   contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 80),
//         child: FloatingActionButton(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           child: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: APPCOLOR.lightGreen,
//             ),
//             child: Center(
//               child: Icon(
//                 MdiIcons.crosshairsGps,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           onPressed: () {},
//         ),
//       ),
//       bottomSheet: Container(
//         height: 205,
//         decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
//         width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 2,
//                     width: 50,
//                     color: Colors.grey.withOpacity(0.5),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Text(
//                 "Select Location",
//                 style: context.customExtraBold(Colors.black, 18),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text("4517 wasington  Ave, wasington, Manchester, Kettucy, 369525"),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                       child: InkWell(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) {
//                           return const MapScreen();
//                         },
//                       ));
//                     },
//                     child: Container(
//                       height: 50,
//                       decoration: BoxDecoration(color: APPCOLOR.lightGreen, borderRadius: BorderRadius.circular(10)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const Icon(
//                             Icons.add,
//                             color: Colors.white,
//                           ),
//                           Text(
//                             "Add New Address",
//                             style: context.customMedium(Colors.white, 16),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
