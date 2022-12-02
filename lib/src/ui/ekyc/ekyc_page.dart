import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ekyc_controller.dart';

class EkycPage extends GetView<EkycController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EkycPage'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EkycPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
