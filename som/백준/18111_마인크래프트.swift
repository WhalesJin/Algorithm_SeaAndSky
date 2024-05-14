import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, b) = (input[0], input[1], input[2])
var ground = [Int]()
var (mineTime, height) = (Int.max, -1)

for _ in 0..<n {
    ground += readLine()!.split(separator: " ").map { Int($0)! }
}

for i in 0...256 {
    if n * m * i <= ground.reduce(0, +) + b {
        let time = checkTime(i)

        if mineTime >= time {
            mineTime = time
            height = i
        }
    }
}

func checkTime(_ height: Int) -> Int {
    var temp = 0

    for i in ground {
        if i < height {
            temp += height - i
        } else if height < i {
            temp += 2 * (i - height)
        }
    }

    return temp
}

print(mineTime, height)
