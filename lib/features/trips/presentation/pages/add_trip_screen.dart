import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entitites/trip.dart';
import '../providers/trip_provider.dart';

class AddTripScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: "City 1");
  final _descController =
      TextEditingController(text: "Best city ever to live and enjoy");
  final _locationController = TextEditingController(text: "Manali");
  final _pictureController = TextEditingController(
      text:
          'https://images.unsplash.com/photo-1605649487212-47bdab064df7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFuYWxpfGVufDB8fDB8fHww');
  List<String> pictures = [];

  AddTripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextFormField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextFormField(
              controller: _pictureController,
              decoration: const InputDecoration(labelText: 'Photo'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                pictures.add(_pictureController.text);
                if (_formKey.currentState!.validate()) {
                  final newTrip = Trip(
                    title: _titleController.text,
                    description: _descController.text,
                    date: DateTime.now(),
                    location: _locationController.text,
                    photos: pictures,
                  );
                  ref
                      .read(tripListNotifierProvider.notifier)
                      .addNewTrip(newTrip);
                  ref.read(tripListNotifierProvider.notifier).loadTrips();
                  //Navigator.pop(context);
                }
              },
              child: const Text('Add Trip'),
            ),
          ),
        ],
      ),
    );
  }
}
