/*
 첫째 줄부터 N-1개의 줄에 각 노드의 부모 노드 번호를 2번 노드부터 순서대로 출력한다.
 
     1
   6  4
  3  2 7
 5
 
 4 6 1 3 1 4
 */

//참고 블로그: https://velog.io/@dark6ro/%EB%B0%B1%EC%A4%80-11725%EB%B2%88-%ED%8A%B8%EB%A6%AC%EC%9D%98-%EB%B6%80%EB%AA%A8-%EC%B0%BE%EA%B8%B0
//참고 블로그: https://noguen.com/boj-swift-ps/11725-swift

func 트리의부모찾기() {
    let n = Int(readLine()!)!
    var tree = [[Int]](repeating: [], count: n+1)
    
    for _ in 1..<n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        tree[input[0]].append(input[1])
        tree[input[1]].append(input[0])
    }
    
    var parent = [Int](repeating: 0, count: n+1)

    func repeatSearch(_ i : Int) {
        for j in tree[i] {
            if parent[j] == 0 {
                parent[j] = i
                repeatSearch(j)
            }
        }
    }
    
    repeatSearch(1)
    
    print(parent[2...n].map { String($0) }.joined(separator: "\n"))
}
