// 최소 한 집 건너 도둑질하기

func rob(_ nums: [Int]) -> Int {
    var dp = nums
    let count = nums.count
    
    if count <= 2 {
        return dp.max() ?? 0
    }
    
    if count == 3 {
        return max(nums[0] + nums[2], nums[1])
    }
    
    dp[1] = max(nums[0], nums[1])
    dp[2] += dp[0]
    
    for i in 3..<dp.count {
        dp[i] += max(dp[i-2], dp[i-3])
    }
    
    return dp.max() ?? 0
}
