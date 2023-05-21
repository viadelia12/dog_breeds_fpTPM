import 'package:finalproject/pages/dog_details.dart';
import 'package:finalproject/service/base_network.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs;
  String search = "";

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final BaseNetwork baseNetwork = BaseNetwork();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dogs Breeds',
        ),
        backgroundColor: Color(0xffCEAB93),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchField(),
            SizedBox(height: 20),
            Text(
              "List Dogs Breeds",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                  future: search != ""
                      ? baseNetwork.fetchDogsBreeds(search)
                      : baseNetwork.fetchDogs(),
                  initialData: [],
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (!snapshot.hasData) {
                      return Center(child: Text('Data unavailable'));
                    } else if (snapshot.data.length == 0) {
                      return Center(child: Text('Data kosong'));
                    } else {
                      return GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DogDetails(
                                          imageLink:
                                              snapshot.data![index].imageLink,
                                          goodWithChildren: snapshot
                                              .data![index].goodWithChildren,
                                          goodWithOtherDogs: snapshot
                                              .data![index].goodWithOtherDogs,
                                          shedding:
                                              snapshot.data![index].shedding,
                                          grooming:
                                              snapshot.data![index].grooming,
                                          drooling:
                                              snapshot.data![index].drooling,
                                          coatLength:
                                              snapshot.data![index].coatLength,
                                          goodWithStrangers: snapshot
                                              .data![index].goodWithStrangers,
                                          playfulness:
                                              snapshot.data![index].playfulness,
                                          protectiveness: snapshot
                                              .data![index].protectiveness,
                                          trainability: snapshot
                                              .data![index].trainability,
                                          energy: snapshot.data![index].energy,
                                          barking:
                                              snapshot.data![index].barking,
                                          minLifeExpectancy: snapshot
                                              .data![index].minLifeExpectancy,
                                          maxLifeExpectancy: snapshot
                                              .data![index].maxLifeExpectancy,
                                          maxHeightMale: snapshot
                                              .data![index].maxHeightMale,
                                          maxHeightFemale: snapshot
                                              .data![index].maxHeightFemale,
                                          maxWeightMale: snapshot
                                              .data![index].maxWeightMale,
                                          maxWeightFemale: snapshot
                                              .data![index].maxWeightFemale,
                                          minHeightMale: snapshot
                                              .data![index].minHeightMale,
                                          minHeightFemale: snapshot
                                              .data![index].minHeightFemale,
                                          minWeightMale: snapshot
                                              .data![index].minWeightMale,
                                          minWeightFemale: snapshot
                                              .data![index].minWeightFemale,
                                          name: snapshot.data![index].name)));
                            },
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  //gambar
                                  Image.network(
                                      snapshot.data![index].imageLink),
                                  SizedBox(height: 10),
                                  //text
                                  Text(snapshot.data![index].name),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextFormField(
        onFieldSubmitted: (value) => {
          setState(() {
            search = value;
          })
        },
        style: TextStyle(
          fontSize: 14,
        ),
        cursorColor: Color(0xffAD8B73),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search_outlined),
            hintText: 'Search for dog breeds',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
      ),
    );
  }

  Widget addButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Add Cocktail',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
