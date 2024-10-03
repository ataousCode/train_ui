import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassengerInformationScreen extends StatefulWidget {
  const PassengerInformationScreen({super.key});

  @override
  State<PassengerInformationScreen> createState() =>
      _PassengerInformationScreenState();
}

class _PassengerInformationScreenState
    extends State<PassengerInformationScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  DateTime _selectedIdExpiryDate = DateTime.now();
  DateTime _selectedDateOfBirth = DateTime.now();
  String _selectedCountryCode = '+86';
  String _selectedCountry = 'China';
  String? _selectedGender;

  void _showDatePickerDialog(BuildContext context,
      Function(DateTime) onDateSelected, DateTime initialDate) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 200,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: onDateSelected,
              ),
            ),
            CupertinoButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country.name;
          _selectedCountryCode = '+${country.phoneCode}';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Passenger Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Country/Region'),
                subtitle: Text(_selectedCountry),
                trailing: const Icon(Icons.language),
                onTap: _showCountryPicker,
              ),
              const Divider(),
              Row(
                children: <Widget>[
                  // Expanded(
                  //   flex: 1,
                  //   child:
                  GestureDetector(
                    onTap: _showCountryPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            _selectedCountryCode,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                  //),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: _mobileNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Mobile number',
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                  ),
                ],
              ),
              //const Divider(),
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              //const Divider(),
              // Email Address
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail address',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              //const Divider(),
              // ID Number
              TextField(
                controller: _idNumberController,
                decoration: const InputDecoration(
                  labelText: 'ID number',
                  prefixIcon: Icon(Icons.badge),
                ),
              ),
              // Date Picker for ID Expiry Date
              // Expanded(
              //   child:
              ListTile(
                title: const Text('ID expiry Date'),
                subtitle: Text(
                    '${_selectedIdExpiryDate.year}-${_selectedIdExpiryDate.month}-${_selectedIdExpiryDate.day}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () {
                  _showDatePickerDialog(context, (date) {
                    setState(() {
                      _selectedIdExpiryDate = date;
                    });
                  }, _selectedIdExpiryDate);
                },
              ),
              //),

              const Divider(),
              // Date Picker for Date of Birth
              ListTile(
                title: const Text('Date of ID use'),
                subtitle: Text(
                    '${_selectedDateOfBirth.year}-${_selectedDateOfBirth.month}-${_selectedDateOfBirth.day}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () {
                  _showDatePickerDialog((context), (date) {
                    setState(() {
                      _selectedDateOfBirth = date;
                    });
                  }, _selectedDateOfBirth);
                },
              ),

              const Divider(),
              // Gender
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text('Gender'),
                  const SizedBox(width: 16),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Radio<String>(
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      const Text('Male'),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      const Text('Female'),
                    ],
                  ),
                ],
              ),
              // confirmation
              const Divider(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
