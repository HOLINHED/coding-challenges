import java.net.InetSocketAddress;
import java.net.Socket;

public class Runner {

   /**
    * Make a program that scans an ip for open ports within a certain range. Please don't use this malicious purposes...
    * I AM NOT RESPONSIBLE FOR ANYTHING THAT HAPPENS FROM USE OF THIS PROGRAM! I SOULDN'T HAVE TO SAY THIS, BUT DON'T
    * DO STUPID STUFF!
    *
    * @param args [0] is the IP to check 
    *             [1] is the lower bound port 
    *             [2] is the upperboard port
    *             [3] is the timeout for the check. OPTIONAL!
    */

    public static void main(String... args) {

        // Ends ends program if not enough arguments
        if (args.length < 3) {
           System.out.println("USAGE: java Runner <ip> <start> <end> <?timeout>");
           return;
        }

        // Gets arguments and sets
        final String ip = args[0];
        final int portStart = Integer.parseInt(args[1]);
        final int portEnd = Integer.parseInt(args[2]);
        final int timeout = args.length == 4 ? Integer.parseInt(args[3]) : 500;

        // Loops through range of ports
        for (int port = portStart; port <= portEnd; port++) {
           System.out.print("checking " + port);
           // If can't connect, it will throw an exception.
            try {
                Socket socket = new Socket();

                // Attempt connection
                socket.connect(new InetSocketAddress(ip, port), timeout);

                // close connection if successful
                socket.close();

                // Print out port that was open.
                System.out.print("   OPEN! [" + ip + ":" + port + "]");
            } catch (Exception e) { }

            // Line break to keep things tidy
            System.out.print("\n");
       }

    }

}
