def sortArray(self, nums):
        if len(nums) <=1:
            return nums
        else:
            end = len(nums)-1
            piv = nums[end]
            higher = []
            lower = []
            for i in range(end):
                if nums[i] >= piv:
                    higher.append(nums[i])
                else:
                    lower.append(nums[i])
            return self.sortArray(lower)+[piv]+self.sortArray(higher)

