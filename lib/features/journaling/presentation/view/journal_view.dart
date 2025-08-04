

// // // import 'package:flutter/material.dart';
// // // import 'package:hive/hive.dart';
// // // import 'package:mindwave/features/journaling/data/model/journal_hive_model.dart';
// // // import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';
// // // import 'package:mindwave/features/journaling/presentation/view/save_journal_view.dart';
// // // import 'package:mindwave/features/journaling/presentation/view_model/journal_event.dart';
// // // import 'package:mindwave/features/journaling/presentation/view_model/journal_view_model.dart';

// // // class JournalViewScreen extends StatefulWidget {
// // //   @override
// // //   _JournalViewScreenState createState() => _JournalViewScreenState();
// // // }

// // // class _JournalViewScreenState extends State<JournalViewScreen> {
// // //   final _titleController = TextEditingController();
// // //   final _placeController = TextEditingController();
// // //   final _contentController = TextEditingController();
// // //   DateTime? _selectedDate;
// // //   String _selectedWeather = '';

// // //   void _submitEntry() async {
// // //     if (_selectedDate != null &&
// // //         _titleController.text.isNotEmpty &&
// // //         _placeController.text.isNotEmpty &&
// // //         _selectedWeather.isNotEmpty) {
      
// // //       final journalEntity = JournalEntity(
// // //         dateTime: _selectedDate!,
// // //         journalTitle: _titleController.text,
// // //         journalmood: '', // optional
// // //         place: _placeController.text,
// // //         weather: _selectedWeather,
// // //         journalImage: '', // optional
// // //         journalContent: '', // optional
// // //       );

// // //       final journalModel = JournalHiveModel.fromEntity(journalEntity);

// // //       final box = Hive.box<JournalHiveModel>('journals');
// // //       await box.add(journalModel);



// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(content: Text('Journal entry saved!')),
// // //       );

