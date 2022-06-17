# encrypt function and output
def caesar_cipher(string, shift) 
    string = string.downcase
    array = string.split("")

    # make default values
    i = 0
    newArray = []
    asciiValue = nil

    array.each do |char|
        # shift if the character between these value
        if char.ord.between?(65, 90) || char.ord.between?(97, 122)
            asciiValue = char.ord
            asciiValue += shift
            # loop from z to a if the value will go outside of ascii alphabet range
            if asciiValue.between?(90, 96)
                newShift = asciiValue - 91
                asciiValue = 65 + newShift
            elsif asciiValue > 122
                newShift = asciiValue - 123
                asciiValue = 97 + newShift
            end
            # add shifted value to new array
            newArray[i] = asciiValue.chr
            i += 1
        else
            # add unchanged value to new array
            newArray[i] = char
            i += 1
        end
    end

    # convert from array to string
    newString = newArray.join()

    puts "Do you want to add reverse function? \"Y\" or \"N\" \n"
    answer = gets.chomp
    if answer == "Y" || answer == "y"
        puts newString.reverse
    else 
    puts newString
    end
    
    next_input()
end

# function for next encryption
def next_input()
    puts "Any more santence you would like to encrypt? \"Y\" or \"N\" \n"
    answer = gets.chomp

    # if user want to another encryption, run function again unless exit.
    if answer == "Y" || answer == "y"
        input()
    else
        exit
    end
end

# user input function
def input()
    puts "Type the sentence you would like to encrypt: \n"
    string = gets.chomp

    puts "How may times you would like to shift? \n"
    shift = gets.chomp.to_i

    caesar_cipher(string, shift)
end

input()
