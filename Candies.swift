
// Time Complexity : O(3N)
// Space Complexity : O(N)
// Did this code successfully run on Leetcode : yes
//Initially give one candy to all. Idea is to maintain more candies by doing left side and right side separately. 

class Solution {
    func candy(_ ratings: [Int]) -> Int {
        //base
        if ratings.count == 0 {
            return 0
        }
        var candies:[Int] = [Int](repeating: 1, count: ratings.count)
        
        for i in 1..<ratings.count {
            if ratings[i] > ratings[i-1] {
                candies[i] = max(candies[i], candies[i-1]+1)
            }
        }
        
        for i in (0..<ratings.count-1).reversed() {
            if ratings[i] > ratings[i+1] {
                candies[i] = max(candies[i], candies[i+1]+1)
            }
        }
        
        var maxCandies = 0
        for candy in candies {
            maxCandies += candy
        }
        
        return maxCandies
    }
}