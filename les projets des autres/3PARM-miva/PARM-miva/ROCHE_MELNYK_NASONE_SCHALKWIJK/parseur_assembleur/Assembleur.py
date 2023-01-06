
import re #regex
import os
print("v2.0 raw")


# Convertit une chaine binaire en hexadecimal
def binToHex(n):
    return hex(int(n,2))#2 car n est represente en base2

#Convertir un entier en binaire
def intToBinary(n,nbBits):
    n=int(n)
    if(n<0): n=(2**nbBits)+n 
    n=bin(n)[2:].zfill(nbBits)
    return str(n[-nbBits:])

#Les codes d'instruction

shiftAddSub= "00"
dataProcessing = "010000"
loadStore = "1001"
stackPointer= "1011" #Miscellaneous, pour compiler du code depuis C aussi
Branch="1101"

#Definition simplifiant l'écriture 

def reg(n) :return intToBinary(n,3)
def imm3(n): return intToBinary(n,3)
def imm5(n): return intToBinary(n,5)
def imm7(n): return intToBinary(n,7)
def imm8(n): return intToBinary(n,8)
def imm11(n): return intToBinary(n,11)

#Les labels 
symbole = {"EQ":0,"NE":1,"CS":2,"HS":2,"CC":3,"LO":3,"MI":4,"PL":5,"VS":6,"VC":7,"HI":8,"LS":9,"GE":10,"LT":11,"GT":12,"LE":13,"AL":14}

count=0
i=0
lines = []
nosLabels={}


def lecture():
    global count,i,lines,nosLabels

    __location__ = os.path.realpath(os.path.join(os.getcwd(), os.path.dirname(__file__)))
    file = open(os.path.join(__location__,"codeAssembleur.txt"),"r") #ouvre en lecture
    lines = file.readlines()
    file.close()

    fichier =open(os.path.join(__location__,"instructionsHexa.txt"),"w")
    fichier.write("v2.0 raw \n")

    nouvellesLignes=[]

    for i in range(len(lines)):
        lines[i]=lines[i].upper() #On met tout en majuscule
        m=re.match(r"\s*@\w",lines[i]) #detecte les commentaires
        if(not m):nouvellesLignes.append(lines[i])
    lines=nouvellesLignes
    i=0

    while count<len(lines):
        ligne = lines[count]
        tmp=decodeInstruction(ligne)
        if(tmp!=""):
            i+=1
            tmp=binToHex(tmp)
            str = tmp[2:].zfill(4)
            print(str)
            fichier.write(str+" ")

        m=re.match(r"\s*\.([\w]+):(.*)",ligne)
        if(m): 
            nosLabels[m[1]]=i

        count+=1


