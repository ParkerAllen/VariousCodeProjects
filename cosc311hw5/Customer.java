package cosc311hw5;

public class Customer {
    
    public int id, waitTime, ogQu, currQu;
    private static int count;
    
    public Customer(int q){
        id = count;
        waitTime = -1;
        count++;
        ogQu = currQu = q;
    }
    
    //if customer changes queue, changes currQu to new queue
    public void switchQu(int i){
        currQu = i;
    }
    
    public String display(){
        return "ID:" + id + " wait:" + waitTime + " Original Queue:" + ogQu + " Current Queue:" + currQu + "\t";
    }
}