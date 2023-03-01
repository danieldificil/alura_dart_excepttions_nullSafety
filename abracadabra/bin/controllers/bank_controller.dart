import '../exceptions/bank_controler_exceptions.dart';
import '../models/account.dart';

class BankController {
  final Map<String, Account> _database = {};

  addAccount({required String id, required Account account}) {
    _database[id] = account;
  }

  Object makeTransfer(
      {required String idSender,
      required String idReceiver,
      required double amount}) {
    // Verificar se ID de remetente é válido
    if (!verifyId(idSender)) {
      throw SenderIdInvalidExceptions();
    }

    // Verificar se ID de destinatário é válido
    if (!verifyId(idReceiver)) {
      throw ReceiverIdInvalidExceptions();
    }

    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    // Verificar se o remetente está autenticado
    if (!accountSender.isAuthenticated) {
      throw SenderNotAuthenticated();
    }

    // Verificar se o remetente possui saldo suficiente
    if (accountSender.balance < amount) {
      throw SenderBalanceLowerAmountException();
    }

    // Se tudo estiver certo, efetivar transação
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }

  bool verifyId(String id) {
    return _database.containsKey(id);
  }
}
