abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    balance -= amount;
    balance += balance * interestRate;
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
    } else {
      print("Insufficient funds");
    }
  }
}

void main() {
  SavingsAccount savingsAccount = SavingsAccount(01631223602, 40000.0, 0.05);
  print("Initial balance in Savings Account: \$${savingsAccount.balance}");
  savingsAccount.deposit(5000.0);
  print("Balance after deposit: \$${savingsAccount.balance}");
  savingsAccount.withdraw(2000.0);
  print("Balance after withdrawal: \$${savingsAccount.balance}");

  CurrentAccount currentAccount = CurrentAccount(54321, 2000.0, 1000.0);
  print("\nInitial balance in Current Account: \$${currentAccount.balance}");
  currentAccount.deposit(8000.0);
  print("Balance after deposit: \$${currentAccount.balance}");
  currentAccount.withdraw(3000.0);
  print("Balance after withdrawal: \$${currentAccount.balance}");
}
