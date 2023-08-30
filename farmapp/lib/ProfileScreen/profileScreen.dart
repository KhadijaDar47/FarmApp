import 'package:farmapp/ProfileScreen/uploadImage.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
// import 'UploadPicture.dart';

late String id;

class UserProfile extends StatefulWidget {
  final Map? data;
  final String? editid;
  const UserProfile({
    super.key,
    this.data,
    this.editid,
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isEditing = false;
  String _value = '';
  late String imageUrl;

  void _updateValue(String value) {
    setState(() {
      _value = value;
    });
  }

  @override
  void initState() {
    super.initState();
    final data = widget.data;
    id = widget.editid ?? '';
    if (data != null) {
      isEditing = true;
      name.text = data['FullName'] ?? ' ';
      email.text = data['Email'] ?? " ";
      phone.text = data['Phone'] ?? ' ';
      password.text = data['Password'] ?? " ";
      imageUrl = data['imageUrl'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                color: Colors.grey.shade800),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const NavBarWidget(),
              //   ),
              // );
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            color: const Color(0XFF2879E9),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: mediaQueryData.size.height * 0.05),
                UploadImage(
                  updateValue: _updateValue,
                ),
                if (isEditing)
                  Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: mediaQueryData.size.height * 0.02),
                        TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            hintText: "Full Name",
                            labelStyle: TextStyle(color: Colors.grey.shade500),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: address,
                          decoration: InputDecoration(
                            labelText: "Address",
                            hintText: "Address",
                            labelStyle: TextStyle(color: Colors.grey.shade500),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: phone,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            hintText: "Phone Number",
                            labelStyle: TextStyle(color: Colors.grey.shade500),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Email",
                            labelStyle: TextStyle(color: Colors.grey.shade500),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Password",
                            labelStyle: TextStyle(color: Colors.grey.shade500),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: mediaQueryData.size.height * 0.016),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => Landing()),
                              // );
                            },
                            label: Text("logout".toUpperCase()),
                            icon: const Icon(Icons.logout_outlined),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Column(
                    children: [
                      _buildInfoCard('Full Name', name.text),
                      _buildInfoCard('Phone Number', phone.text),
                      _buildInfoCard('Address', address.text),
                      _buildInfoCard('Email', email.text),

                      _buildInfoCard('Password', password.text),
                      // _buildInfoCard('Full Name', 'Momina'),
                      // _buildInfoCard('Phone Number', '03008811400'),
                      // _buildInfoCard('Email', 'momina@gmail.com'),
                      // _buildInfoCard('Password', 'helloooo'),
                    ],
                  ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF2879E9)),
                    onPressed: () {
                      setState(() {
                        isEditing = !isEditing;
                      });
                    },
                    child: Text(
                      isEditing
                          ? "Update".toUpperCase()
                          : "Edit Information".toUpperCase(),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height * 0.016),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => Landing()),
                      // );
                    },
                    label: Text("logout".toUpperCase()),
                    icon: Icon(Icons.logout_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, Widget content) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          content,
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return _buildCard(
      title,
      Text(
        value,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
