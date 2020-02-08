package cosc311hw5;

import java.util.Random;
/*
Parker Allen
COCS 311 HW5 11/1
https://github.com/ParkerAllen/COSC-311.git
*/
public class COSC311HW5 {
    
    public static Random r = new Random();
    
    //swap is marker for how many people have swapped queues
    //switched are the customers that have switched
    public static Customer[] switched;
    public static int stop, tic, swap;
    public static Server s1, s2;
    
    public static int getPoissonRandom(double mean) {        			
        double L = Math.exp(-mean);
        int k = 0;
        double p = 1.0;
        do {
            p = p * r.nextDouble();
            k++;
        } while (p > L);
        return k - 1;
    }
    
    // inserts customers to queue 2 then inserts customers to temp queue 
    // then from temp either queue 1 or if switch queues puts cusotmer in queue 2 
    //and new customer in queue 1 then adds to switched array
    public static void inCustomer(){
        CircularQueue temp = new CircularQueue();
        for(int i = getPoissonRandom(.25); 0 < i; i--)
            s2.q.insert(new Customer(2));
        for(int i = getPoissonRandom(.25); 0 < i; i--){
            temp.insert(new Customer(1));
            if(r.nextInt(2) == 1 && swap < 5){
                switched[swap] = new Customer(1);
                s1.q.insert(switched[swap]);
                temp.head.info.switchQu(2);
                switched[swap + 5] = temp.head.info;
                s2.q.insert(temp.delete());
                swap++;
            }
            else
                s1.q.insert(temp.delete());
        }
    }
    
    public static void main(String[] args) {
        s1 = new Server(1, new CircularQueue());
        s2 = new Server(2, new CircularQueue());
        switched = new Customer[10];
        tic = 1;        
        while(stop < 5){            
            inCustomer();
            System.out.println(tic);
            s1.update();
            s2.update();
            tic++;
        }
        for(int i = 0; i < 5; i++)
            System.out.println(switched[i + 5].display() + "\nWould have been " + switched[i].waitTime);
    }    
}