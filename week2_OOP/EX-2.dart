class BankAccount {
    // TODO
    int accId;
    String accOwner;
    double accBalance;

    BankAccount(this.accId, this.accOwner, [this.accBalance = 0]);

    double balance () => accBalance;

    void withdraw (double amount) {
      if (amount <= 0) throw Exception('Withdrawal amount must be positive');
      if(accBalance-amount<0) throw Exception('Insufficient balance for withdrawal');
      accBalance -= amount;
      print ('withdraw successfully');
    }

    void credit (double amount) {
      accBalance += amount;
      print('amount credited');
    }


}

class Bank {
    // TODO
    String name;
    List<BankAccount> accounts = [];

    Bank ({required this.name});

    BankAccount createAccount (int accId, String accOwner, [double initialBalance = 0]) {
      bool exists = accounts.any((acc) => acc.accId == accId);
      if (exists) throw Exception('Account with ID $accId already exists!');

      var newAccount = BankAccount(accId, accOwner, initialBalance);
      accounts.add(newAccount); 

      print('Account created');
      return newAccount;
    }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');
  print('Balance: ${ronanAccount.balance()}'); // Balance: $0
  ronanAccount.credit(100);
  print('Balance: ${ronanAccount.balance()}'); // Balance: $100
  ronanAccount.withdraw(50);
  print('Balance: ${ronanAccount.balance()}'); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
