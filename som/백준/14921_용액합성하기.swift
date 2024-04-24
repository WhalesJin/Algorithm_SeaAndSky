import Foundation

func result14921() {
    let n = Int(readLine()!)!
    let experiments = readLine()!.split(separator: " ").map { Int(String($0))! }
    var (start, end) = (0, n - 1)
    var (a, b) = (Int.min, Int.max)
    var result = Int.max
    
    binarySearch(experiments)
    
    func binarySearch(_ array: [Int]) {
        while start < end {
            let newExperiment = array[start] + array[end]
    
            if result > abs(newExperiment) { // 절댓값으로 비교를 해서 최대한 1에 가까운 애들이 a, b, result 설정이 되게 하는 조건문
                result = abs(newExperiment)
                a = experiments[start]
                b = experiments[end]
            }
    
            if newExperiment > 0 { // 양수일 경우 오른쪽 포인터 한 칸 당김
                end -= 1
            } else if newExperiment < 0 { // 음수일 경우 왼쪽 포인터 한 칸 밀림
                start += 1
            } else {
                print(experiments[start] + experiments[end])
                return
            }
        }
    
        print(a + b)
    }
}
