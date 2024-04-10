// 컴퓨터의 수와 네트워크 상에서 서로 연결되어 있는 정보가 주어질 때, 1번 컴퓨터를 통해 웜 바이러스에 걸리게 되는 컴퓨터의 수를 출력하시오.

func 바이러스() {
    let n = Int(readLine()!)! // 컴퓨터 수
    let m = Int(readLine()!)! // 쌍의 수
    var list = [[Int]](repeating: [Int](), count: n)
    
    for _ in 0..<m { // 1...m 으로 해서 계속 런타임에러 *주의*
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let a = input[0] - 1
        let b = input[1] - 1
        
        list[a].append(b)
        list[b].append(a)
    }
    
    // list = [[1, 4], [0, 2, 4], [1], [6], [0, 1, 5], [4], [3]]
    
    var virusCom = [Int]()
    virus(from: 0)
    
    func virus(from a: Int) {
        if virusCom.contains(a) { return }
        
        virusCom.append(a)
        
        for element in list[a] {
            virus(from: element)
        }
    }
    
    print(virusCom.count - 1)
}
