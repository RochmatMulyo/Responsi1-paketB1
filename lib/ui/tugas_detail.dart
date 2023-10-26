import 'package:flutter/material.dart';
import 'package:responsi1/bloc/tugas_bloc.dart';
 import 'package:responsi1/model/tugas.dart';
 import 'package:responsi1/ui/tugas_form.dart';
import 'package:responsi1/ui/tugas_page.dart';

 // ignore: must_be_immutable
 class TugasDetail extends StatefulWidget {
 Tugas? tugas;

 TugasDetail({Key? key, this.tugas}) : super(key: key);

 @override
 _TugasDetailState createState() => _TugasDetailState();
 }

 class _TugasDetailState extends State<TugasDetail> {
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: const Text('Detail tugas'),





),
body: Center( child:
Column(
children: [
Text(
 "Judul : ${widget.tugas!.judul}",
 style: const TextStyle(fontSize: 20.0),
 ),
 Text(
 "Deskripsi : ${widget.tugas!.deskripsi}",
 style: const TextStyle(fontSize: 18.0),
 ),
 Text(
 "Deadline : ${widget.tugas!.deadline.toString()}",
 style: const TextStyle(fontSize: 18.0),
 ),
 _tombolHapusEdit()
 ],
 ),
 ),
 );
 }

Widget _tombolHapusEdit() {
return Row(
 mainAxisSize: MainAxisSize.min,
 children: [
 //Tombol Edit
 OutlinedButton(
 child: const Text("EDIT"),
 onPressed: () {
 Navigator.push(
 context,
 MaterialPageRoute(
 builder: (context) => TugasForm(
 tugas: widget.tugas!,
 )));
 }),
 //Tombol Hapus
 OutlinedButton(
 child: const Text("DELETE"), onPressed: () => confirmHapus()),
 ],
 );
 }

void confirmHapus() {
 AlertDialog alertDialog = AlertDialog(
 content: const Text("Yakin ingin menghapus data ini?"),
 actions: [
 //tombol hapus
 OutlinedButton(
 child: const Text("Ya"),
 onPressed: () {
  TugasBloc.deleteTugas(id: widget.tugas!.id).then((value) {
  Navigator.of(context).push(MaterialPageRoute(
  builder: (BuildContext context) => const TugasPage()));
  });
 Navigator.push(
 context,
 MaterialPageRoute(
 builder: (context) => TugasPage()));
 },
 ),
 //tombol batal
 OutlinedButton(
 child: const Text("Batal"),
 onPressed: () => Navigator.pop(context),
 )
 ],
 );

 showDialog(builder: (context) => alertDialog, context: context);
 }
 }