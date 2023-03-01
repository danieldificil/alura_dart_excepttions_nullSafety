import 'controllers/bank_controller.dart';
import 'models/account.dart';

void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
      Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
      Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  dynamic result = bankController.makeTransfer(
      idSender: "Kako", idReceiver: "Ricarth", amount: 50);

  // Observando resultado
  print(result);
}

// void main() {
//   try{
//     testFunction();
//   } on Exception catch (e){
//     print(e.runtimeType);
//   }
// }
//
// void testFunction() {
//   throw Account(name: 'Xunda', balance: 100, isAuthenticated: true);
// }