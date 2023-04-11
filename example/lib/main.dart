import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(LinkifyExample());

class LinkifyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter_linkify example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter_linkify example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Linkify(
                onOpen: _onOpen,
                text: "Made by https://cretezy.com\n\nMail: example@gmail.com",
              ),
            ),
            Center(
              child: SelectableLinkify(
                onOpen: _onOpen,
                text: "Made by https://cretezy.com\n\nMail: example@gmail.com",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    final url = Uri.parse(link.url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
