
#!/bin/bash

# Function to check input validity 
# Function to check input validity
# Function to check input validity
# Function to check input validity
# Function to check input validity
# Function to check input validity
# Function to check input validity
# Function to check input validity
# Function to check input validity
# Function to check input validity
# Function to check input validity
# Function to check input validity
# Function to check input validity
# Function to check input validity

validate() {
    local num_str=$1

    # is input numeric and 4 digits long
    if [[ ! "$num_str" =~ ^[0-9]{4}$ ]]; then
        echo " Error The number must be 4 digits."
        exit 1
    fi

    if [[ ${num_str:0:1} == ${num_str:1:1} && ${num_str:1:1} == ${num_str:2:1} && ${num_str:2:1} == ${num_str:3:1} ]]; then
        echo " Error All digits are identical."
        exit 1
    fi
	
}

# Function to sort digits using Bubble Sort

sortin() {
    local num_str=$1
    local order=$2  # "asc" or "desc"
    local -a digits
    local i j temp

    # Convert number to array of digits
    for ((i = 0; i < 4; i++)); do
        digits[i]=${num_str:i:1}
    done

    for ((i = 0; i < 3; i++)); do
        for ((j = 0; j < 3 - i; j++)); do
            if [[ ("$order" == "asc" && ${digits[j]} -gt ${digits[j+1]}) || 
                  ("$order" == "desc" && ${digits[j]} -lt ${digits[j+1]}) ]]; then 
                temp=${digits[j]}
                digits[j]=${digits[j+1]}
                digits[j+1]=$temp
            fi
        done
    done

    echo "${digits[0]}${digits[1]}${digits[2]}${digits[3]}"
}

# take input
read -p " Enter a 4-digit number " num

validate "$num"

echo " Kaprekar's Routine for $num"

i=0 
while [[ "$num" -ne 6174 ]]; do
    high=$(sortin "$(printf "%04d" "$num")" "desc")
    low=$(sortin "$(printf "%04d" "$num")" "asc")
    i=$((i+1))
    num=$((10#$high -10#$low))
    echo $num
    echo $i

done

echo "Kaprekar's constant 6174 reached!"
echo "reached in $i iterations"
