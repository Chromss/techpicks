import 'package:flutter/material.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});
  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _description = "";
  int _amount = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add and Customize Your Products',
          ),
        ),
        backgroundColor: Color.fromRGBO(40,42,58,1),
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "e.g. Smartwatch",
                    labelText: "Name",
                    hintStyle: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(107,107,107,1),
                      fontSize: 16.0,
                      letterSpacing: -0.5,
                    ),
                    labelStyle: const TextStyle(
                      fontFamily: 'Geist',
                      fontSize: 16.0,
                      letterSpacing: -0.5,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontSize: 16.0,
                    letterSpacing: -0.5,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name can't be empty!";
                    }
                    if (value.length < 5) {
                      return "Name must be at least 5 characters long!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "e.g. A brand new smartwatch with nano-technology.",
                    labelText: "Description",
                    hintStyle: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(107,107,107,1),
                      fontSize: 16.0,
                      letterSpacing: -0.5,
                    ),
                    labelStyle: const TextStyle(
                      fontFamily: 'Geist',
                      fontSize: 16.0,
                      letterSpacing: -0.5,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontSize: 16.0,
                    letterSpacing: -0.5,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description can't be empty!";
                    }
                    return null;
                  },
                  maxLines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "e.g. 15",
                    labelText: "Amount",
                    hintStyle: const TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(107,107,107,1),
                      fontSize: 16.0,
                      letterSpacing: -0.5,
                    ),
                    labelStyle: const TextStyle(
                      fontFamily: 'Geist',
                      fontSize: 16.0,
                      letterSpacing: -0.5,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontSize: 16.0,
                    letterSpacing: -0.5,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount can't be empty!";
                    }
                    final theValue = int.tryParse(value);
                    if (theValue == null) {
                      return "Amount must be an integer!";
                    }
                    if (theValue <= 0) {
                      return "Amount must be positive!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Color.fromRGBO(50,121,230,1)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                'Product Has Been Successfully Added!',
                                style: TextStyle(
                                  fontFamily: 'Geist',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name: $_name',
                                      style: TextStyle(
                                        fontFamily: 'Geist',
                                        fontSize: 16,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                    Text(
                                      'Description: $_description',
                                      style: TextStyle(
                                        fontFamily: 'Geist',
                                        fontSize: 16,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                    Text(
                                      'Amount: $_amount',
                                      style: TextStyle(
                                        fontFamily: 'Geist',
                                        fontSize: 16,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Add Product",
                      style: TextStyle(
                        fontFamily: 'Geist',
                        letterSpacing: -0.5,
                        fontSize: 17,
                        color: Colors.white
                      ),
                    ),
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