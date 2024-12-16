// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';
// import 'package:image_picker/image_picker.dart';

// class PickImage extends StatefulWidget {
//   const PickImage({
//     super.key,
//     required this.onValueChanged,
//   });
//   final ValueChanged<File?> onValueChanged;
//   @override
//   State<PickImage> createState() => _PickImageState();
// }

// class _PickImageState extends State<PickImage> {
//   bool isLoading = false;
//   File? chosenImage;

//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//         enabled: isLoading,
//         child: GestureDetector(
//           onTap: () async {
//             if (chosenImage == null) {
//               isLoading = true;
//               setState(() {});
//               try {
//                 final ImagePicker picker = ImagePicker();
//                 final XFile? image =
//                     await picker.pickImage(source: ImageSource.gallery);
//                 chosenImage = File(image!.path);
//                 widget.onValueChanged(chosenImage);
//               } catch (e) {
//                 setState(() {});
//                 isLoading = false;
//               }
//               setState(() {});
//               isLoading = false;
//             } else {}
//           },
//           child: Stack(
//             children: [
//               Container(
//                 decoration:
//                     BoxDecoration(border: Border.all(color: Colors.black)),
//                 width: double.infinity,
//                 height: 300,
//                 child: chosenImage != null
//                     ? Image.file(chosenImage!)
//                     : Center(child: Icon(Icons.image_aspect_ratio_outlined)),
//               ),
//               GestureDetector(
//                   onTap: () {
//                     chosenImage = null;
//                     widget.onValueChanged(chosenImage);
//                     setState(() {});
//                   },
//                   child: Visibility(
//                     visible: chosenImage != null,
//                     child: Icon(
//                       Icons.delete,
//                       size: 30,
//                       color: Colors.red,
//                     ),
//                   ))
//             ],
//           ),
//         ));
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({
    super.key,
    required this.onValueChanged,
  });

  final ValueChanged<File?> onValueChanged;

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  bool isLoading = false;
  File? chosenImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          if (chosenImage == null) {
            setState(() {
              isLoading = true;
            });
            try {
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                chosenImage = File(image.path);
                widget.onValueChanged(chosenImage);
              }
            } catch (e) {
              // Handle the error if necessary
            } finally {
              setState(() {
                isLoading = false;
              });
            }
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              width: double.infinity,
              height: 300,
              child: chosenImage != null
                  ? Image.file(chosenImage!)
                  : const Center(child: Icon(Icons.image_aspect_ratio_outlined)),
            ),
            if (chosenImage != null)
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      chosenImage = null;
                      widget.onValueChanged(chosenImage);
                    });
                  },
                  child: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}




























// GestureDetector pickImage() {
//     return GestureDetector(
//                   onTap: () async {
//                     final ImagePicker picker = ImagePicker();
//                     final XFile? image =
//                         await picker.pickImage(source: ImageSource.gallery);
//                     setState(() {
//                       chosenImage = File(image!.path);
//                       isLoading = false;
//                     });
//                   },
//                   child: Container(
//                     color: Colors.black38,
//                     height: 260,
//                     width: double.infinity,
//                     child: Skeletonizer(
//                       enabled: isLoading,
//                       child: chosenImage != null
//                           ? Image.file(chosenImage!)
//                           : Stack(children: [
//                               Center(
//                                   child: Icon(
//                                 Icons.photo_outlined,
//                                 size: 100,
//                               )),
//                               Icon(Icons.delete)
//                             ]),
//                     ),
//                   ),
//                 );
//   }
// }