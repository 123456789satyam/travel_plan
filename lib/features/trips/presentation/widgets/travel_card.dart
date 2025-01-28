import 'package:flutter/material.dart';

class TravelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  final String location;
  final VoidCallback onDelete;

  const TravelCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.onDelete,
  });

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext alertContext) {
          return AlertDialog(
            title: const Text("Description"),
            backgroundColor: Theme.of(context).cardColor,
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(description),
                ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320, // Adjust the height to ensure it fits the content
      width: 300,
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  showAlertDialog(context);
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // This column handles the location and date text
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            location,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            date,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // This column handles the title and delete button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red[700]),
                          onPressed: onDelete,
                        ),
                      ],
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
