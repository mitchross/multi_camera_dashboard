class CameraStream {
  String? id;
  String? cameraStreamUrl;
  String? cameraStreamTitle;

  CameraStream({this.id, this.cameraStreamUrl, this.cameraStreamTitle});

  CameraStream.fromMap(Map snapshot, String id)
      : id = id ?? '',
        cameraStreamUrl = snapshot['cameraStreamUrl'] ?? '',
        cameraStreamTitle = snapshot['cameraStreamTitle'];

  toJson() {
    return {
      "cameraStreamUrl": cameraStreamUrl,
      "cameraStreamTitle": cameraStreamTitle,
    };
  }
}
