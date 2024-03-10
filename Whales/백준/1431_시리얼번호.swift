// 알파벳 대문자 (A-Z)와 숫자 (0-9)로 이루어진 시리얼 번호가 주어졌을 때, 정렬해서 출력하는 프로그램을 작성하시오.

// 시리얼번호 A가 시리얼번호 B의 앞에 오는 경우는 다음과 같다.
// 1. A와 B의 길이가 다르면, 짧은 것이 먼저 온다.
// 2. 만약 서로 길이가 같다면, A의 모든 자리수의 합과 B의 모든 자리수의 합을 비교해서 작은 합을 가지는 것이 먼저온다. (숫자인 것만 더한다)
// 3. 만약 1,2번 둘 조건으로도 비교할 수 없으면, 사전순으로 비교한다. 숫자가 알파벳보다 사전순으로 작다.

func 시리얼번호() {
    let n = Int(readLine()!)!
    var input: [(String, Int, Int)] = [] // [(문자, 길이, 숫자합)]
    
    for _ in 1...n {
        let string = readLine()!
        var sum = 0
        
        for char in string {
            if let number = Int(String(char)) {
                sum += number
            }
        }
        
        input.append((string, string.count, sum))
    }
    
    let serials = input.sorted {
        if $0.1 == $1.1 {
            if $0.2 == $1.2 {
                return $0.0 < $1.0
            }
            return $0.2 < $1.2
        }
        return $0.1 < $1.1
    }
    
    serials.forEach { print($0.0) }
}
