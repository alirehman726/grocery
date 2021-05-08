import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';  
import 'package:location/location.dart'; 

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  //
  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;

  List<Marker> myMarker = [];
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;
  // String _currentAddress1;
  String coordinates;

  var mapType;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    // _getCurrentLocation1();

    //marked_address
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    _streamSubscription = Geolocator()
        .getPositionStream(locationOptions)
        .listen((Position position) {
      setState(() {
        print(position);
        _position = position;

        final coordinates =
            new Coordinates(position.latitude, position.longitude);
        convertCoordinatesToAddress(coordinates)
            .then((value) => _address = value);
      });
    });
    //
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name},${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      _currentPosition.latitude, _currentPosition.longitude),
                  zoom: 5.0),
              //Markers
              markers: Set.from(myMarker),
              myLocationEnabled: true,
              // mapType: MapType.hybrid,

              onTap: _handleTap,
            ),
          ),
          Positioned(
            top: 60.0,
            right: 15.0,
            left: 15.0,
            child: InkWell(
              onTap: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DashboardScreen(),
                //   ),
                // );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 4,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Location',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            if (_currentPosition != null &&
                                _currentAddress != null)
                              Text("${_address?.addressLine ?? '-'}",
                                  //_currentAddress,
                                  style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _handleTap(LatLng _currentAddress) {
    print(_currentAddress);
    setState(() {
      myMarker = [];
      myMarker.add(
        Marker(
            markerId: MarkerId(_currentAddress.toString()),
            position: _currentAddress,
            infoWindow: InfoWindow(
              // title: _currentAddress1,
              // title: _getAddress(),
              title: "${_address?.addressLine ?? '-'}",
              // title:
              //     '${_currentAddress?.latitude ?? '-'} ${_currentAddress?.longitude ?? '-'}',
            ),
            draggable: true,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            onDragEnd: (dragEndPosition) {
              print(dragEndPosition);
            }),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  Future<Address> convertCoordinatesToAddress(Coordinates coordinates) async {
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first;
  }
}

// class Location extends StatefulWidget {
//   @override
//   _LocationState createState() => _LocationState();
// }

// class _LocationState extends State<Location> {
//   GoogleMapController mapController;
//   String searchAddr;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: <Widget>[
//             GoogleMap(
//               initialCameraPosition:
//                   CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 10.0),
//               onMapCreated: onMapCreated,
//             ),
//             Positioned(
//               top: 40.0,
//               right: 15.0,
//               left: 15.0,
//               child: Container(
//                 height: 50.0,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: Colors.white),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Enter Address',
//                     hintStyle: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         fontSize: ScreenUtil().setSp(15)),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.only(left: 15.0, top: 10.0),
//                     suffixIcon: IconButton(
//                         icon: Icon(Icons.search),
//                         onPressed: searchandNavigate,
//                         iconSize: 30.0),
//                   ),
//                   onChanged: (val) {
//                     setState(() {
//                       searchAddr = val;
//                     });
//                   },
//                 ),
//               ),
//             )
//           ],
//         ));
//   }

//   searchandNavigate() {
//     Geolocator().placemarkFromAddress(searchAddr).then((result) {
//       mapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//               target: LatLng(
//                   result[0].position.latitude, result[0].position.longitude),
//               zoom: 10.0),
//         ),
//       );
//     });
//   }

//   void onMapCreated(controller) {
//     setState(() {
//       mapController = controller;
//     });
//   }
// }
