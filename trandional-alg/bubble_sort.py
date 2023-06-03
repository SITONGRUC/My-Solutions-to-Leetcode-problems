def bubble_sort(data):
    for x in range(len(data)-1,0,-1):
        for i in range(x):
            j = i+1
            this = data[i]
            next = data[j]
            if data[i] < data[j]:
                data[i] = this
                data[j] = next
            else:
                data[j] = this
                data[i] = next
    return data



def bubble_sort(data):
    lenth = len(data)
    if lenth <=1:
        return data
    else:
        while lenth >0:

    #     for i in range(len(data),0,-1):

            for j in range(lenth-1):
                count = 0
                if data[j+1] <= data[j]:
                    data[j],data[j+1] = data[j+1],data[j]
                    count = count+1

            lenth = lenth-1

        else:
            return data
            
data = [101,2,4,5,2,1,2,32,34,4]
print(bubble_sort(data))
