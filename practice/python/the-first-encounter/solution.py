def string_to_number_mapping(s: str) -> dict:
  dict_return = {}

  for index, char in enumerate(s):
    if char not in dict_return:
      dict_return[char] = index

  return dict_return
