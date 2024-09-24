import 'package:location/location.dart';

class LocationServices {
  double? latitude;
  double? longitude;

  Location location = Location();

  Future<void> requestPermission() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return; 
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      LocationData _locationData = await location.getLocation(); 
      latitude = _locationData.latitude; 
      longitude = _locationData.longitude; 
    } catch (e) {
      print("Error al obtener la ubicación: $e");
    }
  
  }
}