// // //       _titleController.clear();
// // //       _placeController.clear();
// // //       setState(() {
// // //         _selectedDate = null;
// // //         _selectedWeather = '';
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Add Journal Entry'),
// // //         actions: [
// // //           PopupMenuButton<String>(
// // //             icon: Icon(Icons.more_vert),
// // //             onSelected: (value) {
// // //               if(value == 'add'){
// // //                 Navigator.push(
// // //                   context,
// // //                   MaterialPageRoute(
// // //                     builder: (context) => JournalViewScreen()),
// // //                 );
// // //                 // Handle Add action
// // //               }else if(value == 'delete'){
// // //                 // Handle Delete action
// // //               } else if (value == 'update'){
// // //                 // Handle Update action
// // //               }
// // //               else if (value == 'save'){
// // //                 // Handle save action
// // //                 // Navigate to SaveViewPage
// // //                 Navigator.push(
// // //                   context,
// // //                   MaterialPageRoute(
// // //                     builder: (context) => SaveViewScreen(
// // //                       journalTitle: _titleController.text,
// // //                       place: _placeController.text, 
// // //                       date: _selectedDate!,
// // //                       journalContent: _contentController.text, 
// // //                       weather: _selectedWeather, 
// // //                       journalMood: ,)),
// // //                 );
// // //               }
// // //             },
// // //             itemBuilder: (BuildContext content) => [
// // //               PopupMenuItem(
// // //                 value: 'add',
// // //                 child: Text('Add'),
// // //               ),
// // //               PopupMenuItem(
// // //                 value: 'delete',
// // //                 child: Text('Delete'),
// // //               ),
// // //               PopupMenuItem(
// // //                 value: 'update',
// // //                 child: Text('Update'),
// // //               ),
// // //               PopupMenuItem(
// // //                 value: 'save',
// // //                 child: Text('Save'),
// // //               ),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
      
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           children: [
// // //             TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Title')),
// // //             TextField(controller: _placeController, decoration: InputDecoration(labelText: 'Place')),
// // //             SizedBox(height: 16),
// // //             TextButton(
// // //               onPressed: () async {
// // //                 final picked = await showDatePicker(
// // //                   context: context,
// // //                   initialDate: DateTime.now(),
// // //                   firstDate: DateTime(2000),
// // //                   lastDate: DateTime(2100),
// // //                 );
// // //                 if (picked != null) {
// // //                   setState(() => _selectedDate = picked);
// // //                 }
// // //               },
// // //               child: Text(_selectedDate == null ? 'Select Date' : _selectedDate.toString()),
// // //             ),
// // //             DropdownButton<String>(
// // //               hint: Text('Select Weather'),
// // //               value: _selectedWeather.isEmpty ? null : _selectedWeather,
// // //               items: ['Sunny', 'Rainy', 'Cloudy', 'Windy']
// // //                   .map((w) => DropdownMenuItem(value: w, child: Text(w)))
// // //                   .toList(),
// // //               onChanged: (val) {
// // //                 setState(() {
// // //                   _selectedWeather = val!;
// // //                 });
// // //               },
// // //             ),

// // //             SizedBox(height: 16,),

// // //             // 📝 TextField for writing content
// // //             TextField(
// // //               controller: _contentController,
// // //               maxLines: 8,
// // //               decoration: InputDecoration(
// // //                 border: OutlineInputBorder(),
// // //                 labelText: 'Write your journal entry here',
// // //                 alignLabelWithHint: true,
// // //               ),
// // //             ),
          
// // //             SizedBox(height: 16),
// // //             ElevatedButton(
// // //               onPressed: _submitEntry,
// // //               child: Text('Save Entry')),

// // //               SizedBox(height: 16),
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     children: [
// // //                       GestureDetector(
// // //                         onTap: () {
// // //                           Navigator.push(
// // //                             context,
// // //                             MaterialPageRoute(builder: (context) => SaveViewScreen(
// // //                               journalTitle: _titleController.text,
// // //                               place: _placeController.text, 
// // //                               date: _selectedDate!,
// // //                               journalContent: _contentController.text, 
// // //                               weather: _selectedWeather,
// // //                               )),
// // //                           );
// // //                         },
// // //                         child: Text(
// // //                           "Your Journal", 
// // //                           style: TextStyle(
// // //                             color: Colors.deepPurple,
// // //                             fontWeight: FontWeight.bold,
// // //                             decoration: TextDecoration.underline,
// // //                           ),
// // //                         ),
// // //                       )
// // //                     ],
// // //                   )
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }


// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:hive/hive.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:mindwave/features/journaling/data/model/journal_hive_model.dart';
// // import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';
// // import 'package:mindwave/features/journaling/presentation/view/save_journal_view.dart';

// // class JournalViewScreen extends StatefulWidget {
// //   @override
// //   _JournalViewScreenState createState() => _JournalViewScreenState();
// // }

// // class _JournalViewScreenState extends State<JournalViewScreen> {
// //   final _titleController = TextEditingController();
// //   final _placeController = TextEditingController();
// //   final _contentController = TextEditingController();
// //   DateTime? _selectedDate;
// //   String _selectedWeather = '';
// //   String _selectedMood = '';
// //   File? _selectedImage;

// //   final ImagePicker _picker = ImagePicker();

// //   Future<void> _pickImage() async {
// //     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
// //     if (pickedFile != null) {
// //       setState(() => _selectedImage = File(pickedFile.path));
// //     }
// //   }

// //   void _submitEntry() async {
// //     if (_selectedDate != null &&
// //         _titleController.text.isNotEmpty &&
// //         _placeController.text.isNotEmpty &&
// //         _selectedWeather.isNotEmpty) {
      
// //       final journalEntity = JournalEntity(
// //         dateTime: _selectedDate!,
// //         journalTitle: _titleController.text,
// //         journalmood: _selectedMood,
// //         place: _placeController.text,
// //         weather: _selectedWeather,
// //         journalImage: _selectedImage?.path ?? '',
// //         journalContent: _contentController.text,
// //       );

// //       final journalModel = JournalHiveModel.fromEntity(journalEntity);

// //       final box = Hive.box<JournalHiveModel>('journals');
// //       await box.add(journalModel);

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Journal entry saved!')),
// //       );

// //       _titleController.clear();
// //       _placeController.clear();
// //       _contentController.clear();
// //       setState(() {
// //         _selectedDate = null;
// //         _selectedWeather = '';
// //         _selectedMood = '';
// //         _selectedImage = null;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Add Journal Entry'),
// //         actions: [
// //           PopupMenuButton<String>(
// //             icon: Icon(Icons.more_vert),
// //             onSelected: (value) {
// //               if (value == 'save') {
// //                 if (_selectedDate != null) {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => SaveViewScreen(
// //                         journalId: DateTime.now().toIso8601String(), // or generate UUID
// //                         journalTitle: _titleController.text,
// //                         place: _placeController.text,
// //                         date: _selectedDate!,
// //                         journalContent: _contentController.text,
// //                         weather: _selectedWeather,
// //                         journalMood: _selectedMood,
// //                         journalImage: _selectedImage?.path ?? '',
// //                       ),
// //                     ),
// //                   );
// //                 }
// //               }
// //             },
// //             itemBuilder: (BuildContext context) => [
// //               PopupMenuItem(value: 'add', child: Text('Add')),
// //               PopupMenuItem(value: 'delete', child: Text('Delete')),
// //               PopupMenuItem(value: 'update', child: Text('Update')),
// //               PopupMenuItem(value: 'save', child: Text('Save')),
// //             ],
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: ListView(
// //           children: [
// //             TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Title')),
// //             TextField(controller: _placeController, decoration: InputDecoration(labelText: 'Place')),
// //             SizedBox(height: 16),

// //             TextButton(
// //               onPressed: () async {
// //                 final picked = await showDatePicker(
// //                   context: context,
// //                   initialDate: DateTime.now(),
// //                   firstDate: DateTime(2000),
// //                   lastDate: DateTime(2100),
// //                 );
// //                 if (picked != null) {
// //                   setState(() => _selectedDate = picked);
// //                 }
// //               },
// //               child: Text(_selectedDate == null ? 'Select Date' : _selectedDate.toString()),
// //             ),

// //             DropdownButton<String>(
// //               hint: Text('Select Weather'),
// //               value: _selectedWeather.isEmpty ? null : _selectedWeather,
// //               items: ['Sunny', 'Rainy', 'Cloudy', 'Windy']
// //                   .map((w) => DropdownMenuItem(value: w, child: Text(w)))
// //                   .toList(),
// //               onChanged: (val) => setState(() => _selectedWeather = val!),
// //             ),

// //             DropdownButton<String>(
// //               hint: Text('Select Mood'),
// //               value: _selectedMood.isEmpty ? null : _selectedMood,
// //               items: ['Happy', 'Sad', 'Angry', 'Relaxed', 'Excited']
// //                   .map((m) => DropdownMenuItem(value: m, child: Text(m)))
// //                   .toList(),
// //               onChanged: (val) => setState(() => _selectedMood = val!),
// //             ),

// //             SizedBox(height: 12),
// //             TextButton.icon(
// //               onPressed: _pickImage,
// //               icon: Icon(Icons.image),
// //               label: Text('Pick Image'),
// //             ),
// //             if (_selectedImage != null)
// //               Image.file(_selectedImage!, height: 150),

// //             SizedBox(height: 12),
// //             TextField(
// //               controller: _contentController,
// //               maxLines: 8,
// //               decoration: InputDecoration(
// //                 border: OutlineInputBorder(),
// //                 labelText: 'Write your journal entry here',
// //                 alignLabelWithHint: true,
// //               ),
// //             ),

// //             SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: _submitEntry,
// //               child: Text('Save Entry'),
// //             ),

// //             SizedBox(height: 16),
// //             Center(
// //               child: GestureDetector(
// //                 onTap: () {
// //                   if (_selectedDate != null) {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => SaveViewScreen(
// //                           journalId: DateTime.now().toIso8601String(),
// //                           journalTitle: _titleController.text,
// //                           place: _placeController.text,
// //                           date: _selectedDate!,
// //                           journalContent: _contentController.text,
// //                           weather: _selectedWeather,
// //                           journalMood: _selectedMood,
// //                           journalImage: _selectedImage?.path ?? '',
// //                         ),
// //                       ),
// //                     );
// //                   }
// //                 },
// //                 child: Text(
// //                   "Your Journal",
// //                   style: TextStyle(
// //                     color: Colors.deepPurple,
// //                     fontWeight: FontWeight.bold,
// //                     decoration: TextDecoration.underline,
// //                   ),
// //                 ),
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindwave/features/journaling/data/model/journal_hive_model.dart';
import 'package:mindwave/features/journaling/presentation/view/save_journal_view.dart';

class JournalViewScreen extends StatefulWidget {
  
  final JournalHiveModel? journalToEdit;

  const JournalViewScreen({Key? key, this.journalToEdit}) : super(key: key);

  @override
  _JournalViewScreenState createState() => _JournalViewScreenState();
}

class _JournalViewScreenState extends State<JournalViewScreen> {
  final _titleController = TextEditingController();
  final _placeController = TextEditingController();
  final _contentController = TextEditingController();

  DateTime? _selectedDate;
  String _selectedWeather = '';
  String _selectedMood = '';
  File? _pickedImage;  // Only one variable here
  String? _editingJournalId;

  @override
  void initState() {
    super.initState();
    if (widget.journalToEdit != null) {
      final journal = widget.journalToEdit!;
      _titleController.text = journal.journalTitle ?? '';
      _placeController.text = journal.place ?? '';
      _contentController.text = journal.journalContent ?? '';
      _selectedDate = journal.dateTime;
      _selectedWeather = journal.weather ?? '';
      _selectedMood = journal.journalmood ?? '';

      if (journal.journalImage != null && journal.journalImage!.isNotEmpty) {
        _pickedImage = File(journal.journalImage!);
      } else {
        _pickedImage = null;
      }

      _editingJournalId = journal.journalId;
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitEntry() async {
    if (_selectedDate != null &&
        _titleController.text.isNotEmpty &&
        _placeController.text.isNotEmpty &&
        _selectedWeather.isNotEmpty &&
        _selectedMood.isNotEmpty) {
      final box = Hive.box<JournalHiveModel>('journals');

      final newJournal = JournalHiveModel(
        journalId: _editingJournalId ?? DateTime.now().millisecondsSinceEpoch.toString(),
        journalTitle: _titleController.text,
        place: _placeController.text,
        journalContent: _contentController.text,
        weather: _selectedWeather,
        dateTime: _selectedDate!,
        journalmood: _selectedMood,
        journalImage: _pickedImage?.path ?? '',
      );

      if (_editingJournalId != null) {
        final keyToUpdate = box.keys.firstWhere(
          (key) => box.get(key)!.journalId == _editingJournalId,
          orElse: () => null,
        );
        if (keyToUpdate != null) {
          await box.put(keyToUpdate, newJournal);
        }
      } else {
        await box.add(newJournal);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Journal saved!')),
      );

      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all required fields')),
      );
    }
  }

  

  @override
  void dispose() {
    _titleController.dispose();
    _placeController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editingJournalId == null ? 'Add Journal Entry' : 'Edit Journal Entry'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Title
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title *',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Place
            TextField(
              controller: _placeController,
              decoration: InputDecoration(
                labelText: 'Place *',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Date picker
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'Select Date *'
                        : 'Date: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() => _selectedDate = picked);
                    }
                  },
                  child: Text('Pick Date'),
                )
              ],
            ),
            SizedBox(height: 16),

            // Weather dropdown
            DropdownButtonFormField<String>(
              value: _selectedWeather.isEmpty ? null : _selectedWeather,
              decoration: InputDecoration(
                labelText: 'Weather *',
                border: OutlineInputBorder(),
              ),
              items: ['Sunny', 'Rainy', 'Cloudy', 'Windy']
                  .map((weather) => DropdownMenuItem(
                        value: weather,
                        child: Text(weather),
                      ))
                  .toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() => _selectedWeather = val);
                }
              },
              validator: (value) =>
                  value == null || value.isEmpty ? 'Please select weather' : null,
            ),
            SizedBox(height: 16),

            // Mood dropdown
            DropdownButtonFormField<String>(
              value: _selectedMood.isEmpty ? null : _selectedMood,
              decoration: InputDecoration(
                labelText: 'Mood *',
                border: OutlineInputBorder(),
              ),
              items: ['Happy', 'Sad', 'Excited', 'Anxious']
                  .map((mood) => DropdownMenuItem(
                        value: mood,
                        child: Text(mood),
                      ))
                  .toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() => _selectedMood = val);
                }
              },
              validator: (value) =>
                  value == null || value.isEmpty ? 'Please select mood' : null,
            ),
            SizedBox(height: 16),

            // Image picker & preview
            if (_pickedImage != null)
              Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    _pickedImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            TextButton.icon(
              onPressed: _pickImage,
              icon: Icon(Icons.photo_library),
              label: Text('Pick Image'),
            ),
            SizedBox(height: 16),

            // Content input
            TextField(
              controller: _contentController,
              maxLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Write your journal entry here',
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 24),

            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitEntry,
                child: Text(_editingJournalId == null ? 'Save Entry' : 'Update Entry'),
              ),
            ),
            SizedBox(height: 16),

            Center(
              child: GestureDetector(
                onTap: () {
                  if (_selectedDate != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SaveViewScreen(
                          journalId: DateTime.now().toIso8601String(),
                          journalTitle: _titleController.text,
                          place: _placeController.text,
                          date: _selectedDate!,
                          journalContent: _contentController.text,
                          weather: _selectedWeather,
                          journalMood: _selectedMood,
                          journalImage: _pickedImage?.path ?? '',
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  "Your Journal",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
