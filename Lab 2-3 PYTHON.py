def sum_of_digits(number):
    summ = 0

    while number != 0:
        digit = number % 10
        if digit % 3 == 0:
            summ += digit
        number //= 10
    return summ

def main():
    count_numbers = int(input())
    summ = 0

    for i in range(count_numbers):
        number = int(input())
        summ += sum_of_digits(number)

    print(summ)

main()
