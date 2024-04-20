#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>

char ascii_digit[6][36] = {
    "  #  \n"
    " ##  \n"
    "# #  \n"
    "  #  \n"
    "  #  \n"
    "#####",

    "  #  \n"
    " # # \n"
    "#  # \n"
    "  #  \n"
    " #   \n"
    "#####",
    
    " ### \n"
    "    #\n"
    "  #  \n"
    "    #\n"
    "#   #\n"
    " ### ",

    "  #  \n"
    " ##  \n"
    "# #  \n"
    "# #  \n"
    "#### \n"
    "  #  ",

    "#####\n"
    "#    \n"
    "#### \n"
    "    #\n"
    "x   #\n"
    " ### ",
    
    "  #  \n"
    " #   \n"
    "#### \n"
    "#   #\n"
    "#   #\n"
    " ### "
};

int main(void) {
    srand(time(NULL));

    char user_input = 0;

    while (true) {
        printf("Do you want to roll a dice?(y/n): ");
        user_input = getc(stdin);
        puts("");
        char c;
        while((c = getc(stdin) != '\n') && c != EOF) {}

        if (user_input == 'n')
            break;
        if (user_input != 'y')
            continue;

        int roll = (rand() % 6);
        printf("Your number is :\n%s\n", ascii_digit[roll]);
    }
    return 0;
}
