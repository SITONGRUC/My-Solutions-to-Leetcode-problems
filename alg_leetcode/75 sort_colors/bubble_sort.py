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
            
