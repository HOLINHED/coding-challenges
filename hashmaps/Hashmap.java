import java.util.Map;
import java.util.HashMap;

class Hashmap {

   public static void main(String... args) {

      Map<String, BankAccount> accounts = new HashMap<>();

      accounts.put("John", new BankAccount(562.94));
      accounts.put("Charles", new BankAccount(63.99));
      accounts.put("Abby", new BankAccount(98.09));
      accounts.put("Becky", new BankAccount(1.42));
      accounts.put("Alex", new BankAccount(18274.98));
      accounts.put("Bill", new BankAccount(78.99));
      accounts.put("Reagan", new BankAccount());
      accounts.put("John", new BankAccount(99.25));

      System.out.println("========= Key Set =========");

      for (String key : accounts.keySet()) {
         System.out.println(key);
      }

      System.out.println("========= Entry Set =========");

      for (Map.Entry<String, BankAccount> e : accounts.entrySet()) {
         System.out.println(e);
      }

      System.out.println("========= Values =========");

      for (BankAccount val : accounts.values()) {
         System.out.println(val);
      }

      System.out.println("========= First Repeating =========");

      Map<Integer, Boolean> numbers = new HashMap<>();

      int[] nums = new int[] {6,8,4,0,9,7,1,2,2,5,8,9};

      for (int val : nums) {
         if (numbers.containsKey(val)) {
            System.out.println(val);
            return;
         } else {
            numbers.put(val, true);
         }
      }

   } 

}