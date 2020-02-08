package cosc311hw5;

public class CircularQueue {
    
    Node head, tail;
    public int size = 0;
    
    public class Node{
        
        public Customer info;
        public Node link;
        
        public Node(){
            info = null;
            link = null;
        }
        
        public Node(Customer i){
            info = i;
        }
    }
    
    public CircularQueue(){
        head = tail = null;
    }
    
    public void insert(Customer c){
        Node n = new Node(c);
        if(size == 0)
            head = n;
        else
            tail.link = n;
        tail = n;
        size++;
    }
    
    public Customer delete(){
        size--;        
        Customer temp = head.info;
        head = head.link;
        return temp;
    }
    
    public String display(){
        String rtn = "";
        Node curr = head;
        while(curr != null){
            curr.info.waitTime++;
            rtn += curr.info.display();
            curr = curr.link;
        }
        return rtn;
    }
}