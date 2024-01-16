// 연속된 원소의 합 중 최댓값 구하기

func maxSubArray(_ nums: [Int]) -> Int {
    if nums.count == 1 {
        return nums[0]
    }
    
    var dp: [Int] = nums
    
    for i in 1..<dp.count {
        if dp[i-1] > 0 {
            dp[i] += dp[i-1]
        }
    }
    
    return dp.max() ?? 0
}
