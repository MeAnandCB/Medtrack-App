import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path_package;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class DatabaseHelper {
  static Database? _database;
  final String tableName = 'files';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final dbPathWithFilename = path_package.join(dbPath, 'files_database.db');
    return await openDatabase(
      dbPathWithFilename,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, file_path TEXT)',
        );
      },
    );
  }

  Future<int> insertFile(String filePath) async {
    final db = await database;
    return await db.insert(
      tableName,
      {'file_path': filePath},
    );
  }

  Future<List<String>> getFiles() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (i) {
      return maps[i]['file_path'] as String;
    });
  }
}

class FileUploader extends StatefulWidget {
  @override
  _FileUploaderState createState() => _FileUploaderState();
}

class _FileUploaderState extends State<FileUploader> {
  List<File> _files = [];

  @override
  void initState() {
    super.initState();
    _loadFilesFromDatabase();
  }

  Future<void> _loadFilesFromDatabase() async {
    final filePaths = await DatabaseHelper().getFiles();
    final files = <File>[];

    for (var filePath in filePaths) {
      files.add(File(filePath));
    }

    setState(() {
      _files = files;
    });
  }

  Future pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      List<File> newFiles = [];

      for (PlatformFile file in result.files) {
        final newFile = File(file.path!);
        await _saveFileToStorage(newFile.path);

        newFiles.add(newFile);
      }

      setState(() {
        _files.addAll(newFiles);
      });
    }
  }

  Future<void> _saveFileToStorage(String filePath) async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final newFilePath =
        path_package.join(appDirectory.path, path_package.basename(filePath));
    final file = File(filePath);

    await file.copy(newFilePath);

    await DatabaseHelper().insertFile(newFilePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload and Storage'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _files.isEmpty
                  ? Text('No Files selected.')
                  : ListView.builder(
                      itemCount: _files.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Share.share(
                                "lib/presentation/profile_screen/image_upload_screen/pdf.dart");
                          },
                          child: ListTile(
                            title:
                                Text(path_package.basename(_files[index].path)),
                            onTap: () {
                              // Implement file tap action if needed
                            },
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickFiles,
        backgroundColor: Colors.green,
        tooltip: 'Upload Files',
        child: Icon(Icons.file_upload),
      ),
    );
  }
}
