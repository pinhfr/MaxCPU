import random
testFile = open("MemoryFile.txt", "w+")
for i in range(0, 100):
	nb = int(random.random()*(2**12))
	while((nb > 63 and nb < 128) or (nb > 3071 and nb < 3648) or (nb > 1279 and nb < 2048) or (nb > 2431 and nb < 3072) or nb > 3647): #no stop, no jump, no illegal operation
		nb = int(random.random()*(2**12))
	testFile.write(str(nb))
	testFile.write("\n")
nb = int(random.random()*(2**12))
#There could lack a parameter here. let's make sure this doesn't happen by adding a NOP
testFile.write("0")
testFile.write("\n")
testFile.write("64")