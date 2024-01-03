// strfry 함수는 입력된 문자열을 무작위로 재배열하여 새로운 문자열을 만들어낸다.
// (역자 주 : 여기에서 입력된 문자열과 새로 재배열된 문자열이 다를 필요는 없다.)
// 두 개의 문자열에 대해, 2번째 문자열이 1번째 문자열에 strfry 함수를 적용하여 얻어질 수 있는지 판단하라.

import Foundation

func strfry() {
    let caseCount = Int(readLine()!)!
    
    for _ in 1...caseCount {
        let input: [String] = readLine()!.components(separatedBy: " ")
        
        if Array(input[0]).sorted() == Array(input[1]).sorted() {
            print("Possible")
        } else {
            print("Impossible")
        }
    }
}
