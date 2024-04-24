import Foundation

func result16401() {
    // 컴포넌트가 왜 시간초과...?
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    let nephewCount = input[0]
    let cookieCount = input[1]
    var cookiesArray = readLine()!.split(separator: " ").map({ Int($0)! })
    var left = 1
    var right = cookiesArray.max()!
    var answer = 0

    while left <= right {
        let mid = (left + right) / 2
        var temp = 0

        for cookie in cookiesArray {
            temp += cookie / mid
        }

        if temp >= nephewCount {
            if answer < mid {
                answer = mid
            }

            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    print(answer)
}
