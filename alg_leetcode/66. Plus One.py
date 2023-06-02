class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        nums = str(int(''.join(list(map(str,digits))))+1)
        return [int(nums[i]) for i in range(len(nums))]
        
