let n = Int(readLine()!)!

for _ in 0..<n {
    var count = 0

    for i in readLine()! {
        if i == "(" {
            count += 1
        } else {
            count -= 1

            if count < 0 {
              break
            }
        }
    }

print(count == 0 ? "YES" : "NO")
}
