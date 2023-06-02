class Solution(object):
    def pivotIndex(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        i = 0
        while i < len(nums):
            if sum(nums[:i]) ==sum(nums[i+1:]):
                return i
            else:
                i = i+1
        else:
            return -1
