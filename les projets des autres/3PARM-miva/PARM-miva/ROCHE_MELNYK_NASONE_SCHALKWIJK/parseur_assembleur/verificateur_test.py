import os


def decoup(a_string):
    split_strings = []
    n  = 5
    for index in range(0, len(a_string), n):
        split_strings.append(a_string[index : index + n])
    return split_strings



def verif():

    __location__ = os.path.realpath(os.path.join(os.getcwd(), os.path.dirname(__file__)))
    file = open(os.path.join(__location__,"instructionsHexa.txt"),"r") #ouvre en lecture
    lines1 = file.readlines()
    file.close()

    file = open(os.path.join(__location__,"TEST_codeAttendu.txt"),"r") #ouvre en lecture
    lines2 = file.readlines()
    file.close()

    lines1=decoup(lines1[1])
    lines2=decoup(lines2[1])


    n = len(lines1) 
    k = len(lines2)

    print(n+1,k) #+1 car saut de ligne


    for q in range(n):
        if lines2[q] != lines1[q]:
            print("UneErreur a l'instructions num"+str(q)+"   "+ lines1[q]+lines2[q])

    print("fin")



verif()



