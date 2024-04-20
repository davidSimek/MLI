#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <limits>
#include <ostream>
#include <string>
#include <iostream>

std::string ascii_digits[6] = {
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
    std::srand(std::time(NULL));
    char user_input;

    while (true) {
        std::cout << "Do you want to generate random number? (y/n)" << std::endl;
        std::cin >> user_input;

        std::cin.clear();
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');

        if (user_input == 'n')
            break;
        if (user_input != 'y')
            continue;

        std::cout << "Your number is:" << std::endl << ascii_digits[(rand() % 6) + 1] << std::endl;
    }
}
