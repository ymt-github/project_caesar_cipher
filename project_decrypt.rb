# decrypt function and output
def caesar_cipher(string, unShift) 
    string = string.downcase
    array = string.split("")

    # make default values
    i = 0
    newArray = []
    asciiValue = nil

    array.each do |char|
        # shift if the character between these value
        if char.ord.between?(97, 122)
            asciiValue = char.ord
            asciiValue -= unShift
            # loop from a to z if the value will go outside of ascii alphabet range
            if asciiValue.between?(65, 90)
                newUnShift = asciiValue + 26
                asciiValue = newUnShift + 0
            elsif asciiValue.between?(90, 96)
                newUnShift = asciiValue + 26
                asciiValue = newUnShift + 0
            end
            # add unshifted value to new array
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

    puts "Do you want to fix reversed function to normal? \"Y\" or \"N\" \n"
    answer = gets.chomp
    if answer == "Y" || answer == "y"
        puts newString.reverse
    else 
    puts newString
    end
    
    next_input()
end

# function for next decryption
def next_input()
    puts "Any more santence you would like to decrypt? \"Y\" or \"N\" \n"
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
    puts "Type the sentence you would like to decrypt: \n"
    string = gets.chomp

    puts "How may times you would like to unShift? \n"
    unShift = gets.chomp.to_i

    caesar_cipher(string, unShift)
end

input()
