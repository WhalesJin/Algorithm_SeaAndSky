// 첫째 줄에 상근이가 가지고 있는 숫자 카드의 개수 N(1 ≤ N ≤ 500,000)이 주어진다.
// 둘째 줄에는 숫자 카드에 적혀있는 정수(-10,000,000 이상 10,000,000이하)가 주어진다. (중복 없음)
// 셋째 줄에는 M(1 ≤ M ≤ 500,000)이 주어진다.
// 넷째 줄에는 상근이가 가지고 있는 숫자 카드인지 아닌지를 구해야 할 M개의 정수정수(-10,000,000 이상 10,000,000이하)가 주어진다.

// 입력으로 주어진 M개의 수에 대해서, 각 수가 적힌 숫자 카드를 상근이가 가지고 있으면 1을, 아니면 0을 공백으로 구분해 출력한다.

// Set의 contains는 O(1) 118356KB 596ms
func 숫자카드() {
    let _ = Int(readLine()!)!
    let cards = Set(readLine()!.split(separator: " ").compactMap { Int($0) })
    let _ = Int(readLine()!)!
    var answer = ""
    readLine()!.split(separator: " ").compactMap { Int($0) }.forEach { answer += "\(cards.contains($0) ? 1 : 0) " }

    print(answer)
}

/*
// 이분탐색 113052KB 572ms
func 숫자카드() {
    let n = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
    let m = Int(readLine()!)!
    let tests = readLine()!.split(separator: " ").compactMap { Int($0) }
    var answer = ""
    
    for testNumber in tests {
        var st = 0
        var en = n - 1
        var mid = 0
 
        while true {
            mid = (st + en) / 2
            if testNumber == numbers[mid] {
                answer += "1 "
                break
            } else if testNumber < numbers[mid] {
                en = mid - 1
            } else {
                st = mid + 1
            }
            
            if st > en {
                answer += "0 "
                break
            }
        }
    }
    
    print(answer)
}
*/
