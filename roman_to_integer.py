class Solution:
    def romanToInt(self, s: str) -> int:
        listed_s = []
        for i in range(len(s)):
            listed_s.append(s[i])
        num = 0
        copy_listed_s = listed_s
        for i in range(len(listed_s)):
            if 'M' == listed_s[i]:
                num = num + 1000
            elif 'D' == listed_s[i]:
                num = num+500
            elif 'C' == listed_s[i]:
                num = num+100
            elif 'L' == listed_s[i]:
                num = num+50
            elif 'X' == listed_s[i]:
                num = num+10
            elif 'V' == listed_s[i]:
                num = num+5
            elif 'I' == listed_s[i]:
                num = num+1
        for i in range(len(listed_s)-1):
            if 'C' == listed_s[i]:
                if 'D' == listed_s[i+1] or 'M' == listed_s[i+1]:
                    num = num-100*2
            if 'X' == listed_s[i]:
                if 'L' == listed_s[i+1] or 'C' == listed_s[i+1]:
                    num = num-10*2
            if 'I' == listed_s[i]:
                if "V"== listed_s[i+1] or 'X' == listed_s[i+1]:
                    num = num-1*2
        return num
