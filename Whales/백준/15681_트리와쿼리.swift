// 저장을 어떻게 할까?
// 루트별로 따로 저장? -> 개수가 많아졌을 때 괜찮을까?
func 트리와쿼리() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0]
    let root = input[1]
    let queryCount = input[2]
    
    var tree = [[Int]](repeating: [], count: n+1)
    
    for _ in 1..<n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        tree[input[0]].append(input[1])
        tree[input[1]].append(input[0])
    }
    
    var queries = [Int](repeating: 0, count: n+1)
    
    func searchQueries(_ i : Int) {
        queries[i] = 1
        
        for kid in tree[i] {
            if queries[kid] == 0 {
                searchQueries(kid)
                queries[i] += queries[kid]
            }
        }
    }
    
    searchQueries(root)
    
    for _ in 1...queryCount {
        let query = Int(readLine()!)!
        print(queries[query])
    }
}

/* 52%에서 시간초과

// 저장을 어떻게 할까?
// 루트별로 따로 저장? -> 개수가 많아졌을 때 괜찮을까?
func 트리와쿼리() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0]
    let root = input[1]
    let queryCount = input[2]
    
    var tree = [[Int]](repeating: [], count: n+1)
    
    for _ in 1..<n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        tree[input[0]].append(input[1])
        tree[input[1]].append(input[0])
    }
    print(tree)
    var parent = [Int](repeating: 0, count: n+1)
    
    func searchParent(_ i : Int) {
        for j in tree[i] {
            if parent[j] == 0 {
                parent[j] = i
                searchParent(j)
            }
        }
    }

    searchParent(root)
    print(parent)
    // tree = [[], [3], [3], [1, 4, 2], [3, 5], [4, 6], [5, 7, 9, 8], [6], [6], [6]]
    // parent = [0, 3, 3, 4, 5, 4, 5, 6, 6, 6] (0과 root는 무시)
    // kids = [[], [], [], [1, 2], [3], [4, 6], [7, 9, 8], [], [], []]
    var kids = tree
    
    for i in 1...n {
        if i != root {
            kids[i].remove(at: kids[i].firstIndex(of: parent[i])!)
        }
    }
    
    print(kids)
    
    var count = 0
    func searchKids(_ parent: Int) {
        guard kids[parent].isEmpty == false else { return }
        
        for i in kids[parent] {
            count += 1
            searchKids(i)
        }
    }
    
    for _ in 1...queryCount {
        let query = Int(readLine()!)!
        count = 1
        searchKids(query)
        print(count)
//        print(query) // query가 루트인 정점의 개수
    }
}
*/
