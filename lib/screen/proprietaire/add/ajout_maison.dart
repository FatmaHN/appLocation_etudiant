import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_pour_etudiants/screen/proprietaire/function.dart';
import 'package:location_pour_etudiants/screen/proprietaire/typedefoyer.dart';

class ajout_maison extends StatefulWidget {
  const ajout_maison({Key? key}) : super(key: key);

  @override
  _ajout_maisonState createState() => _ajout_maisonState();
}

class _ajout_maisonState extends State<ajout_maison> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _datedispo;
  List<XFile> _imageFiles = [];
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool isSwitched = false;
  String sexe = "Filles";
  String type_location = "Location Partiel";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text(
          "Bienvenue",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1976D2),
        leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const typefoyer())),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )) /* CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('images/logo.png'),
            ), */
            ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30.0),
                const Text(
                  "Disponibilité de maison",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 18.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: _datedispo ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025, 06, 31, 0, 0),
                          );
                          if (picked != null) {
                            setState(() {
                              _datedispo = picked;
                            });
                          }
                        },
                        child: Container(
                          height: 60.0,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: Center(
                            child: Text(_datedispo != null
                                ? DateFormat.yMd().format(_datedispo!)
                                : 'MM/JJ/AAAA'),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _datedispo ?? DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025, 06, 31, 0, 0),
                        );
                        if (picked != null) {
                          setState(() {
                            _datedispo = picked;
                          });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Select Address'),
                            content: StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return Container(
                                  height: 300,
                                  child: GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          37.42796133580664, -122.085749655962),
                                      zoom: 14.4746,
                                    ),
                                    onMapCreated:
                                        (GoogleMapController controller) {
                                      // You can add markers or do other map-related tasks here
                                    },
                                    onTap: (LatLng position) async {
                                      List<Placemark> placemarks =
                                          await placemarkFromCoordinates(
                                              position.latitude,
                                              position.longitude);
                                      if (placemarks.isNotEmpty) {
                                        Placemark placemark = placemarks.first;
                                        setState(() {
                                          _addressController.text =
                                              '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
                                        });
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Text('Select Address'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          minLines: 1,
                          maxLines: 3,
                          controller: _addressController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Address',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _controller1,
                  minLines: 1,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    labelText: 'Description de maison',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Décrire votre maison s\'il vous plaît pour plus d\'information';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _controller2,
                  decoration: const InputDecoration(
                    labelText: 'Prix',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Il faut donner un prix de location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Genre",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Garçons'),
                        value: "Garsons",
                        groupValue: sexe,
                        onChanged: (value) {
                          setState(() {
                            sexe = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Filles'),
                        value: "Filles",
                        groupValue: sexe,
                        onChanged: (value) {
                          setState(() {
                            sexe = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                SwitchListTile(
                  title: const Text('Contrat'),
                  value: isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Comment louer",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Location Totale'),
                        value: "Location Totale",
                        groupValue: type_location,
                        onChanged: (value) {
                          setState(() {
                            type_location = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Location Partiel'),
                        value: "Location Partiel",
                        groupValue: type_location,
                        onChanged: (value) {
                          setState(() {
                            type_location = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                    "Ajouter des photos pour documenter votre annonce (10 photos min) : "),
                const SizedBox(height: 16.0),
                _buildGridView(),
                const SizedBox(height: 20.0),
                Center(
                  child: SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _validateGridView() &&
                            _validateBirthday()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Formulaire soumis'),
                            ),
                          );
                        }
                      },
                      child: const Text('Ajouter'),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "accueil",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 20,
              ),
              label: "Ajouter",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "messages"),
        ],
        selectedItemColor: Colors.white,
        currentIndex: 0,
        backgroundColor: Colors.blueAccent,
        unselectedItemColor: Colors.white54,
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _imageFiles.length + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 4.0,
      ),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Center(
            child: IconButton(
              onPressed: () async {
                final functionproprietaire func = functionproprietaire();
                func.getImages(context, _imageFiles, setState);
              },
              icon: const Icon(
                Icons.add_a_photo,
                color: Colors.deepPurple,
              ),
            ),
          );
        } else {
          final XFile imageFile = _imageFiles[index - 1];
          return Image.file(File(imageFile.path));
        }
      },
    );
  }

  bool _validateBirthday() {
    if (_datedispo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner une date de naissance'),
        ),
      );
      return false;
    }
    return true;
  }

  bool _validateGridView() {
    if (_imageFiles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner au moins une image'),
        ),
      );
      return false;
    }
    return true;
  }

  /* Future<void> _getImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null) {
      setState(() {
        _imageFiles.addAll(images);
      });
    }
  } */
}
