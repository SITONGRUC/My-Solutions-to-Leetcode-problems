def shell_sort(data):
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



data = [101,2,4,5,2,1,2,32,34,4]
print(shell_sort(data))
