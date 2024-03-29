class Solution:
    def findPoisonedDuration(self, timeSeries: List[int], duration: int) -> int:
        period = 0
        for i in range(len(timeSeries)-1):
            if timeSeries[i+1] - timeSeries[i] < duration:
                period = period + timeSeries[i+1] - timeSeries[i]
            else:
                period = period + duration
        period = period + duration
        return period
