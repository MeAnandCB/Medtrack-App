import 'dart:io';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:path/path.dart' as path_package;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseHelper {
  static Database? _database;
  final String tableName = 'images';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final dbPathWithFilename = path_package.join(dbPath, 'images_database.db');
    return await openDatabase(
      dbPathWithFilename,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, image_path TEXT)',
        );
      },
    );
  }

  Future<int> insertImage(String imagePath) async {
    final db = await database;
    return await db.insert(
      tableName,
      {'image_path': imagePath},
    );
  }

  Future<List<String>> getImages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (i) {
      return maps[i]['image_path'] as String;
    });
  }
}

class ImageCamera extends StatefulWidget {
  @override
  _ImageCameraState createState() => _ImageCameraState();
}

class _ImageCameraState extends State<ImageCamera> {
  List<File> _images = [];
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadImagesFromDatabase();
  }

  Future<void> _loadImagesFromDatabase() async {
    final imagePaths = await DatabaseHelper().getImages();
    final images = <File>[];

    for (var imagePath in imagePaths) {
      images.add(File(imagePath));
    }

    setState(() {
      _images = images;
    });
  }

  Future getImages() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      await _saveImageToStorage(imageFile.path);

      setState(() {
        _images.add(imageFile);
      });
    }
  }

  Future<void> _saveImageToStorage(String imagePath) async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final newImagePath =
        path_package.join(appDirectory.path, path_package.basename(imagePath));
    final imageFile = File(imagePath);

    await imageFile.copy(newImagePath);

    await DatabaseHelper().insertImage(newImagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myRoseColor,
        title: Text('Medical Reports '),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _images.isEmpty
                  ? Text('No Files selected.')
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Implement image tap action if needed
                          },
                          child: Image.file(
                            _images[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorCOnstant.myRoseColor,
        onPressed: getImages,
        tooltip: 'Take a Photo',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ImageCamera(),
  ));
}
