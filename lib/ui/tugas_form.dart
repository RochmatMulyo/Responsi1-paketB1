 // ignore_for_file: library_private_types_in_public_api


 import 'package:flutter/material.dart';
 import 'package:responsi1/bloc/tugas_bloc.dart';
 import 'package:responsi1/model/tugas.dart';
 import 'package:responsi1/ui/tugas_page.dart';
 import 'package:responsi1/widget/warning_dialog.dart';
 // ignore: must_be_immutable
 class TugasForm extends StatefulWidget {
 Tugas? tugas;
 TugasForm({Key? key, this.tugas}) : super(key: key);

 @override
 _TugasFormState createState() => _TugasFormState();
 }

 class _TugasFormState extends State<TugasForm> {
 final _formKey = GlobalKey<FormState>();
 bool _isLoading = false;
 String judul = "TAMBAH TUGAS";
 String tombolSubmit = "SIMPAN";

 final _judulTugasTextboxController = TextEditingController();
 final _deskripsiTugasTextboxController = TextEditingController();
 final _deadlineTugasTextboxController = TextEditingController();
 @override
 void initState() {
 super.initState();
 isUpdate();
 }

 isUpdate() {
 if (widget.tugas != null) {
 setState(() {
 judul = "UBAH TUGAS";
 tombolSubmit = "UBAH";
 _judulTugasTextboxController.text = widget.tugas!.judul!;
 _deskripsiTugasTextboxController.text = widget.tugas!.deskripsi!;
 _deadlineTugasTextboxController.text = widget.tugas!.deadline!;
 });
 } else {
 judul = "TAMBAH TUGAS";
 tombolSubmit = "SIMPAN";
 }
 }

 @override
Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(title: Text(judul)),
 body: SingleChildScrollView(
 child: Padding(
 padding: const EdgeInsets.all(8.0),
 child: Form(
 key: _formKey,
 child: Column(
 children: [
 _judulTextField(),
 _deskripsiTextField(),
 _deadlineTextField(),
 _buttonSubmit()
 ],
 ),
 ),
 ),
 ),
 );
 }

 Widget _judulTextField() {
 return TextFormField(
 decoration: const InputDecoration(labelText: "Judul Tugas"),
 keyboardType: TextInputType.text,
 controller: _judulTugasTextboxController,
 validator: (value) {
 if (value!.isEmpty) {
 return "Judul Tugas harus diisi";
 }
 return null;
 },
 );
 }


 Widget  _deadlineTextField() {
 return TextFormField(
 decoration: const InputDecoration(labelText: "deadline"),
 keyboardType: TextInputType.text,
 controller: _deadlineTugasTextboxController,
 validator: (value) {
 if (value!.isEmpty) {
 return "ddeadline harus diisi";
 }
 return null;
 },
 );
 }

//Membuat Textbox Harga Produk
 Widget _deskripsiTextField() {
 return TextFormField(
 decoration: const InputDecoration(labelText: "Deskripsi"),
 keyboardType: TextInputType.text,
 controller: _deskripsiTugasTextboxController,
 validator: (value) {
 if (value!.isEmpty) {
 return "Harga harus diisi";
 }
 return null;
 },
 );
 }

//Membuat Tombol Simpan/Ubah

 //Membuat Tombol Simpan/Ubah
 Widget _buttonSubmit() {
  return OutlinedButton(
    child: Text(tombolSubmit),
    onPressed: () {
      var validate = _formKey.currentState!.validate();
      if (validate) {
        if (!_isLoading) {
          if (widget.tugas == null) { //kondisi update produk
            simpan();
          }
          }
        }
    });
 }

 simpan() {
 setState(() {
  _isLoading = true;
  });
  Tugas createTugas = Tugas(id: null);
  createTugas.judul = _judulTugasTextboxController.text;
  createTugas.deskripsi = _deskripsiTugasTextboxController.text;
  createTugas.deadline = _deadlineTugasTextboxController.text;
  TugasBloc.addTugas(tugas: createTugas).then((value) {
    Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => const TugasPage()));
  }, onError: (error) {
  showDialog(
  context: context,
  builder: (BuildContext context) => const WarningDialog(
  description: "Simpan gagal, silahkan coba lagi",
  ));
 });
 setState(() {
 _isLoading = false;
 });
 }

 
}