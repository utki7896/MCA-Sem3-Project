import 'package:cloud_firestore/cloud_firestore.dart';
import '../global/global.dart';




seperateOrdersItemIDs(orderIds)
{
  List<String> seperateItemIDsList = [], defaultItemList = [];
  int i = 0;

  defaultItemList = List<String>.from(orderIds);

  for(i; i<defaultItemList.length; i++)
  {

    String item = defaultItemList[i].toString();
    var pos =item.lastIndexOf(":");


    String getItemId = (pos != -1) ? item.substring(0, pos) : item;

    print("\nThis is itemID now =" + getItemId);

    seperateItemIDsList.add(getItemId);
  }

  print("\nThis is Items List now =");
  print(seperateItemIDsList);

  return seperateItemIDsList;
}

seperateItemIDs()
{
  List<String> seperateItemIDsList = [], defaultItemList = [];
  int i = 0;

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for(i; i<defaultItemList.length; i++)
  {

    String item = defaultItemList[i].toString();
    var pos =item.lastIndexOf(":");


    String getItemId = (pos != -1) ? item.substring(0, pos) : item;

    print("\nThis is itemID now =" + getItemId);

    seperateItemIDsList.add(getItemId);
  }

  print("\nThis is Items List now =");
  print(seperateItemIDsList);

  return seperateItemIDsList;
}




seperateOrderItemQuantities(orderIDs)
{
  List<String> seperateItemQuantityList = [];
  List<String> defaultItemList = [];
  int i = 1;

  defaultItemList = List<String>.from(orderIDs);

  for(i; i<defaultItemList.length; i++)
  {

    String item = defaultItemList[i].toString();





    List<String> listItemCharacters = item.split(":").toList();


    var quanNumber = int.parse(listItemCharacters[1].toString());

    print("\nThis is Quantity now =" + quanNumber.toString());

    seperateItemQuantityList.add(quanNumber.toString());
  }

  print("\nThis is Items Quantity List now =");
  print(seperateItemQuantityList);

  return seperateItemQuantityList;
}

seperateItemQuantities()
{
  List<int> seperateItemQuantityList = [];
  List<String> defaultItemList = [];
  int i = 1;

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for(i; i<defaultItemList.length; i++)
  {

    String item = defaultItemList[i].toString();





    List<String> listItemCharacters = item.split(":").toList();


    var quanNumber = int.parse(listItemCharacters[1].toString());

    print("\nThis is Quantity now =" + quanNumber.toString());

    seperateItemQuantityList.add(quanNumber);
  }

  print("\nThis is Items Quantity List now =");
  print(seperateItemQuantityList);

  return seperateItemQuantityList;
}

clearCartNow(context)
{
  sharedPreferences!.setStringList("userCart", ['garbageValue']);
  List<String>? emptyList = sharedPreferences!.getStringList("userCart");
  
  FirebaseFirestore.instance
      .collection("users")
      .doc(firebaseAuth.currentUser!.uid)
      .update({"userCart": emptyList}).then((value)
    {
      sharedPreferences!.setStringList("userCart", emptyList!);
    });
}