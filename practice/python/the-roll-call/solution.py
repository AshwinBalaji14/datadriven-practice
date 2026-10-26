def rows_to_dicts(headers, rows):
  return [dict(zip(headers,row)) for row in rows]
