// 연결리스트로 Deque 구현하기

class MyCircularDeque {
    class Node {
        var data: Int
        var prev: Node?
        var next: Node?
        
        init(data: Int, prev: Node? = nil, next: Node? = nil) {
            self.data = data
            self.prev = prev
            self.next = next
        }
    }
    
    var head: Node?
    var tail: Node?
    var k: Int
    var size: Int = 0

    init(_ k: Int) {
        self.k = k
    }
    
    func insertFront(_ value: Int) -> Bool {
        if size >= k {
            return false
        }
        
        let newNode = Node(data: value)
        
        if head == nil, tail == nil {
            head = newNode
            tail = head
            size += 1
            
            return true
        }
        
        head?.prev = newNode
        newNode.next = head
        head = newNode
        size += 1
        
        return true
    }
    
    func insertLast(_ value: Int) -> Bool {
        if size >= k {
            return false
        }
        
        let newNode = Node(data: value)
        
        if head == nil, tail == nil {
            head = newNode
            tail = head
            size += 1
            
            return true
        }
        
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
        size += 1
        
        return true
    }
    
    func deleteFront() -> Bool {
        if size == 0 {
            return false
        }
        
        if size == 1 { // head == tail
            head = nil
            tail = nil
            size = 0
            
            return true
        }
        
        head?.next?.prev = nil
        head = head?.next
        size -= 1
        
        return true
    }
    
    func deleteLast() -> Bool {
        if size == 0 {
            return false
        }
        
        if size == 1 { // head == tail
            head = nil
            tail = nil
            size = 0
            
            return true
        }
        
        tail?.prev?.next = nil
        tail = tail?.prev
        size -= 1
        
        return true
    }
    
    func getFront() -> Int {
        return head?.data ?? -1
    }
    
    func getRear() -> Int {
        return tail?.data ?? -1
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func isFull() -> Bool {
        return size == k
    }
}
