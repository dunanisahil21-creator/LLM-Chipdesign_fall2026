def oracle(inputs: dict) -> dict:
    a = inputs['a']
    b = inputs['b']
    cin = inputs['cin']
    
    total = a + b + cin
    sum_result = total & 0b1111  # Get the lower 4 bits for sum
    cout_result = (total >> 4) & 0b1  # Get the 5th bit for carry out
    
    return {
        'sum': sum_result,
        'cout': cout_result
    }