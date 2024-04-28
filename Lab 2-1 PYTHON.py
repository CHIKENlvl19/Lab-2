def is_prime(N):
    if N <= 1:
        return False

    for i in range(2, N // 2):
        if N % i == 0:
            return False

    return True


def nearest_prime(N):
    if is_prime(N):
        return N

    SmallerPrime = N - 1
    BiggerPrime = N + 1

    while True:
        if is_prime(SmallerPrime):
            return SmallerPrime
        elif is_prime(BiggerPrime):
            return BiggerPrime
        else:
            SmallerPrime -= 1
            BiggerPrime += 1


N = int(input("Enter a number: "))
N = N - nearest_prime(N)

if N < 0:
    print(N * -1)
else:
    print(N)