class Solution(object):
    def searchInsert(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        def merge_sort(data):
            def merge(left,right):
                result = []
                i = 0
                j = 0
                len1 = len(left)
                len2 = len(right)
                while i < len(left) and j < len(right):
                    if left[i] <= right[j]:
                        result.append(left[i])
                        i+=1
                    else:
                        result.append(right[j])
                        j+=1


                result = result + left[i:]
                result = result + right[j:]
                return result
            if len(data) <=1:
                return data
            else:
                mid = int(len(data)/2)
                left_ = merge_sort(data[:mid])
                right_ = merge_sort(data[mid:])
                result = merge(left_,right_)
                return result
        nums_copy = nums+[target]
        nums_copy = merge_sort(nums_copy)
        return nums_copy.index(target)