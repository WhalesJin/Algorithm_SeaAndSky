// 진실을 아는 사람이 없는 파티 수. 진실을 아는 사람을 체크하는 그래프가 필요해
// 사람의 번호는 1~N

func 거짓말2() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0], p = input[1] // 사람수, 파티수
    let truth = readLine()!.split(separator: " ").compactMap { Int($0) }
    let truthCount = truth[0]
    var knowSet = Set<Int>()
    var unknowSet = Set<Int>(1...n)
    
    for i in stride(from: 1, through: truthCount, by: 1) {
        knowSet.insert(truth[i])
        unknowSet.remove(truth[i])
    }

    var parties = [Set<Int>]()

    for _ in 1...p {
        let party = readLine()!.split(separator: " ").compactMap { Int($0) }
        let count = party[0]
        let people = Set(party[1...count])
        
        if knowSet.intersection(people).isEmpty {
            parties.append(people)
        } else {
            knowSet = knowSet.union(people)
            unknowSet = unknowSet.subtracting(people)
        }
    }
    
    var queue = knowSet
    
    while !queue.isEmpty {
        let person = queue.removeFirst()
        
        for i in stride(from: parties.count-1, through: 0, by: -1) {
            let inParty = parties[i]
            
            if inParty.contains(person) {
                queue = queue.union(inParty)
                parties.remove(at: i)
            }
        }
    }
    
    print(parties.count)
}
