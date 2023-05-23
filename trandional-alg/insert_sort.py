def inset_sort(lists):
    for i in range(1,len(lists)):
        key = lists[i]
        j = i-1
        while j >=0:
            last_data = lists[j]
            if last_data > key:
                lists[i] = last_data
                lists[j] = key
                i = i-1
            j=j-1
    return lists