// -2^62 이상, 2^62 이하인 정수가 적혀있는 숫자 카드 N장 중
// 가장 많이 가지고 있는 정수를 구하는 프로그램을 작성하시오.
// (만약, 가장 많이 가지고 있는 정수가 여러 가지라면, 작은 것을 출력한다.)

func 카드() {
    let n = Int(readLine()!)!
    var cards: [Int: Int] = [:]
    var card = 0
    
    for _ in 1...n {
        card = Int(readLine()!)!
        
        // if cards.keys.contains(where: { $0 == card }) { -> O(n)
        if cards[card] != nil {
            cards[card]! += 1
        } else {
            cards[card] = 1
        }
    }
    // cards = [1: 3, 2: 2]
    
//    1. print(cards.filter { $0.value == cards.values.max()! }.keys.min()!) // 시간초과

    
//    2. 88ms
//    let result = cards.sorted {
//        if $0.value == $1.value {
//            return $0.key < $1.key
//        }
//        return $0.value > $1.value
//    }[0].key
//
//    print(result)
    
    // 3. 80ms
    var minCard = card
    var maxCount = cards[card]!
    
    for (card, count) in cards {
        if count > maxCount || (count == maxCount && card < minCard) {
            maxCount = count
            minCard = card
        }
    }
    
    print(minCard)
}
