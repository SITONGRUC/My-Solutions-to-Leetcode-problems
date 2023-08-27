class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        count = 0
        flag = 0
        for i in range(len(nums)):
            if nums[i] == 1:
                count = count+1
                if count > flag:
                    flag = count
            else:
                count = 0
        return flag
        
