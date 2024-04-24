import Foundation

// 이것도 짱어려워서 블로그 도움 받음

func result2573() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    var xy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var ice = Array(repeating: [Int](), count: n)
    var year = 0


    for i in 0..<n {
        ice[i] = readLine()!.split(separator: " ").map { Int($0)! }
    }

    while( true ) {
        var isAllIceBergMelted = false
        var isVisited1 : [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
        var isVisited2 = isVisited1
        //2개의 구역이 있는가?!
        let isSeparated : Bool = detected(visited: &isVisited1, allIceBergMelted : &isAllIceBergMelted)

        if !isSeparated{
            meltIceberg(visited : &isVisited2)
        }else{
            if isAllIceBergMelted {
                year = 0
                break
            }else{
                break

            }
        }
        year += 1
    }

    print(year)

    func detected(visited: inout [[Bool]] ,allIceBergMelted iceBerg : inout Bool) -> Bool {
        var dfsTry = 0
        for y in 0..<n {
            for x in 0..<m {
                if ice[y][x] != 0 && visited[y][x] == false {
                    dfs(paramX: x, paramY: y,isMelt: false, visit: &visited)
                    dfsTry += 1

                    if dfsTry == 2 {
                        return true
                    }
                }
            }
        }

        if dfsTry == 0 {
            iceBerg = true

            return true
        }

        return false
    }

    func meltIceberg(visited: inout [[Bool]]){
        for y in 0..<n {
            for x in 0..<m {
                if ice[y][x] != 0 {
                    dfs(paramX: x, paramY: y,isMelt: true, visit: &visited)

                    return
                }
            }
        }
    }

    func dfs(paramX x :Int,paramY y :Int,isMelt : Bool, visit : inout [[Bool]]){
        var notIce = 0

        visit[y][x] = true
        notIce = 0

        for (dx, dy) in xy {
            let nx = dx + x
            let ny = dy + y

            if nx < 0 || nx > m - 1 || ny < 0 || ny > n - 1 {
                continue
            }

            if ice[ny][nx] == 0 && isMelt {

                if visit[ny][nx] == false {
                    notIce += 1
                }
            }

            if ice[ny][nx] != 0 && visit[ny][nx] == false {
                visit[ny][nx] = true
                dfs(paramX: nx, paramY: ny, isMelt: isMelt, visit: &visit)
            }
        }

        if isMelt {
            ice[y][x] -= notIce

            if ice[y][x] < 0 {
                ice[y][x] = 0
            }
        }
    }
}
