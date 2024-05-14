// 땅고르기 작업
// 1. (i, j)의 가장 위에 있는 블록을 제거하여 인벤토리에 넣는다. 2초
// 2. 인벤토리에서 블록 하나를 꺼내어 (i, j)의 가장 위에 놓는다. 1초
// 땅 (n * m) (1 <= n,m <= 500) 인벤토리 b(0 <= b <= 64,000,000)개

func 마인크래프트() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0], _ = input[1], b = input[2] // n: row, m: column
    var ground = [[Int]](repeating: [], count: n)
    var dict = [Int: Int]() // 땅높이: 개수
    
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        ground[i] = input
        
        for element in input {
            if let _ = dict[element] {
                dict[element]! += 1
            } else {
                dict[element] = 1
            }
        }
    }
    
    // inven개수가 256 이하면 걍 넣기
    // 개수가 필요 이상이면 걍 빼기
    
    let minGround = dict.keys.min()!
    let maxGround = dict.keys.max()!
    
    var height = 0
    var time = Int.max
    
    for standard in minGround...maxGround {
        var plusCount = 0
        var minusCount = 0
        
        for (key, value) in dict {
            let amount = key - standard
            
            if amount > 0 {
                plusCount += amount * value
            } else if amount < 0 {
                minusCount += -amount * value
            }
        }
        
        if plusCount + b >= minusCount {
            let currentTime = plusCount * 2 + minusCount
            if currentTime < time {
                time = currentTime
                height = standard
            } else if currentTime == time {
                height = max(standard, height)
            }
        }
        
    }
    
    print("\(time) \(height)")
}
