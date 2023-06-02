class Solution:
    def isPalindrome(self, x: int) -> bool:
        x_copy  =  str(x)
        x_reverse = x_copy[::-1]
        if x_reverse == x_copy:
            return True
        else:
            return False
