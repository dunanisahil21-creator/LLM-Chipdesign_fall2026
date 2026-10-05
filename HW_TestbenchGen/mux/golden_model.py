def oracle(inputs: dict) -> dict:
    a = inputs['a']
    b = inputs['b']
    sel = inputs['sel']
    y = a if sel == 0 else b
    return {'y': y}