class Solution {
    public int findPoisonedDuration(int[] timeSeries, int duration) {
        int period = 0;
        int re_len = timeSeries.length-1;
        for (int i = 0;i < re_len;i=i+1){
            int lenth = timeSeries[i+1]-timeSeries[i];
            if (lenth < duration) {
                period = period + lenth;
            }else{
                period = period + duration;
            }
        }
        period = period + duration;
        return period;
        
    }
}
