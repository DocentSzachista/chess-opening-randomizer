import 'package:flutter/material.dart';

import 'package:chess/widgets/footer_button.dart';
import 'package:chess/widgets/form_fields.dart';

class AddOpening extends StatefulWidget {
  const AddOpening({Key? key}) : super(key: key);

  @override
  _AddOpeningState createState() => _AddOpeningState();
}

class _AddOpeningState extends State<AddOpening> {

  static const String openingNameHint = 'Input your opening name';
  static const String openingHint = 'Input your opening here';
  static const String openingNameError = 'You must provide name of the opening';
  static const String openingError = 'You must provide opening lines';
  final openingNameController = TextEditingController();
  final openingController = TextEditingController();
  bool _validateOpeningName = false;
  bool _validateOpening= false;

  @override
  void dispose(){
    openingNameController.dispose();
    openingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new opening"),),
      body: retrieveForm(),
      bottomNavigationBar: FooterButton(text: "Add new opening", onClick: ()=>checkInputs(context),),
    );
  }

  void checkInputs(BuildContext context){
    setState(() {
        _validateOpening = openingController.text.isNotEmpty;
        _validateOpeningName = openingNameController.text.isNotEmpty;
        print(_validateOpening);
        print(_validateOpeningName);
    });
  }

  @override
  Widget retrieveForm() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        OpeningTextField(
          controller:  openingNameController,
          errorMessage: openingNameError,
          labelText:  openingNameHint,
          validate: _validateOpeningName,
          lenghtLimit: 50,
        ),
        OpeningTextField(
            controller: openingController,
            labelText: openingHint,
            errorMessage: openingError,
            validate: _validateOpening,
            allowMultiline: true,
        ),
      ],
      ),
    );
  }






}
