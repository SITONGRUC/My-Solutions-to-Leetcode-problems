import random
exp = []
for i in range(10):
    exp.append(random.randint(0,10))
def insert_sort(lists):
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
data = insert_sort(exp)


def  binary_search(data,num):
    start = 0
    end = len(data)
    mid = int(start/2+end/2)
    while end >0 and start < len(data):
        if data[mid] > num:
            end = mid-1
            mid = int(start/2+end/2)
        elif data[mid] < num:
            start = mid+1
            mid = int(start/2+end/2)
        else:
            return mid
    else:
        return -1

