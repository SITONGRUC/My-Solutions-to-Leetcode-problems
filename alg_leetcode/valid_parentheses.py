class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        import re
        s_copy = s
        s = re.sub('\[\]','',s)
        s = re.sub('\{\}','',s)
        s = re.sub('\(\)','',s)
        while len(s) <len(s_copy):
            s_copy = s
            s = re.sub('\[\]','',s)
            s = re.sub('\{\}','',s)
            s = re.sub('\(\)','',s)
        if s == '':
            return True
        else:
            return False
