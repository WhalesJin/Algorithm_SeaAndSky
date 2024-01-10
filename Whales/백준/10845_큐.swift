// 정수를 저장하는 큐를 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.
//
// push X: 정수 X를 큐에 넣는 연산.
// pop: 큐에서 가장 앞에 있는 정수를 빼고, 그 수를 출력. 큐.isEmpty이면 -1 출력.
// size: 큐에 들어있는 정수의 개수를 출력.
// empty: 큐가 비어있으면 1, 아니면 0을 출력.
// front: 큐의 가장 앞에 있는 정수를, 큐.isEmpty이면 -1 출력.
// back: 큐의 가장 뒤에 있는 정수를, 큐.isEmpty이면 -1 출력.

import Foundation

// 배열 사용
func 큐() {
    let n = Int(readLine()!)!
    var queue: [Int] = []
    
    for _ in 1...n {
        let function = readLine()!.components(separatedBy: " ")
        
        switch function[0].prefix(2) {
        case "pu":
            queue.append(Int(function[1])!)
        case "po":
            print(queue.isEmpty ? -1 : queue.removeFirst())
        case "si":
            print(queue.count)
        case "em":
            print(queue.isEmpty ? 1 : 0)
        case "fr":
            print(queue.isEmpty ? -1 : queue[0])
        default:
            print(queue.isEmpty ? -1 : queue[queue.count - 1])
        }
    }
}

// 연결리스트 사용
func 큐() {
    var queue: [Int?] = Array(repeating: nil, count: 10000)
    var head: Int = 0
    var tail: Int = 0
    
    func push(_ x: Int) {
        queue[tail] = x
        tail += 1
    }
    
    func pop() -> Int {
        if head == tail {
            return -1
        }
        
        let first: Int? = queue[head]
        head += 1
        
        return first ?? -1
    }
    
    func size() -> Int {
        return tail - head
    }
    
    func empty() -> Int {
        return head == tail ? 1 : 0
    }
    
    func front() -> Int {
        return queue[head] ?? -1
    }
    
    func back() -> Int {
        return (head != tail) ? (queue[tail - 1] ?? -1) : -1
    }
    
    let n: Int = Int(readLine()!)!
    
    for _ in 1...n {
        let input: [String] = readLine()!.components(separatedBy: " ").map { String($0) }
        let functionName: String = input[0]
        
        switch functionName {
        case "push":
            push(Int(input[1])!)
        case "pop":
            print(pop())
        case "size":
            print(size())
        case "empty":
            print(empty())
        case "front":
            print(front())
        case "back":
            print(back())
        default:
            print("error")
        }
    }
}
