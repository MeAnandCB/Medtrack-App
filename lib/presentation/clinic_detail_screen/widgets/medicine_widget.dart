import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';

class Medicine {
  final String name;
  final String price;

  Medicine(this.name, this.price);
}

class MedicineList extends StatefulWidget {
  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  List<Medicine> medicines = [
    Medicine("Dolo 650 Tab", "5.99"),
    Medicine("Diclowin Plus Tab", "6.49"),
    Medicine("Deriphyllin Retard 150 Tab", "4.99"),
    Medicine("Neurobion Forte Tab.", "7.99"),
    Medicine("Evion 400 Cap.", "3.99"),
    Medicine("Zeecold Z Tab", "2.99"),
    Medicine("Bendex 400 Tab", "4.29"),
    Medicine("Rantac Tab. 150mg", "3.49"),
    Medicine("Omee Cap.", "5.79"),
    Medicine("Glinil M Tab.", "6.99"),
    Medicine("Cipcal 500 Tab.", "4.89"),
    Medicine("Okamet Tab. 500mg", "7.29"),
    Medicine("Becosules Cap", "5.39"),
    Medicine("Amlo Tab. 5mg", "3.69"),
    Medicine("Amizis 50mg Tab", "5.49"),
    Medicine("Amaryl Tab. 1 mg", "4.99"),
    Medicine("Arkamin Tab", "3.79"),
    Medicine("Avomine 25 Tab", "2.99"),
    Medicine("Aztor 10 Tab", "4.49"),
    Medicine("Allegra Tab. 120mg", "6.99"),
    Medicine("Atorva 40 Tab", "7.49"),
    Medicine("AXCER 90 TAB.", "8.99"),
    Medicine("Acidose Tab", "4.29"),
    Medicine("Amitral 10mg. Tab", "3.99"),
    Medicine("Air M Tab", "4.79"),
    Medicine("AB Flo Cap. 100 mg", "5.59"),
    Medicine("Bacioren 20mg Tab", "6.79"),
    Medicine("Becopil Tab", "3.29"),
    Medicine("Benalgis Tab", "2.99"),
    Medicine("Becozinc Cap", "4.49"),
    Medicine("Beeto 20 Tab", "4.99"),
    Medicine("Betacap TR Cap. 40 mg", "7.19"),
    Medicine("Betaone XL 50 Tab", "5.99"),
    Medicine("Beta Nicardia Cap", "6.29"),
    Medicine("Bilazap 20 Tab", "4.49"),
    Medicine("Bonetuf Tab", "3.99"),
    Medicine("Bizter XT Tab", "4.79"),
    Medicine("Calaptin SR 120 Tab", "5.29"),
    Medicine("Calcimax Forte Tab", "4.89"),
    Medicine("Carb M2 Tab", "3.49"),
    Medicine("Carbophage XR Tab. 500mg", "6.79"),
    Medicine("Cardace Tab. 5mg", "4.99"),
    Medicine("Carnitin E Tab", "5.79"),
    Medicine("Celin Tab. 500mg", "6.99"),
    Medicine("Cilacar Tab. 10mg", "4.49"),
    Medicine("Clopitab 75 Tab", "3.99"),
    Medicine("Concor 5 Tab", "4.79"),
    Medicine("Cresar Tab. 40 mg", "5.29"),
    Medicine("Cledomox 625 TAB", "5.49"),
    Medicine("Corbis Tab. 5mg", "6.99"),
    Medicine("Gemer 1 Tab", "4.89"),
    Medicine("Glimid 1 Tab", "3.69"),
    Medicine("Galvus Met Tab. 50/500mg", "7.29"),
    Medicine("Gerbisa Tab", "5.39"),
    Medicine("Genvast Tab. 20mg", "4.79"),
    Medicine("Glycomet GP 1 Tab", "6.49"),
    Medicine("Goodflo 150mg Tab", "5.99"),
    Medicine("Glucobay Tab. 25mg", "4.99"),
    Medicine("GabapinTab. 100mg", "7.49"),
    Medicine("Glucored Tab", "6.79"),
    Medicine("Ferroin Tab", "3.99"),
    Medicine("Folidex Tab", "4.79"),
    Medicine("Follihair Tab", "5.59"),
    Medicine("Flunil Cap. 10mg", "4.29"),
    Medicine("Flute Cap 40mg", "5.79"),
    Medicine("Febutaz Tab. 40 mg", "6.99"),
    Medicine("Folvite Tab", "3.49"),
    Medicine("Forcan 150 Tab", "4.99"),
    Medicine("Fruselas Tab", "6.29"),
  ];

  String searchTerm = "";
  String selectedFilter = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchTerm = value;
              });
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorCOnstant.myRoseColor),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorCOnstant.myRoseColor),
                borderRadius: BorderRadius.circular(15),
              ),
              labelStyle: TextStyle(color: ColorCOnstant.myRoseColor),
              hintStyle: TextStyle(color: ColorCOnstant.myRoseColor),
              hintText: "search your medicine",
              labelText: "search your medicine",
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              color: ColorCOnstant.myContainerGrey,
              child: DropdownButton<String>(
                onChanged: (value) {
                  setState(() {
                    selectedFilter = value!;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                    value: "",
                    child: Text("All"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Tab",
                    child: Text("Tablets"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Cap",
                    child: Text("Capsules"),
                  ),
                  // Add more filtering options as needed
                ],
                hint: Text("Filter by Type"),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              final medicine = medicines[index];
              if (searchTerm.isNotEmpty &&
                  !medicine.name
                      .toLowerCase()
                      .contains(searchTerm.toLowerCase())) {
                return SizedBox.shrink();
              }
              if (selectedFilter.isNotEmpty &&
                  !medicine.name
                      .toLowerCase()
                      .contains(selectedFilter.toLowerCase())) {
                return SizedBox.shrink();
              }
              return ListTile(
                title: Text(medicine.name),
                trailing: Text(
                  "Price: ${(10 / 15 * index + 5).toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorCOnstant.myRoseColor),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
