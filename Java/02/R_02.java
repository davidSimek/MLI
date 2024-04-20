import java.util.Scanner;
import java.util.Random;

public class R_02 {

    static String[] asciiDigits = {
          "  #  \n"
        + " ##  \n"
        + "# #  \n"
        + "  #  \n"
        + "  #  \n"
        + "#####",

          "  #  \n"
        + " # # \n"
        + "#  # \n"
        + "  #  \n"
        + " #   \n"
        + "#####",

          " ### \n"
        + "    #\n"
        + "  #  \n"
        + "    #\n"
        + "#   #\n"
        + " ### ",

          "  #  \n"
        + " ##  \n"
        + "# #  \n"
        + "# #  \n"
        + "#### \n"
        + "  #  ",

          "#####\n"
        + "#    \n"
        + "#### \n"
        + "    #\n"
        + "#   #\n"
        + " ### ",

          "  #  \n"
        + " #   \n"
        + "#### \n"
        + "#   #\n"
        + "#   #\n"
        + " ### "
    };

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random rnd = new Random();
        while (true) {
            System.out.println("Do you want to generate a random number? (y/n)");
            char userInput = sc.nextLine().charAt(0);
            
            if (userInput == 'n')
                break;
            if (userInput != 'y')
                continue;

            System.out.printf("Your digit is\n%s\n", asciiDigits[rnd.nextInt(6)]);
        }
    }
}
