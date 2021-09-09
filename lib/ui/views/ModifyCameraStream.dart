import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muticam_dashboard/core/models/CameraStream.dart';
import 'package:muticam_dashboard/core/viewmodels/CameraStreamsViewModel.dart';
import 'package:provider/provider.dart';

class ModifyCameraStream extends StatefulWidget {
  final CameraStream cameraStream;

  ModifyCameraStream({required this.cameraStream});

  @override
  ModifyCameraState createState() => ModifyCameraState();
}

class ModifyCameraState extends State<ModifyCameraStream> {
  final _formKey = GlobalKey<FormState>();

  String? title;
  String? streamURL;
  String? camera;

  @override
  Widget build(BuildContext context) {
    var cameraStreamStoreProvider =
        Provider.of<CameraStreamsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Modify Camera Stream Details'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: widget.cameraStream.cameraStreamTitle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Product Title',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Camera Stream Title';
                    }
                  },
                  onSaved: (value) => title = value),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  initialValue: widget.cameraStream.cameraStreamUrl,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Camera Stream',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter The Stream URL';
                    }
                  },
                  onSaved: (value) => streamURL = value),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await cameraStreamStoreProvider.updateCameraStreamByID(
                        CameraStream(
                            cameraStreamTitle: title,
                            cameraStreamUrl: streamURL),
                        widget.cameraStream.id);
                    Navigator.pop(context);
                  }
                },
                child: Text('Modify Camera Stream',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
