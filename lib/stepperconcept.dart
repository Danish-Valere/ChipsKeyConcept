import 'package:chips_key_tooltip/chartsconcept.dart';
import 'package:flutter/material.dart';

class StepperConcept extends StatefulWidget {
  const StepperConcept({Key? key}) : super(key: key);

  @override
  State<StepperConcept> createState() => _StepperConceptState();
}

class _StepperConceptState extends State<StepperConcept> {
  int currentStep = 0;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _accountNumberController = TextEditingController();
  TextEditingController _ifscCodeController = TextEditingController();

  FocusNode _nameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _addressFocus = FocusNode();
  FocusNode _mobileFocus = FocusNode();
  FocusNode _accountNumberFocus = FocusNode();
  FocusNode _ifscCodeFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Stepper"),
      ),
      body: Column(
        children: [
          Stepper(
            steps: getSteps(),
            type: StepperType.vertical,
            currentStep: currentStep,
            onStepTapped: (int step) {
              setState(() {
                currentStep = step;
              });
            },
            onStepCancel: () {
              currentStep > 0 ? setState(() => currentStep--) : null;
            },
            onStepContinue: () {
              currentStep < 2 ? setState(() => currentStep++) : null;
            },
          ),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChartConcept()));
              },
              icon: const Icon(Icons.navigate_next_rounded),
              label: const Text('Chart-Screen'))
        ],
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        title: const Text('Personal Info'),
        content: Column(
          children: [
            TextFormField(
              controller: _nameController,
              focusNode: _nameFocus,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _emailController,
              focusNode: _emailFocus,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Email Address'),
            ),
          ],
        ),
        isActive: currentStep >= 0,
        state: currentStep == 0 ? StepState.editing : StepState.complete,
      ),
      Step(
        title: const Text('Address Details'),
        content: Column(
          children: [
            TextFormField(
              controller: _addressController,
              focusNode: _addressFocus,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Home Address'),
            ),
            TextFormField(
              controller: _mobileController,
              focusNode: _mobileFocus,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Mobile No'),
            ),
          ],
        ),
        isActive: currentStep >= 1,
        state: currentStep == 1
            ? StepState.editing
            : currentStep < 1
                ? StepState.disabled
                : StepState.complete,
      ),
      Step(
        title: const Text("Bank Details"),
        content: Column(
          children: [
            TextFormField(
              controller: _accountNumberController,
              focusNode: _accountNumberFocus,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Account No'),
            ),
            TextFormField(
              controller: _ifscCodeController,
              focusNode: _ifscCodeFocus,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'IFSC Code'),
            ),
          ],
        ),
        isActive: currentStep >= 2,
        state: currentStep == 2
            ? StepState.editing
            : currentStep < 2
                ? StepState.disabled
                : StepState.complete,
      ),
    ];
  }
}
