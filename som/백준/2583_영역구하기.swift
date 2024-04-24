import Foundation

func result2583() {
    let mnk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (m, n, k) = (mnk[0], mnk[1], mnk[2])
    var paper = Array(repeating: Array(repeating: 0, count: n), count: m)
    var area = [Int]()
    var temp = 0

    for _ in 0..<k {
        let draw = readLine()!.split(separator: " ").map { Int($0)! }

        for i in draw[0]..<draw[2] {
            for j in draw[1]..<draw[3] {
                paper[j][i] += 1
            }
        }
    }

    func dfs(_ x: Int, _ y: Int) {
        if x < 0 || x >= m || y < 0 || y >= n || paper[x][y] != 0 {
            return
        }

        paper[x][y] = 1
        temp += 1

        dfs(x + 1, y)
        dfs(x - 1, y)
        dfs(x, y + 1)
        dfs(x, y - 1)
    }

    for i in 0..<n {
        for j in 0..<m {
            if paper[j][i] == 0 {
                temp = 0
                dfs(j, i)
                area.append(temp)
            }
        }
    }

    print(area.count)
    print(area.sorted().map { String($0)}.joined(separator: " "))

}
