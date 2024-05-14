import Foundation

func result1916() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var dist = Array(repeating: Int.max, count: n)
    var map = Array(repeating: [(v:Int, cost:Int)](), count: n)

    for _ in 0..<m{
        let line = readLine()!.split(separator: " ").map{Int($0)!}
        let u = line[0]-1
        let v = line[1]-1
        let cost = line[2]
        map[u].append((v,cost))
    }

    for i in 0..<n{
        map[i].sort(by: { $0.cost < $1.cost })
    }

    let uv = readLine()!.split(separator: " ").map{ Int($0)! - 1 }
    let u = uv[0]
    let v = uv[1]
    dist[u] = 0

    var q = [(u)]
    var idx = 0
    while idx < q.count{
        let current = q[idx]
        let cost = dist[current]

        for info in map[current] {
            let next = info.v
            let fee = info.cost

            if dist[next] > cost + fee {
                dist[next] = cost + fee
                q.append((next))
            }
        }

        idx += 1
    }

    print(dist[v])
}
