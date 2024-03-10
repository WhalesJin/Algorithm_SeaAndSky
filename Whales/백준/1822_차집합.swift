// 자연수로 이루어진 두 집합 A와 B가 있다. 집합 A에는 속하면서 집합 B에는 속하지 않는 모든 원소를 구하는 프로그램을 작성하시오.

//  114912KB 672ms
func 차집합() {
    let _ = readLine()!.split(separator: " ").compactMap { Int($0) }
    let setA = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
    let setB = Set(readLine()!.split(separator: " ").compactMap { Int($0) })
    let intersection = setB.intersection(setA)
    
    var count = 0
    var elements = ""

    for element in setA {
        if intersection.contains(element) == false {
            count += 1
            elements += "\(element) "
        }
    }
    
    print("\(count)\n" + elements)
}

/*
//  116356KB 824ms
func 차집합() {
    let _ = readLine()!.split(separator: " ").compactMap { Int($0) }
    let setA = Set(readLine()!.split(separator: " ").compactMap { Int($0) })
    let setB = Set(readLine()!.split(separator: " ").compactMap { Int($0) })
    let intersection = setA.intersection(setB)
    
    var answerSet: Set<Int> = []
    
    for element in setA {
        if intersection.contains(element) == false {
            answerSet.insert(element)
        }
    }
    
    var answer = "\(answerSet.count)\n"
    
    answerSet.sorted().forEach { answer += "\($0) " }
    print(answer)
}
*/
