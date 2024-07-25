import 'package:digital_domi_assessment/models/file_types.dart';

class Document {
  final String title;
  final DateTime openedAt;
  final FileExtension fileExtension;
  const Document(this.title,  this.fileExtension, this.openedAt);
}
