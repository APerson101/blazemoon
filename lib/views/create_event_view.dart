import 'package:blaze/views/send_funds_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventView extends ConsumerWidget {
  CreateEventView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new Event"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter event name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter event Location',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter number of tickets',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter mint price',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter event theme',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      ref.watch(_selectedImage.notifier).state =
                          await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                    },
                    child: const Text("Select event art")),
                ref.watch(_selectedImage) != null
                    ? SizedBox(
                        width: 125,
                        height: 125,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image(
                              image: NetworkImage(
                                  ref.watch(_selectedImage)!.path)),
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter other information',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                StyledButton(
                    onPressed: () async {
                      await Future.delayed(const Duration(seconds: 4), () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("creation successful")));
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text("Create Event"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final _selectedImage = StateProvider<XFile?>((ref) => null);
