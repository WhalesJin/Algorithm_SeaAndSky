// 부배열의 합: 연속된 원소들의 합
// 두 배열의 부배열의 합이 t(-1,000,000,000 <= t <= 1,000,000,000)가 되는 경우의 수를 출력
// -1,000,000 <= 원소 <= 1,000,000

// 방향을 틀어서 합의 개수를 적어놓자 - dict
func 두배열의합() {
    let t = Int(readLine()!)!
    let n = Int(readLine()!)!
    let arr1 = readLine()!.split(separator: " ").compactMap { Int($0) }
    let m = Int(readLine()!)!
    let arr2 = readLine()!.split(separator: " ").compactMap { Int($0) }

    var dict1: [Int: Int] = [:]
    var dict2: [Int: Int] = [:]

    for i in 0..<n {
        var sum = 0

        for j in stride(from: i, to: n, by: 1) {
            sum += arr1[j]
            
            if dict1[sum] == nil {
                dict1[sum] = 1
            } else {
                dict1[sum]! += 1
            }
        }
    }

    for i in 0..<m {
        var sum = 0

        for j in stride(from: i, to: m, by: 1) {
            sum += arr2[j]
            
            if dict2[sum] == nil {
                dict2[sum] = 1
            } else {
                dict2[sum]! += 1
            }
        }
    }

    // dict1 = [1: 2, 2: 1, 3: 2, 4: 2, 5: 1, 6: 1, 7: 1]
    // dict2 = [1: 1, 2: 1, 3: 1, 4: 1, 5: 1, 6: 1]
    var count = 0

    for (sum1, count1) in dict1 {
        let sum2 = t - sum1 // 사실 이거 개수만 세면 되는데 흠
        
        if let count2 = dict2[sum2] {
            count += count1 * count2
        }
    }

    print(count)
}
