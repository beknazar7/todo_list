

// import 'package:flutter/material.dart';
// import 'package:todo_list/add/add_page.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
  
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;});
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print("HomePage - initState");
//   }

//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//      print("HomePage - didChangeDependencies");
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("HomePage - build");
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: .center,
//           children: [
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _navigateToAddPage() async{
//     final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => const AddPage()));
//     if(result != null){
//       print("Текст со второго экрана: $result");
//     }
//   }

//   @override
//   void didUpdateWidget(covariant MyHomePage oldWidget) {
//     // TODO: implement didUpdateWidget
//     super.didUpdateWidget(oldWidget);
//     print("HomePage - didUpdateWidget");
//   }

//   @override
//   void deactivate() {
//     // TODO: implement deactivate
//     super.deactivate();
//     print("HomePage - deactivate");
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     print("HomePage - dispose");
//   }

  


// }