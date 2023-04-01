import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/cubit.dart';
import 'package:news_app/shared/component/states.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewScreen extends StatelessWidget{
  final String url;
  WebViewScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
                'WebView',
            ),
          ),
          body: WebView(
            initialUrl: '$url',
          ),
        );
      },
    );
  }
}