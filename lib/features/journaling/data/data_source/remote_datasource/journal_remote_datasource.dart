import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mindwave/app/constant/api_endpoints.dart';
import 'package:mindwave/features/journaling/data/model/journal_api_model.dart';
import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';
import 'package:mindwave/features/journaling/data/data_source/journal_data_source.dart';

class JournalRemoteDataSource implements IJournalDataSource {
  final http.Client client;

  JournalRemoteDataSource({required this.client});

  @override
  Future<List<JournalEntity>> getAllJournals(String token) async {
    final response = await client.get(
      Uri.parse('${ApiEndpoints.baseUrl}journal'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => JournalApiModel.fromJson(json).toEntity()).toList();
    } else {
      throw Exception('Failed to load journals: ${response.body}');
    }
  }

  @override
  Future<JournalEntity> createJournal(JournalEntity journal, String token) async {
    final model = JournalApiModel.fromEntity(journal);

    final response = await client.post(
      Uri.parse('${ApiEndpoints.baseUrl}journal'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(model.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return JournalApiModel.fromJson(json.decode(response.body)).toEntity();
    } else {
      throw Exception('Failed to create journal: ${response.body}');
    }
  }

  @override
  Future<void> deleteJournal(String journalId, String token) async {
    final response = await client.delete(
      Uri.parse('${ApiEndpoints.baseUrl}journal/$journalId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete journal: ${response.body}');
    }
  }

  @override
  Future<JournalEntity> updateJournal(JournalEntity journal, String token) async {
    final model = JournalApiModel.fromEntity(journal);

    final response = await client.put(
      Uri.parse('${ApiEndpoints.baseUrl}journal/${journal.journalId}'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(model.toJson()),
    );

    if (response.statusCode == 200) {
      return JournalApiModel.fromJson(json.decode(response.body)).toEntity();
    } else {
      throw Exception('Failed to update journal: ${response.body}');
    }
  }

  Future<void> addJournal(JournalEntity journal) async {}

  Future getJournals() async {}
}
