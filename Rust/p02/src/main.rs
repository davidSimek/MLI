//! Simple program that asks if you want to generate random number. If so, it prints ascii art of random digit."

use std::io::{self};
use rand::Rng;

const ASCII_DIGITS: &'static[&'static str] = &[
    "|  #  \n\
    | ##  \n\
    |# #  \n\
    |  #  \n\
    |  #  \n\
    |#####",

    "|  #  \n\
    | # # \n\
    |#  # \n\
    |  #  \n\
    | #   \n\
    |#####",
    
    "| ### \n\
    |#   #\n\
    |   # \n\
    |    #\n\
    |#   #\n\
    | ### ",

    "|  #  \n\
    | ##  \n\
    |# #  \n\
    |# #  \n\
    |#### \n\
    |  #  ",

    "|#####\n\
    |#    \n\
    |#### \n\
    |    #\n\
    |x   #\n\
    | ### ",
    
    "|  #  \n\
    | #   \n\
    |#### \n\
    |#   #\n\
    |#   #\n\
    | ### "
];

fn main() {
    let mut rng = rand::thread_rng();
    loop {
        println!("Do you want to generate random number? (y/n)");
        let mut input = String::new();
        io::stdin().read_line(&mut input).unwrap();
        let character = input.chars().next().unwrap();

        if character == 'y' {
            println!("your number is:\n{}", ASCII_DIGITS[rng.gen_range(0..=5)]);
            continue;
        }
        if character == 'n' {
            break;
        }
    }
}
