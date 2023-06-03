class Solution(object):
    def heightChecker(self, heights):
        """
        :type heights: List[int]
        :rtype: int
        """
        def merge(left,right):
            j = 0
            i = 0
            result = []
            while i < len(left) and j < len(right):
                if left[i] <= right[j]:
                    result.append(left[i])
                    i = i+1
                else:
                    result.append(right[j])
                    j = j+1
            result = result + left[i:]
            result = result +right[j:]
            return result
        def merge_sort(data):
            if len(data) <= 1:
                return data
            else:
                mid = int(len(data)/2)
                left_ = merge_sort(data[:mid])
                right_ = merge_sort(data[mid:])
                if left_[-1] <= right_[0]:
                    result = left_+right_
                else:
                    result = merge(left_,right_)
                return result
        hieght_sorted =  merge_sort(heights)
        count = 0
        for i in range(len(heights)):
            if heights[i] != hieght_sorted[i]:
                count = count+1
        return count
