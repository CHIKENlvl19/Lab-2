rods = 0
rings = input()

for i in range(10):
    W, R, B = False, False, False
    for j in range(1, len(rings), 2):
        if int(rings[j]) == i:
            if rings[j - 1] == 'W':
                W = True
            if rings[j - 1] == 'R':
                R = True
            if rings[j - 1] == 'B':
                B = True
    if W and R and B:
        rods += 1

print(rods)