class Solution(object):
    def findKthLargest(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        def sortArray(nums):
            def merge(left, right):
                result = []
                i = 0
                j = 0
                len1 = len(left)
                len2 = len(right)
                while i < len(left) and j < len(right):
                    if left[i] <= right[j]:
                        result.append(left[i])
                        i += 1
                    else:
                        result.append(right[j])
                        j += 1

                result = result + left[i:]
                result = result + right[j:]
                return result

            data = nums
            if len(data) <= 1:
                return data
            else:
                mid = int(len(data) / 2)
                left_ = sortArray(data[:mid])
                right_ = sortArray(data[mid:])
                if left_[-1] <= right_[0]:
                    result = left_ + right_
                else:
                    result = merge(left_, right_)
                return result
        nums = sortArray(nums)
        return nums[len(nums)-k]
