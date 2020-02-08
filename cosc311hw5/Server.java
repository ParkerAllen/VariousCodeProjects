package cosc311hw5;

public class Server extends COSC311HW5{
    
    public int num, wait = 0;
    public CircularQueue q;
    public Customer c;

    public Server(int n, CircularQueue cq){
        num = n;
        q = cq;
    }

    //tests if server is empty, run compare and puts in first customer from queue 
    public void isEmpty(){
        if(wait < 0 && q.size > 0){
            c = q.delete();
            wait = r.nextInt(6) + 1;
            System.out.println("tic " + tic + " server " + num + " start on " + c.display());
        }
    }

    //tests when server is done with customer and deletes them
    //and if the customer had changed queue decrement stop counter
    public void finish(){
        if(wait == 0 && c != null){
            System.out.println("tic " + tic + " server " + num + " end on " + c.display());
            if(num == 2 && c.ogQu == 1)
                stop++;
            c = null;
        }
    }
    
    //tests if server is busy or idle
    public String isBusy(){
        String s = "busy\n";
        if(c == null)
            s = "idle\n";
        return s;        
    }
    
    public void display(){
        System.out.println("Queue " + num + " size:" + q.size + " Server " + num + ":" + isBusy() + q.display());     
    }
    
    //uncomment q.display and comment this.diplay for only server activity
    public void update(){
        this.finish();
        this.display();
        //q.display();
        this.isEmpty();
        System.out.println("");
        wait--;
    }
}