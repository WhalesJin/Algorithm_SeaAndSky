func 주식() {
    let t = Int(readLine()!)! // 자연수
    
    for _ in 1...t {
        let _ = Int(readLine()!)! // 2 <= n <= 1,000,000
        var prices = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        var money = 0
        var temp = prices.removeLast()
        
        while !prices.isEmpty {
            let price = prices.removeLast()
            
            if price > temp { // 나보다 크면 바꿈
                temp = price
            } else { // 나보다 작으면 차액이 번 돈
                money += temp - price
            }
        }
        
        print(money)
    }
}
