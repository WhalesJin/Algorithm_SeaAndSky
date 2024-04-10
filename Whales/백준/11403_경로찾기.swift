// 가중치 없는 방향 그래프 G가 주어졌을 때, 모든 정점 (i, j)에 대해서, i에서 j로 가는 길이가 양수인 경로가 있는지 없는지 구하시오.
// 정점의 개수 N (1 ≤ N ≤ 100). 그래프의 인접 행렬(i번째 줄의 i번째 숫자는 항상 0)

// 메모리초과 8번 하하
func 경로찾기() {
    let n = Int(readLine()!)!
    var matrix = [[Int]]()
    
    for _ in 0..<n {
        matrix.append(readLine()!.split(separator: " ").compactMap { Int($0) })
    }
//    matrix = [[0, 0, 0, 1, 0, 0, 0],
//              [0, 0, 0, 0, 0, 0, 1],
//              [0, 0, 0, 0, 0, 0, 0],
//              [0, 0, 0, 0, 1, 1, 0],
//              [1, 0, 0, 0, 0, 0, 0],
//              [0, 0, 0, 0, 0, 0, 1],
//              [0, 0, 1, 0, 0, 0, 0]]
  
    var resert = [[Int]](repeating: [Int](repeating: 0, count: n), count: n) // 불가능 0, 가능 1
    var visited = [Bool](repeating: false, count: n)

    for i in 0..<n {
        check(i, i)
        visited = [Bool](repeating: false, count: n)
    }

    for row in resert {
        var answer = ""
        row.forEach { answer += "\($0) " }
        print(answer)
    }
    
    func check(_ start: Int, _ a: Int) { // start는 시작, a는 경유, matrix[i][i] = 0
        for k in 0..<n {
            if matrix[a][k] == 1 && !visited[k] { // 인접한 경우 경로 ok
                resert[start][k] = 1
                visited[k] = true
                check(start, k)
            }
        }
    }
}
