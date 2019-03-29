public class BankAccount implements Comparable<BankAccount> {

   private double balance;

   public BankAccount(double balance) {
      this.balance = balance;
   }

   public BankAccount() {
      this(0.0);
   }

   public void add(double amount) {
      balance += amount;
   }

   public void subtract(double amount) {
      balance -= amount;
   }

   public double getBalance() {
      return balance;
   }

   @Override
   public int compareTo(BankAccount o) {
      return balance - o.getBalance();
   }

   @Override
   public String toString() {
      return "Balance: $" + balance;
   }

}