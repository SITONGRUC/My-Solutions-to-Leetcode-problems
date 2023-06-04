# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def insertionSortList(self, head):
        def linklist_2_list(x):
            result_list = []
            result = x
            while result:
                result_list.append(result.val)
                result = result.next
            return result_list
        def append_list_node(list_node,new_val):
            append_node = ListNode(new_val)
            while list_node.next != None:
                list_node = list_node.next
            list_node.next = append_node
        def list_2_linklist(x):
            if len(x) == 0:
                return ListNode()
            else:
                x_init= x
                new = ListNode(x_init[0])
                for i in range(1,len(x_init)):
                    append_list_node(new,int(x_init[i]))
                return new
        def sort(nums):
            data = nums
            if len(data) >1:


                for i in range(len(data),0,-1):
                    for j in range(i-1):
                        if data[j] >= data[j+1]:
                            data[j],data[j+1] = data[j+1],data[j]
            return data
        if head == None:
            return None
        else:
            list_result = linklist_2_list(head)
            list_result = sort(list_result)
            list_result = list_2_linklist(list_result)
            return list_result
