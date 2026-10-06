def find_tail(lst):
  def helper(index):
    if index == len(lst):
      return None
    if index == len(lst) - 1:
      return lst[index]
    return helper(index + 1)

  return helper(0)
