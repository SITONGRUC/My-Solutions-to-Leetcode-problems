class Solution:
    def heap_sort(self, lst: List[int]) -> None:
        """
        Mutates elements in lst by utilizing the heap data structure
        """
        def max_heapify(heap_size, index):
            left, right = 2 * index + 1, 2 * index + 2
            largest = index
            if left < heap_size and lst[left] > lst[largest]:
                largest = left
            if right < heap_size and lst[right] > lst[largest]:
                largest = right
            if largest != index:
                lst[index], lst[largest] = lst[largest], lst[index]
                max_heapify(heap_size, largest)

        # heapify original lst
        for i in range(len(lst) // 2 - 1, -1, -1):
            max_heapify(len(lst), i)

        # use heap to sort elements
        for i in range(len(lst) - 1, 0, -1):
            # swap last element with first element
            lst[i], lst[0] = lst[0], lst[i]
            # note that we reduce the heap size by 1 every iteration
            max_heapify(i, 0)
# My Own Heap Way
# def max_heap(i):
#     if i <= len(lst)-1:

#         left_index = i*2+1
#         right_index = i*2+2
#         if left_index <= len(lst)-1:
#             if lst[left_index] > lst[i]:
#                 lst[i] , lst[left_index] = lst[left_index],lst[i]
#         if right_index <= len(lst)-1:
#             if lst[right_index] > lst[i]:
#                 lst[i],lst[right_index] = lst[right_index] ,lst[i]
#         max_heap(left_index)
#         max_heap(right_index)
# for i in range(len(lst)-1,-1,-1):
#     max_heap(i)
