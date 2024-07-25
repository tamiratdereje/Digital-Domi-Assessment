import 'package:digital_domi_assessment/models/document.dart';
import 'package:digital_domi_assessment/models/file_types.dart';

class DocumentRepository {
  final List<Document> data = [
  Document("Expense Report - Q1 2024", FileExtension.PDF, DateTime.now()),
  Document("Project Plan - 2024", FileExtension.XLSX, DateTime.now()),
  Document("Resume - John Doe", FileExtension.DOCS, DateTime.now()),
  Document("Meeting Minutes - Jan 15 2024", FileExtension.PDF, DateTime.now()),
  Document("Invoice - ACME Corp", FileExtension.PDF, DateTime.now()),
  Document("Research Paper - AI Innovations", FileExtension.DOCS, DateTime.now()),
  Document("Expense Report - Q2 2024", FileExtension.PDF, DateTime.now()),
  Document("Family Vacation - July 2023", FileExtension.PDF, DateTime.now()),
  Document("Quarterly Earnings - Q3 2024", FileExtension.XLSX, DateTime.now()),
  Document("Cover Letter - Jane Smith", FileExtension.PDF, DateTime.now()),
];
  DocumentRepository();

  Future<List<Document>> getDocumets() async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(data);
  }
}
