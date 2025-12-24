import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestScreen(),
    ));
}

class TestScreen extends StatefulWidget{
  const TestScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TestPageState();
}
class _TestPageState extends State<TestScreen>{
  bool _isImageVisible = true;
  void _toggleImageVisibility(){
    setState(() {
      _isImageVisible = !_isImageVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Column(
        children: [
          _buildImageHeader(),
          _buildScrollableList(),
          _buildFooterButton(),
        ],
      )
    );
  }

  Widget _buildImageHeader(){
    return Column(children: [
      const SizedBox(height: 16),

      Visibility(
        visible: _isImageVisible,
        child: Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          width: double.infinity,
          height: 150,
          fit: BoxFit.scaleDown
        )
      )
    ],
    );
  }


  Widget _buildScrollableList(){
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('Item ${index + 1}')
          );
        }  
      ),
    );
  }

  Widget _buildFooterButton(){
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _toggleImageVisibility,
              child: Text(
                _isImageVisible ? "Hide Image" : "Show Image"
              )
            )
          )
        )
      ],
    );
  }
}