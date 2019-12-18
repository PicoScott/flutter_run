import 'package:flutter/widgets.dart';

List<int> frameList = List();
start_frame_monitor(){
      WidgetsFlutterBinding.ensureInitialized().addPersistentFrameCallback((duration){
          var timeMs =  DateTime.now().millisecondsSinceEpoch;
          frameList.add(timeMs);
          frameList.removeWhere((item)=> timeMs - item > 1000);
          print(frameList.length);
      });
}