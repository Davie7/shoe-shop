import 'package:flutter/services.dart' as the_bundle;

import 'sneakers_model.dart';

// This class is used to fetch data from the json file and return it to the app.
class Helper{

  // mens sneakers
  Future<List<Sneakers>> getMaleSneakers() async{
    // load the content of the 'assets/json/men_shoes.json' as a string
    final data = await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');

    // parse the json data and return a list of string(done by the sneakersFromJson)
    final maleList = sneakersFromJson(data);

    return maleList;
  }

  // womens sneakers
  Future<List<Sneakers>> getFemaleSneakers() async{
    final data = await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');

    final femaleList = sneakersFromJson(data);

    return femaleList;
  }

  // kids sneakers
  Future<List<Sneakers>> getKidsSneakers() async{
    final data = await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');

    final kidsList = sneakersFromJson(data);

    return kidsList;
  }

  // one male sneaker
  Future<Sneakers> getMaleSneakerById(String id) async{
    final data = await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');

    final maleList = sneakersFromJson(data);

    // find the first element in the list that satisfies the following condition.
    // the condition is defined using a lambda function (sneaker) => sneaker.id == id, 
    //which checks if the id of the sneaker object matches the provided id argument.
    // The resulting sneaker object is assigned to the sneaker variable.
    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  // one female sneaker
  Future<Sneakers> getFemaleSneakerById(String id) async{
    final data = await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');

    final femaleList = sneakersFromJson(data);

    final sneaker = femaleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  // one kid's sneaker
  Future<Sneakers> getKidsSneakerById(String id) async{
    final data = await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');

    final kidsList = sneakersFromJson(data);

    final sneaker = kidsList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }
}