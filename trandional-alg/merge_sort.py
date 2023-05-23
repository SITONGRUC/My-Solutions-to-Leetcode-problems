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

#Example
if __name__ == '__main__':
    lists = [12,3,4,4,2,4,53,5,453,23,2323,234,45,54234,234,23]
    print(merge_sort(lists))


