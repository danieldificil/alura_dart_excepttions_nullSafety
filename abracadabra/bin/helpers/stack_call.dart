void stackStart() {
  print("Started main");
  functionOne();
  print("Finished main");
}

void functionOne() {
  print("started F01");
  try {
    functionTwo();
  }  catch (churros1, churros2) {
    print(churros1);
    print(churros2);
  } finally {
    print("CHEGOU O DISCO VOADOR");
  }
  print("Finished F01");
}

void functionTwo() {
  print("Started F02");
  for (int i = 1; i <= 5; i++){
    print(i);
    double amount = double.parse("Not a number");
  }
  print("Finished F02");
}