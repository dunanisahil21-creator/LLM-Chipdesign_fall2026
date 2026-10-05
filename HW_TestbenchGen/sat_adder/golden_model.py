def oracle(inputs: dict) -> dict:
    a = inputs['a']
    b = inputs['b']
    raw_sum = a + b
    sum_value = min(raw_sum, 15)
    return {'sum': sum_value}