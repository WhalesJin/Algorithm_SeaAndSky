//         7
//       3   8
//     8   1   0
//   2   7   4   4
// 4   5   2   6   5
// 위 그림은 크기가 5인 정수 삼각형의 한 모습이다.
//
// 맨 위층 7부터 시작해서 아래에 있는 수 중 하나를 선택하여 아래층으로 내려올 때, 이제까지 선택된 수의 합의 최댓값을 구하라.
// 아래층에 있는 수는 현재 층에서 선택된 수의 대각선  왼쪽 또는 대각선 오른쪽에 있는 것 중에서만 선택할 수 있다.

func 정수삼각형() {
    // 테이블 정의
    // 점화식
    // 초기값 f(1) = triangle[0][0], f(2) = triangle[0][0] + max(triangle[1][0], triangle[1][1])
    
    let n = Int(readLine()!)!
    var triangle: [[Int]] = []
    
    for _ in 1...n {
        let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
        
        triangle.append(numbers)
    }
    // triangle = [[7], [3, 8], [8, 1, 0], [2, 7, 4, 4], [4, 5, 2, 6, 5]]
    
    var dp = triangle
    
    if n > 1 {
        dp[1][0] += dp[0][0]
        dp[1][1] += dp[0][0]
    }
    
    for i in stride(from: 2, to: n, by: 1) {
        dp[i][0] += dp[i-1][0]
        
        for j in 1..<i {
            dp[i][j] += max(dp[i-1][j-1], dp[i-1][j])
        }
        
        dp[i][i] += dp[i-1][i-1]
    }
    
    // dp = [[7], [10, 15], [18, 16, 15], [20, 25, 20, 19], [24, 30, 27, 26, 24]]
    
    print(dp[n-1].max() ?? 0)
}
