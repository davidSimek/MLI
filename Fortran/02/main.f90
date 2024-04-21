program main
    implicit none

    character :: c
    character(len=36) :: asciiString
    character(len=36), dimension(6) :: asciiDigits
    asciiDigits(1) = "" // &
        "  #  " // new_line("A") // &
        " ##  " // new_line("A") // &
        "# #  " // new_line("A") // &
        "  #  " // new_line("A") // &
        "  #  " // new_line("A") // &
        "#####"
    asciiDigits(2) = "" // &
        " ### " // new_line("A") // &
        "#   #" // new_line("A") // &
        "#  # " // new_line("A") // &
        "  #  " // new_line("A") // &
        " #   " // new_line("A") // &
        "#####"
   asciiDigits(3) = "" // &
        " ### " // new_line("A") // &
        "#   #" // new_line("A") // &
        "   # " // new_line("A") // &
        "    #" // new_line("A") // &
        "#   #" // new_line("A") // &
        " ### "
   asciiDigits(4) = "" // &
        "   # " // new_line("A") // &
        "  ## " // new_line("A") // &
        " # # " // new_line("A") // &
        "#####" // new_line("A") // &
        "   # " // new_line("A") // &
        "   # "
   asciiDigits(5) = "" // &
        "#####" // new_line("A") // &
        "#    " // new_line("A") // &
        "#### " // new_line("A") // &
        "    #" // new_line("A") // &
        "#   #" // new_line("A") // &
        " ### "
   asciiDigits(6) = "" // &
        "  #  " // new_line("A") // &
        " #   " // new_line("A") // &
        "#### " // new_line("A") // &
        "#   #" // new_line("A") // &
        "#   #" // new_line("A") // &
        " ### "

    do
        print "(a)", "Do you want to get random number? (y/n)"
        read(*, "(A1)") c
        if (c == 'y') then
            asciiString = randomStringAscii()
            print *, "Your number is: ", new_line("A") , trim(asciiString)
        else if (c == 'n') then
            exit;
        end if
    end do

    contains

        function randomStringAscii() result(res)
            implicit none

            character(len=36) :: res
            real :: r
            integer :: randInt

            call random_seed()
            call random_number(r)
            randInt = int(r * 6) + 1
            res = asciiDigits(randInt)

 end function randomStringAscii

end program main
