import 'dart:io' show File;
import 'package:drive_mate/ui/view/login/text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  final backgroundColor = Colors.black;

  const Register({super.key});

  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image = null;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cloud1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 30,
                children: [
                  Icon(
                    Icons.hub_outlined,
                    size: 60,
                    color: Color.fromARGB(120, 255, 214, 214),
                  ),
                  Text(
                    'Drive Mate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image(image: AssetImage('assets/images/front-car.webp')),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 1500,
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '차량등록하기',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.close_rounded),
                                  color: Colors.black,
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                            InputInfo(
                              iconData: Icons.drive_eta_rounded,
                              textField: '차량 이름',
                              hide: false,
                              color: Colors.black,
                            ),
                            InputInfo(
                              iconData: Icons.pin_outlined,
                              textField: '차량 번호',
                              hide: false,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 150,
                              child: Builder(
                                builder: (context) {
                                  if (_image != null) {
                                    return ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                              Colors.white,
                                            ),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        upModal(context);
                                      },
                                      child: Image.file(File(_image!.path)),
                                    );
                                  }

                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.zero,
                                      color: Colors.white,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        upModal(context);
                                      },
                                      icon: Icon(Icons.image),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text('이미지를 선택 해주세요'),
                            Text('갤러리 앱 또는 카메라를 이용하실 수 있습니다'),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 60),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.red,
                              ),
                              child: Text(
                                '차량등록 후 이용하기',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).whenComplete(() {
                  setState(() {
                    _image = null;
                  });
                });
              },
              child: Text(
                '차량등록 후 이용하기',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void upModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(26),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            final XFile? photo = await _picker.pickImage(
                              source: ImageSource.camera,
                            );

                            if (photo != null) {
                              setState(() {
                                _image = photo;
                              });
                            }
                          },
                          icon: Icon(Icons.camera_alt_outlined),
                        ),
                        Text('카메라'),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            final XFile? image = await _picker.pickImage(
                              source: ImageSource.gallery,
                            );

                            if (image != null) {
                              setState(() {
                                _image = image;
                              });
                            }
                          },
                          icon: Icon(Icons.image),
                        ),
                        Text('갤러리'),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
