func 짐챙기는숌() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0], m = input[1] // n: 책개수, m: 박스허용무게, 0 <= n <= 50, 0 < m <= 1000
    var count = 0 // 박스 개수
    
    if n != 0 {
        let books = readLine()!.split(separator: " ").compactMap { Int($0) }
        var temp = 0
        
        for book in books {
            temp += book
            
            if temp > m {
                count += 1
                temp = book
            }
        }
        
        count += 1
    }
    
    print(count)
}
