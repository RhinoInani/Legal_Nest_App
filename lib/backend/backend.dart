import 'package:legal_nest/backend/user.dart';

Future<void> readData(int count) async {
  int counter = count;
  titles = List.generate(
    fireStoreSize,
    (index) => " ",
    growable: true,
  );
  description = List.generate(
    fireStoreSize,
    (index) => " ",
    growable: true,
  );
  videos = List.generate(
    fireStoreSize,
    (index) => " ",
    growable: true,
  );
  usernames = List.generate(
    fireStoreSize,
    (index) => " ",
    growable: true,
  );
  date = List.generate(
    fireStoreSize,
    (index) => DateTime.now(),
    growable: true,
  );
  supports = List.generate(
    fireStoreSize,
    (index) => index,
    growable: true,
  );
  await store.collection("posts").get().then((querySnapshot) {
    counter = 0;
    querySnapshot.docs.forEach((result) {
      // titles!.insert(counter, result.get("title"));
      titles![counter] = result.get("title");
      counter++;
    });
  });
  await store.collection("posts").get().then((querySnapshot) {
    counter = 0;
    querySnapshot.docs.forEach((result) {
      // description!.insert(counter, result.get("description"));
      description![counter] = result.get("description");
      counter++;
    });
  });
  await store.collection("posts").get().then((querySnapshot) {
    counter = 0;
    querySnapshot.docs.forEach((result) {
      // videos!.insert(counter, result.get("video"));
      videos![counter] = result.get("video");
      counter++;
    });
  });
  await store.collection("posts").get().then((querySnapshot) {
    int usernamesCounter = 0;
    counter = 0;
    querySnapshot.docs.forEach((result) {
      // usernames!.insert(counter, result.get("creator"));
      List<String>? test = List.generate(fireStoreSize, (index) => " ");
      test[counter] = result.get("creator");
      store.collection('users').doc('${test[counter]}').get().then((doc) {
        usernames![usernamesCounter] = doc.get("screenName");
        usernamesCounter++;
      });
      counter++;
    });
  });
  await store.collection("posts").get().then((querySnapshot) {
    counter = 0;
    querySnapshot.docs.forEach((result) {
      // date!.insert(counter, result.get("eventDate").toDate());
      date![counter] = result.get('eventDate').toDate();
      // print(date![counter].substring(0, date![counter].indexOf('at')).trim());
      counter++;
    });
  });
  await store.collection("posts").get().then((querySnapshot) {
    counter = 0;
    querySnapshot.docs.forEach((result) {
      // supports!.insert(counter, result.get("supports"));
      supports![counter] = result.get("supports");
      counter++;
    });
  });
}
