import 'controllers/bank_controller.dart';
import 'exceptions/bank_controler_exceptions.dart';
import 'models/account.dart';

void main() {
  String? naoPodeSerNula;
  print(naoPodeSerNula.runtimeType);
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  // Account accountTest = Account(name: 'sds', balance: -200, isAuthenticated: true);
  bankController.addAccount(
      id: "Ricarth",
      account:
      Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
      Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    dynamic result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 50);
    // Observa {ndo resultado
    if(result) {
      // print("Transação realizada com sucesso!");
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print("O ID ${e.idSender} remetente não é válido");
  } on ReceiverIdInvalidExceptions catch(e) {
    print(e);
    print("O ID ${e.idReceiver} destinatário não é válido");
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
    print("O usuário remetente de ID ${e.idSender} não está autenticado!");
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print("O usuário de ID ${e.idSender} tentou enviar ${e.amount}, porém o saldo é de ${e.senderBalance}!");
  } on Exception {
    print("Ops!!! Algo deu errado.");
  }
}