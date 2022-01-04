// import 'dart:math' as math;
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;
//
// class Photo extends StatelessWidget {
//   Photo({ Key ?key, required this.photo,  required this.onTap }) : super(key: key);
//
//   final String photo;
//   // final Color color;
//   final VoidCallback onTap;
//
//   Widget build(BuildContext context) {
//     return Material(
//       color: Theme.of(context).primaryColor.withOpacity(0.25),
//       child: InkWell(
//         onTap: onTap,
//         child: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints size) {
//             return Image.asset(
//               photo,
//               fit: BoxFit.contain,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class RadialExpansion extends StatelessWidget {
//   RadialExpansion({
//     Key?key,
//     required this.maxRadius,
//     required this.child,
//   }) : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
//         super(key: key);
//
//   final double maxRadius;
//   final clipRectSize;
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipOval(
//       child: Center(
//         child: SizedBox(
//           width: clipRectSize,
//           height: clipRectSize,
//           child: ClipRect(
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class RadialExpansionDemo extends StatelessWidget {
//   static const double kMinRadius = 32.0;
//   static const double kMaxRadius = 128.0;
//   static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
//
//   static RectTween _createRectTween(Rect? begin, Rect? end) {
//     return MaterialRectCenterArcTween(begin: begin, end: end);
//   }
//
//   static Widget _buildPage(BuildContext context, String imageName, String description) {
//     return Container(
//       color: Theme.of(context).canvasColor,
//       child: Center(
//         child: Card(
//           elevation: 8.0,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 width: kMaxRadius * 2.0,
//                 height: kMaxRadius * 2.0,
//                 child: Hero(
//                   createRectTween: _createRectTween,
//                   tag: imageName,
//                   child: RadialExpansion(
//                     maxRadius: kMaxRadius,
//                     child: Photo(
//                       // color: ,
//                       photo: imageName,
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               Text(
//                 description,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//                 textScaleFactor: 3.0,
//               ),
//               const SizedBox(height: 20.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHero(BuildContext context, String imageName, String description) {
//     return Container(
//       width: kMinRadius * 3.0,
//       height: kMinRadius * 3.0,
//       child: Hero(
//         createRectTween: _createRectTween,
//         tag: imageName,
//         child: RadialExpansion(
//           maxRadius: kMaxRadius,
//           child: Photo(
//             // color: ,
//             photo: imageName,
//             onTap: () {
//               Navigator.of(context).push(
//                 PageRouteBuilder<void>(
//                   pageBuilder: (BuildContext context,
//                       Animation<double> animation,
//                       Animation<double> secondaryAnimation) {
//                     return AnimatedBuilder(
//                         animation: animation,
//                         builder: (BuildContext context, Widget? child) {
//                           return Opacity(
//                             opacity: opacityCurve.transform(animation.value),
//                             child: _buildPage(context, imageName, description,),
//
//                           );
//                         }
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // animation speed.
//     timeDilation = 4.0;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GeeksForGeeks'),
//         backgroundColor: Colors.green,
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(33.0),
//         alignment: FractionalOffset.bottomLeft,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildHero(context, 'assets/teddy3.png', 'Aquaman'),
//             _buildHero(context, 'assets/franceimg.png', 'Superman'),
//             _buildHero(context, 'assets/france.png', 'Wonderwomen'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(home: RadialExpansionDemo()));
// }

// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:flutter/services.dart';
// import 'package:payumoney/payumoney.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _platformVersion = '';
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String platformVersion;
//
//     Map map = {
//       "txnId": "123456",
//       "email": "test@test.com",
//       "amount": "10.00",
//       "phone": "9876543210",
//       "product": "Monthly",
//       "firstname": "Test Name",
//       "mkey": "",
//       "mid": ""
//     };
//     try {
//       platformVersion = await Payumoney.paymentStart(map);
//     } on PlatformException {
//       platformVersion = 'Failed to start payment.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Payment Gateway'),
//         ),
//         body: Center(
//           child: Text(_platformVersion == ""
//               ? 'Payment Started'
//               : "Payment Status : $_platformVersion"),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A text field that also has buttons to select all the text and copy the
/// selected text to the clipboard.
class CopyableTextField extends StatefulWidget {
  const CopyableTextField({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CopyableTextField> createState() => _CopyableTextFieldState();
}

class _CopyableTextFieldState extends State<CopyableTextField> {
  late TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      dispatcher: LoggingActionDispatcher(),
      actions: <Type, Action<Intent>>{
        ClearIntent: ClearAction(controller),
        CopyIntent: CopyAction(controller),
        SelectAllIntent: SelectAllAction(controller),
      },
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          body: Center(
            child: Row(
              children: <Widget>[
                const Spacer(),
                Expanded(
                  child: TextField(controller: controller),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed:
                  Actions.handler<CopyIntent>(context, const CopyIntent()),
                ),
                IconButton(
                  icon: const Icon(Icons.select_all),
                  onPressed: Actions.handler<SelectAllIntent>(
                      context, const SelectAllIntent()),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      }),
    );
  }
}

/// A ShortcutManager that logs all keys that it handles.
class LoggingShortcutManager extends ShortcutManager {
  @override
  KeyEventResult handleKeypress(BuildContext context, RawKeyEvent event) {
    final KeyEventResult result = super.handleKeypress(context, event);
    if (result == KeyEventResult.handled) {
      print('Handled shortcut $event in $context');
    }
    return result;
  }
}

/// An ActionDispatcher that logs all the actions that it invokes.
class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
      covariant Action<Intent> action,
      covariant Intent intent, [
        BuildContext? context,
      ]) {
    print('Action invoked: $action($intent) from $context');
    super.invokeAction(action, intent, context);
  }
}

/// An intent that is bound to ClearAction in order to clear its
/// TextEditingController.
class ClearIntent extends Intent {
  const ClearIntent();
}

/// An action that is bound to ClearIntent that clears its
/// TextEditingController.
class ClearAction extends Action<ClearIntent> {
  ClearAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(covariant ClearIntent intent) {
    controller.clear();
  }
}

/// An intent that is bound to CopyAction to copy from its
/// TextEditingController.
class CopyIntent extends Intent {
  const CopyIntent();
}

/// An action that is bound to CopyIntent that copies the text in its
/// TextEditingController to the clipboard.
class CopyAction extends Action<CopyIntent> {
  CopyAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(covariant CopyIntent intent) {
    final String selectedString = controller.text.substring(
      controller.selection.baseOffset,
      controller.selection.extentOffset,
    );
    Clipboard.setData(ClipboardData(text: selectedString));
  }
}

/// An intent that is bound to SelectAllAction to select all the text in its
/// controller.
class SelectAllIntent extends Intent {
  const SelectAllIntent();
}

/// An action that is bound to SelectAllAction that selects all text in its
/// TextEditingController.
class SelectAllAction extends Action<SelectAllIntent> {
  SelectAllAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(covariant SelectAllIntent intent) {
    controller.selection = controller.selection.copyWith(
      baseOffset: 0,
      extentOffset: controller.text.length,
      affinity: controller.selection.affinity,
    );
  }
}

/// The top level application class.
///
/// Shortcuts defined here are in effect for the whole app,
/// although different widgets may fulfill them differently.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = 'Shortcuts and Actions Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Shortcuts(
        manager: LoggingShortcutManager(),
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.escape): const ClearIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyC):
          const CopyIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyA):
          const SelectAllIntent(),
        },
        child: const CopyableTextField(title: title),
      ),
    );
  }
}

void main() => runApp(const MyApp());