import 'package:flutter/material.dart';

class ConstFilepickerAndMediaPicker extends StatelessWidget {
  final VoidCallback pickDocuments;
  final VoidCallback pickCamera;
  final VoidCallback pickGallery;
  const ConstFilepickerAndMediaPicker(
      {super.key,
        required this.pickDocuments,
        required this.pickCamera,
        required this.pickGallery});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstFileMediaPicker(
                  icon: Icons.description,
                  label: 'Document',
                  color: Colors.blue,
                  onTap: pickDocuments
              ),
              ConstFileMediaPicker(
                icon: Icons.photo_camera,
                label: 'Camera',
                color: Colors.blue,
                onTap: pickCamera,
              ),
              ConstFileMediaPicker(
                icon: Icons.photo,
                label: 'Gallery',
                color: Colors.blue,
                onTap: pickGallery,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ConstFileMediaPicker extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const ConstFileMediaPicker(
      {super.key,
        required this.icon,
        required this.label,
        required this.color,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(icon, size: 25, color: color),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}