part of engine;

class SkPictureRecorder implements ui.PictureRecorder {
  @override
  ui.Rect cullRect;

  js.JsObject _recorder;

  @override
  RecordingCanvas beginRecording(ui.Rect bounds) {
    cullRect = bounds;
    _recorder = js.JsObject(canvasKit['SkPictureRecorder']);
    final js.JsObject skRect = js.JsObject(canvasKit['LTRBRect'],
        <double>[bounds.left, bounds.top, bounds.right, bounds.bottom]);
    final js.JsObject skCanvas =
        _recorder.callMethod('beginRecording', <js.JsObject>[skRect]);
    return SkRecordingCanvas(skCanvas);
  }

  @override
  ui.Picture endRecording() {
    js.JsObject skPicture = _recorder.callMethod('finishRecordingAsPicture');
    _recorder.callMethod('delete');
    return SkPicture(skPicture, cullRect);
  }

  @override
  bool get isRecording => false;
}
