class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        num_1 = nums
        num_2 = nums
        answer  = []
        for i in range(len(num_1)):
            for j in range(len(num_2)):
                if num_1[i]+num_2[j] == target and j > i:
                    answer.append(i)
                    answer.append(j)
                    return answer
