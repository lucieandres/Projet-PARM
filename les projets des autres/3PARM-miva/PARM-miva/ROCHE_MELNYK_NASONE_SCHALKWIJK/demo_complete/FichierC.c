#include <parm.h>

//Code du programme C 

void run(){
    BEGIN();

    int k=0;

    //On fait le test d'une boucle, en incrémentant k jusqu'a 10
    while(k<10){
        k=k+1;
    }

    //On a k=10, on teste que le else s'effectue bien

    if(k<10){
        k=5;
    }
    else{
        k=6;
    }
   

  int logique = 100;
  int p=0;

//test d'un if, la condition est vraie
  if((logique-50)>=50){
      p=40;
      //test des multiplications
      p=p*80;
      p=10*35;
   
  }

//Soustraction donnant -1 en compléent à 1 en hexa, cela vaut ffffffff
  int soustraction = 50;
  soustraction = 50-51;
  
 
    END();
}