def decodeInstruction(ligne):

    #shift, add, sub, mov
    m=re.match(r"\s*LSLS\s+R(?P<Rd>\d+),+\s+R(?P<Rm>\d+),+\s+#(?P<imm5>\d+)",ligne)
    if(m):return shiftAddSub+"000"+imm5(m[3])+reg(m[2])+reg(m[1])
        
    m=re.match(r"\s*LSRS\s+R(?P<Rd>\d+),+\s+R(?P<Rm>\d+),+\s+#(?P<imm5>\d+)",ligne)
    if(m): return shiftAddSub+"001"+imm5(m[3])+reg(m[2])+reg(m[1])

    m=re.match(r"\s*ASRS\s+R(?P<Rd>\d+),+\s+R(?P<Rm>\d+),+\s+#(?P<imm5>\d+)",ligne)
    if(m): return shiftAddSub+"010"+imm5(m[3])+reg(m[2])+reg(m[1])

    m=re.match(r"\s*ADDS\s+R(?P<Rd>\d+),+\s+R(?P<Rn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return shiftAddSub+"01100"+reg(m[3])+reg(m[2])+reg(m[1])

    m=re.match(r"\s*SUBS\s+R(?P<Rd>\d+),+\s+R(?P<Rn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return shiftAddSub+"01101"+reg(m[3])+reg(m[2])+reg(m[1])

    m=re.match(r"\s*ADDS\s+R(?P<Rd>\d+),+\s+R(?P<Rn>\d+),+\s+#(?P<imm3>\d+)",ligne)
    if(m): return shiftAddSub+"01110"+imm3(m[3])+reg(m[2])+reg(m[1])

    m=re.match(r"\s*ADDS\s+R(?P<Rd>\d+),+\s+#(?P<imm8>\d+)",ligne)
    if(m): return shiftAddSub+"110"+reg(m[1])+imm8(m[2])

    m=re.match(r"\s*SUBS\s+R(?P<Rd>\d+),+\s+R(?P<Rn>\d+),+\s+#(?P<imm3>\d+)",ligne)
    if(m): return shiftAddSub+"01111"+imm3(m[3])+reg(m[2])+reg(m[1])

    m=re.match(r"\s*MOVS\s+R(?P<Rd>\d+),+\s+#+(?P<imm8>\d+)",ligne)
    if(m): return shiftAddSub+"100"+reg(m[1])+imm8(m[2])

    m=re.match(r"\s*MOVS\s+R(?P<Rd>\d+),+\s+R(?P<imm5>\d+)",ligne) #MOVS du test calculator
    if(m): return shiftAddSub+"000"+imm5(0)+reg(m[2])+reg(m[1])
    
    m=re.match(r"\s*CMP\s+R(?P<Rd>\d+),+\s+#(?P<imm8>\d+)",ligne)
    if(m): return shiftAddSub+"101"+reg(m[1])+imm8(m[2])

    m=re.match(r"\s*ADDS\s+R(?P<Rdn>\d+),+\s+#(?P<imm8>\d+)",ligne)
    if(m): return shiftAddSub+"101"+reg(m[1])+imm8(m[2])

    m=re.match(r"\s*SUBS\s+R(?P<Rdn>\d+),+\s+#(?P<imm8>\d+)",ligne)
    if(m): return shiftAddSub+"111"+reg(m[1])+imm8(m[2])




    #data processing

    m=re.match(r"\s*ANDS\s+R(?P<Rdn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"0000"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*EORS\s+R(?P<Rdn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"0001"+reg(m[2])+reg(m[1])
    
    m=re.match(r"\s*LSLS\s+R(?P<Rdn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"0010"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*LSRS\s+R(?P<Rdn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"0011"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*ASRS\s+R(?P<Rdn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"0100"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*ADCS\s+R(?P<Rdn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"0101"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*SBCS\s+R(?P<Rdn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"0110"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*RORS\s+R(?P<Rdn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"0111"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*TST\s+R(?P<Rn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"1000"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*RSBS\s+R(?P<Rd>\d+),+\s+R(?P<Rn>\d+)",ligne)
    if(m): return dataProcessing+"1001"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*CMP\s+R(?P<Rn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"1010"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*CMN\s+R(?P<Rn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"1011"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*ORRS\s+R(?P<Rdn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"1100"+reg(m[2])+reg(m[1])

    m=re.match(r"\s*MULS\s+R(?P<Rdm>\d+),+\s+R(?P<Rn>\d+),+\s+R(?P<RdmBis>\d+)",ligne)
    if(m): return dataProcessing+"1101"+reg(m[2])+reg(m[1])
    
    m=re.match(r"\s*BICS\s+R(?P<Rdn>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"1110"+reg(m[2])+reg(m[1])
    
    m=re.match(r"\s*MVNS\s+R(?P<Rd>\d+),+\s+R(?P<Rm>\d+)",ligne)
    if(m): return dataProcessing+"1111"+reg(m[2])+reg(m[1])


    #Load et store

    m=re.match(r"\s*STR\s+R(?P<Rt>\d+),+\s*\[SP,+\s+#(?P<offset>\d+)",ligne)
    if(m): return loadStore+"0"+reg(m[1])+imm8(int(m[2])/4)

    m=re.match(r"\s*STR\s+R(?P<Rt>\d+),+\s*\[SP\]",ligne) #Cas ou offset pas précisé
    if(m): return loadStore+"0"+reg(m[1])+imm8(0)

    m=re.match(r"\s*LDR\s+R(?P<Rt>\d+),+\s*\[SP,+\s+#(?P<offset>\d+)",ligne) 
    if(m): return loadStore+"1"+reg(m[1])+imm8(int(m[2])/4)

    m=re.match(r"\s*LDR\s+R(?P<Rt>\d+),+\s*\[SP\]",ligne) #Cas ou offset pas précisé
    if(m): return loadStore+"1"+reg(m[1])+imm8(0)

    #Miscellaneous 

    m=re.match(r"\s*ADD\s+SP,\s+#(?P<offset>\d+)",ligne)
    if(m): return stackPointer+"00000"+imm7(int(m[1])/4)
    
    m=re.match(r"\s*SUB\s+SP,\s+#(?P<offset>\d+)",ligne)
    if(m): return stackPointer+"00001"+imm7(int(m[1])/4)

    #Branch

    m=re.match(r"\s*B+(?P<cond>[A-Z]{2})\s.(?P<label>([A-Z0-9_]*)+)",ligne)
    if(m): return Branch+cond(m[1])+intToBinary(label(m[2]),8)


    #Unconditionnal branch

    m=re.match(r"\s*B\s\.(?P<label>([\w])+)",ligne)
    if(m): return "11100"+imm11(label(m[1]))


    #par defaut
    return ""



def cond(n):
    tmp =int(symbole.get(n))
    return intToBinary(tmp,4)
 

def label(lab):
    global lines,nosLabels,i
  
    if(lab in nosLabels):return nosLabels[lab]-i-3 #On avait deja vu ce label avant

    j=count+1;offset=1

    while(j<len(lines)):
        ligne=lines[j]
        m=re.match(r"\s*\.+([\w]+\d)",ligne)

        if(m and m[1]==lab):break #Si la ligne actuelle indique le label qu'on recherche, on arrête
        
        if(not m): offset+=1 #Si on a pas de ligne indiquant un label, on consiere qu'on a une instruction
         
    
        j+=1
      
    nosLabels[lab]=i+offset #On stocke le nouveau label
    return offset-3

        

    #adresse absolue = adresse de base + offset








lecture()











