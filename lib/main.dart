import 'package:agriser/screens/home.dart';
import 'package:agriser/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';

// import 'package:agriser/screens/time/date_time_picker_widget2.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   final String appTitle = 'Date & Time picker';
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         title: appTitle,
//         home: MainPage(appTitle: appTitle),
//       );
// }

// class MainPage extends StatelessWidget {
//   final String appTitle;

//   const MainPage({this.appTitle});

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text(appTitle),
//         ),
//         body: Center(
//           child: DateTimePickerWidget2(),
//         ),
//       );
// }

//////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// main() => runApp(MaterialApp(home: MapsDemo()));

// class MapsDemo extends StatefulWidget {
//   @override
//   _MapsDemoState createState() => _MapsDemoState();
// }

// class _MapsDemoState extends State<MapsDemo> {
//   static final CameraPosition bangkok = CameraPosition(
//     target: LatLng(13.573642234570674, 100.12219581460153),
//     zoom: 12,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 150,
//         child: GoogleMap(initialCameraPosition: bangkok),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:location/location.dart' as lct;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   LatLng currentLocation = LatLng(-2.131910, -79.940287);
//   GoogleMapController _mapController;
//   lct.Location location;
//   BitmapDescriptor icon;

//  @override
//   void initState(){
//     getIcons();
//     requestPerms();
//     super.initState();
//   }

//   getLocation() async{
//     var currentLocation = await location.getLocation();
//     locationUpdate(currentLocation);
//   }

//   locationUpdate(currentLocation){
//     if(currentLocation!= null){
//       setState(() {
//         this.currentLocation =
//           LatLng(currentLocation.latitude, currentLocation.longitude);
//         this._mapController.animateCamera(CameraUpdate.newCameraPosition(
//           CameraPosition(target: this.currentLocation, zoom: 14),
//         ));
//       _createMarker();
//       });
//     }
//   }

// void _onMapCreated(GoogleMapController controller){
//   _mapController = controller;
// }

// changedLocation(){
//   location.onLocationChanged.listen((lct.LocationData cLoc) {
//     if(cLoc != null) locationUpdate(cLoc);
//    });
// }

// // Pedir permiso de Ubicacion
//   requestPerms() async {
//     Map<Permission, PermissionStatus> statuses =
//         await [Permission.locationAlways].request();

//     var status = statuses[Permission.locationAlways];
//     if (status == PermissionStatus.denied) {
//       requestPerms();
//     } else {
//       gpsAnable();
//     }
//   }

// //Activar GPS
//   gpsAnable() async {
//     location = lct.Location();
//     bool statusResult = await location.requestService();

//     if (!statusResult) {
//       gpsAnable();
//     } else {
//       getLocation();
//       changedLocation();
//     }
//   }

// // icon Marker
//   getIcons() async {
//     var icon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(devicePixelRatio: 3.0),
//         "assets/images/markeruser.png");
//     setState(() {
//       this.icon = icon;
//     });
//   }

// //crear Marker
//   Set<Marker> _createMarker() {
//     var marker = Set<Marker>();

//     marker.add(Marker(
//       markerId: MarkerId("MarkerCurrent"),
//       position: currentLocation,
//       icon: icon,
//       infoWindow: InfoWindow(
//         title: "Mi Ubicacion",
//         snippet: "Lat ${currentLocation.latitude} - Lng ${currentLocation.longitude} ",
//       ),
//       draggable: true,
//       onDragEnd: onDragEnd,
//     ));

//     return marker;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Google Maps"),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: currentLocation,
//               zoom: 14.0,
//             ),
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//             minMaxZoomPreference: MinMaxZoomPreference(12, 18.6),
//             markers: _createMarker(),
//             onMapCreated: _onMapCreated,
//           ),
//         ],
//       ),
//     );
//   }

//   onDragEnd(LatLng position) {
//     print("nueva posicion $position");
//   }
// }
