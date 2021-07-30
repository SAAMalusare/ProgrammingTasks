
def string_concat(dish_name,dish_quantity):
    print(" your dish is ",dish_name)
    print("dish quantity is" ,dish_quantity)
    print("your bill is ",100*dish_quantity)

dish_name=input("what would you like to eat ")

dish_quantity=int(input("how many plates "))
string_concat(dish_name,dish_quantity)
print(type(dish_quantity))