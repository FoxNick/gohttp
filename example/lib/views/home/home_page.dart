import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gohttp/gohttp.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // 设置请求根地址
    Http().setBaseAddress("https://www.baidu.com");
    
    _showVersion();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showVersion() async {
    // 输出版本信息
    String version = await Http().getVersion();
    log('gohttp版本: ${version}');
  }

  void _post() async {
    ResponseData respJson = await Http().post('/v1/demo');
    EasyLoading.showInfo("code: ${respJson.statusCode} \n status: ${respJson.status}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('gohttp'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            TextButton(
              onPressed: () {
                log('点击按钮');
                _post();
              },
              child: const Text('POST'),
            ),
            SizedBox(height: 20,),
            TextButton(
              onPressed: () {
                log('点击按钮');
                _post();
              },
              child: const Text('POST'),
            ),
          ],
        ),
      ),
    );
  }
}
