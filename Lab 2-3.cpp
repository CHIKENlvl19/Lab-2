#include<iostream>
using namespace std;

int SummOfDidigts(int number)
{
    int summ = 0; 

    while (number != 0)
    {
        int digit = number % 10;
        if (digit % 3 == 0)
            summ += digit;
        number /= 10;
    }
    return summ;
}

int main()
{
    int number, count_numbers, summ = 0;
    cin >> count_numbers; // вводим количество чисел

    for(int i = 0; i < count_numbers; i++) // цикл, который сработает count_numbers-раз
    {
        cin >> number; // считываем число
        summ += SummOfDidigts(number); // прибавляем к итоговой сумме результат работы функции, возвращающей сумму всех кратных 3 цифр числа 
    }

    cout << summ;
}