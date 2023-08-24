import 'package:flutter/material.dart';
import 'package:muticam_dashboard/core/models/CameraStream.dart';
import 'package:muticam_dashboard/core/viewmodels/CameraStreamsViewModel.dart';
import 'package:provider/provider.dart';

class AddCameraStreamCard extends StatefulWidget {
  @override
  AddCameraStreamCardState createState() => AddCameraStreamCardState();
}

class AddCameraStreamCardState extends State<AddCameraStreamCard> {
  final _formKey = GlobalKey<FormState>();

  String? title;
  String? streamURL;

  @override
  Widget build(BuildContext context) {
    var cameraStreamStoreProvider =
        Provider.of<CameraStreamsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Add Camera Stream'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Camera Stream Title',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Camera Stream Title';
                    }
                    return null;
                  },
                  onSaved: (value) => title = value),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Stream URL',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a camera stream URL';
                    }
                    return null;
                  },
                  onSaved: (value) => streamURL = value),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, disabledForegroundColor: Colors
                      .red.withOpacity(0.38), disabledBackgroundColor: Colors
                      .red.withOpacity(0.12), // This can be used as a replacement for splashColor
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await cameraStreamStoreProvider.addCameraStream(
                        CameraStream(
                            cameraStreamUrl: streamURL,
                            cameraStreamTitle: title));
                    Navigator.pop(context);
                  }
                },
                child: Text('add camera stream url',
                    style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
