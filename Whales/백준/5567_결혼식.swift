// 결혼식 초대: 친구, 친구의 친구
// 학번 1~n 상근이(1), 동기의 수 n(2< = n <= 500), 친구 관계 - 간선
func 결혼식() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var list = [[Int]](repeating: [Int](), count: n)
    
    for _ in 1...m {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let a = input[0] - 1
        let b = input[1] - 1
        
        list[a].append(b)
        list[b].append(a)
    }
    // list = [[1, 2], [0, 2], [0, 3, 1], [2, 4], [3], []]
    
    var invitation: Set<Int> = []
    
    for element in list[0] {
        invitation.insert(element)
      
        for friend in list[element] {
            if friend != 0 {
                invitation.insert(friend)
            }
        }
    }

    print(invitation.count)
}
