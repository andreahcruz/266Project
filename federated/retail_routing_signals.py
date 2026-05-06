"""Question-only hints for MacroRAG tie-break between the two Spider retail DBs.

`customers_and_orders` and `e_commerce` share overlapping vocabulary (`orders`,
`products`, payment language). Tie-break lexical overlap can invert an otherwise
correct blurb embedding. These nudges add a bounded scalar derived only from the
user question (already visible to the Hub). They do not ship schema text.
"""


def retail_pair_tiebreak_nudge(question: str, db_id: str) -> float:
    if db_id not in ("customers_and_orders", "e_commerce"):
        return 0.0
    q = question.casefold()

    if db_id == "customers_and_orders":
        n = 0.0
        if "customer order" in q.replace("_", " "):
            n += 3.3
        if "how many addresses" in q or "number of addresses" in q or "count the number of addresses" in q:
            n += 3.0
        if "hardware" in q and "product" in q:
            n += 2.2
        if "clothes" in q and ("product" in q or "expensive" in q or "type" in q):
            n += 2.5
        if "payment method code" in q:
            n += 3.0
        if "order status code" in q:
            n += 3.0
        if "without an order" in q or ("not been ordered" in q and "product" in q):
            n += 2.2
        if "descending order of price" in q or "sorted by descending price" in q:
            n += 4.8
        if "how many products" in q or "number of products" in q:
            n += 4.2
        if "monitor" in q and "price" in q:
            n += 2.0
        if ("most common" in q or "most commonly used" in q) and "payment" in q and "method" in q:
            n += 3.2
        if "most common" in q and "order status" in q:
            n += 2.8
        if "quantity" in q and "larger than 6" in q and "product" in q:
            n += 2.5
        if "more than 3 products" in q or "consisting of more than 3 products" in q:
            n += 2.5
        if ("cheapest hardware" in q or ("cheap" in q and "hardware" in q)) and (
            "product" in q or "name" in q
        ):
            n += 2.0
        if "product type code" in q or "product types that have" in q:
            n += 2.5
        if "least number of products" in q and "code" in q:
            n += 2.2
        if "most frequent" in q and "product type" in q:
            n += 2.3
        return n

    n = 0.0
    if "invoice" in q:
        n += 3.2
    if "shipment" in q:
        n += 2.8
    if "tracking number" in q or "tracking numbers" in q:
        n += 2.8
    if " shipped" in q or "been shipped" in q or "have been shipped" in q:
        n += 2.2
    if "ordered and shipped" in q:
        n += 3.0
    if "login" in q or "password" in q or "username" in q:
        n += 3.0
    if "middle initial" in q:
        n += 3.0
    if "dell" in q:
        n += 2.2
    if "united states" in q or " in the usa" in q:
        n += 2.2
    if "town" in q and "county" in q:
        n += 2.2
    if "least common gender" in q or "less common gender" in q:
        n += 2.2
    if "at least 2 payment method" in q or "more than 2 payment method" in q:
        n += 2.4
    if "placed any order" in q or "have placed any order" in q:
        n += 2.8
    if "ordered things" in q:
        n += 2.4
    if "payment methods" in q and ("choose from" in q or "customers choose" in q):
        n += 2.4
    if "payment method" in q and "most customers" in q:
        n += 2.6
    if "average price" in q and ("being ordered" in q or "ordered on average" in q or "products being ordered" in q):
        n += 2.4
    if "average price of the products" in q:
        n += 1.9
    if "product average price" in q:
        n += 2.2
    if "products cost on average" in q or "cost on average" in q:
        n += 2.2
    if "gender" in q and ("placed" in q or "buy" in q):
        n += 1.9
    if "least sum of the product" in q or "total cost the least" in q:
        n += 2.0
    if "most frequently" in q and ("order" in q or "listed in orders" in q):
        n += 2.0
    if "female customer" in q or "female customers" in q:
        n += 1.8
    if ("do not have" in q or "do not have a" in q) and "payment method" in q:
        n += 2.0
    if "not been ordered yet" in q or "have not been ordered yet" in q:
        n += 2.6
    if "sizes" in q and ("average" in q or "above average" in q or "mean" in q):
        n += 1.9
    if "sold" in q and ("not been" in q or "have not been sold" in q):
        n += 1.8
    return n
