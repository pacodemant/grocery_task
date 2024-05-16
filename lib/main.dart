//cp - Importiert das Firebase Core-Paket, das die Kernfunktionalität von Firebase bereitstellt.
import 'package:firebase_core/firebase_core.dart';

//cp - Importiert das Flutter Material-Paket, das Material Design-Widgets bereitstellt.
import 'package:flutter/material.dart';

//cp - Importiert das App-Widget, das die Haupt-App darstellt.
import 'package:grocery_task/app.dart';

//cp - Importiert die Firebase-Optionen, die für die Initialisierung von Firebase verwendet werden.
import 'package:grocery_task/firebase_options.dart';


//cp - Importiert das ProductsRepository, das für die Interaktion mit der Firestore-Datenbank verantwortlich ist.
import 'package:grocery_task/home/repository/products_repository.dart';

//cp - Die Hauptfunktion der App. Sie wird beim Start der App aufgerufen.
void main() async{
  //cp - Stellt sicher, dass die Flutter-Widgets initialisiert sind, bevor Firebase initialisiert wird.
  WidgetsFlutterBinding.ensureInitialized();

  //cp - Initialisiert Firebase mit den bereitgestellten Optionen aus DefaultFirebaseOptions.currentPlatform.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //cp - Erstellt ein neues ProductsRepository, das für die Interaktion mit der Firestore-Datenbank verwendet wird.
  final productsRepository = ProductsRepository();

  //cp - Fügt die Produkte aus productsMock zur Firestore-Datenbank hinzu.
  await productsRepository.addProducts(productsMock);

  //cp - Startet die App, indem das App-Widget ausgeführt wird.
  runApp(const App());
}