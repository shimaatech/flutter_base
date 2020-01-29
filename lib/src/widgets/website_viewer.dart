import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class WebsiteViewer extends StatefulWidget {
  WebsiteViewer(this.url);

  final String url;

  @override
  _WebsiteViewerState createState() => _WebsiteViewerState();
}

class _WebsiteViewerState extends State<WebsiteViewer> {
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        (_progress != 1.0)
            ? LinearProgressIndicator(value: _progress)
            : Container(),
        Expanded(
          child: InAppWebView(
            initialUrl: widget.url,
            onProgressChanged: (controller, progress) => _setProgress(progress),
          ),
        ),
      ],
    );
  }

  void _setProgress(int progress) {
    setState(() {
      _progress = progress / 100;
      print('Progress: $_progress');
    });
  }
}
