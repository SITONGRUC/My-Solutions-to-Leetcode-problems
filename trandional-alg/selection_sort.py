def selection_sort(lst):
    for i in range(len(lst)):
        min_index = i
        for j in range(i + 1, len(lst)):
            # Update minimum index
            if lst[j] < lst[min_index]:
                min_index = j

        lst[min_index], lst[i] = lst[i], lst[min_index] #This line is important. pay attention to which values you are attached to 
    return lst
