import 'package:digital_domi_assessment/constants/app_colors.dart';
import 'package:digital_domi_assessment/models/document.dart';
import 'package:digital_domi_assessment/models/file_types.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FileItemTile extends StatelessWidget {
  final Document document;

  const FileItemTile({
    super.key,
    required this.document,
  });

  Widget FileExtensionToIcon(FileExtension fileExtension) {
    switch (fileExtension) {
      case FileExtension.DOCS:
        return const Icon(Icons.description, color: Colors.blue, size: 25);
      case FileExtension.PDF:
        return const Icon(Icons.picture_as_pdf, color: AppColors.red, size: 25);
      case FileExtension.XLSX:
        return const Icon(Icons.table_chart, color: Colors.green, size: 25);
      default:
        return const Icon(Icons.insert_drive_file, size: 25);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 40, 39, 39), // Background color of the container
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          FileExtensionToIcon(document.fileExtension),
          const SizedBox(width: 16.0), // Spacing between icon and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  document.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                    height: 4.0), // Spacing between title and subtitle
                Text(
                  "Opened ${DateFormat('MMM dd, yyy').format(document.openedAt)}",
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
