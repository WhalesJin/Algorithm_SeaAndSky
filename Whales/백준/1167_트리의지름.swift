// 트리의 지름이란, 트리에서 임의의 두 점 사이의 거리 중 가장 긴 것을 말한다. 트리의 지름을 구하는 프로그램을 작성하시오.
/*
       1
     2/
     3
   3/
   4
 4/ \6
 2   5
 
 지름 = 2 + 3 + 6 = 11
 */

func 트리의지름() {
    let n = Int(readLine()!)!
    var table = [[(Int, Int)]](repeating: [], count: n+1)
    
    for _ in 1...n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        for j in 1..<input.count {
            if j % 2 == 1, input[j] != -1 {
                table[input[0]].append((input[j], input[j+1]))
            }
        }
    }
    
    // table = [[], [(3, 2)], [(4, 4)], [(1, 2), (4, 3)], [(2, 4), (3, 3), (5, 6)], [(4, 6)]]
    
    var visited = Array(repeating: 0, count: n+1) // false = 0, true = 1
    var maxLength: Int = 0
    var last: Int = 0
    
    func dfs(start: Int, length: Int) {
        visited[start] = 1
        
        if maxLength < length {
            maxLength = length
            last = start
        }
        
        for i in table[start] {
            if visited[i.0] == 0 {
                dfs(start: i.0, length: length + i.1)
            }
        }
    }
    
    dfs(start: 1, length: 0)
    visited = Array(repeating: 0, count: n+1)
    maxLength = 0
    dfs(start: last, length: 0)
    
    print(maxLength)
}
