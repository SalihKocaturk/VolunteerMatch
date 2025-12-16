import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLocationPickerPage extends StatefulWidget {
  const MapLocationPickerPage({super.key});

  @override
  State<MapLocationPickerPage> createState() => _MapLocationPickerPageState();
}

class _MapLocationPickerPageState extends State<MapLocationPickerPage> {
  LatLng? selected;
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konum Seç")),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(41.015137, 28.979530), // İstanbul merkez
          zoom: 12,
        ),
        onMapCreated: (c) => mapController = c,
        onTap: (LatLng pos) {
          setState(() => selected = pos);
        },
        markers: {
          if (selected != null)
            Marker(markerId: const MarkerId("selected"), position: selected!),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: selected == null
            ? null
            : () => Navigator.pop(context, selected),
        label: const Text("Konumu Seç"),
        icon: const Icon(Icons.check),
      ),
    );
  }
}
