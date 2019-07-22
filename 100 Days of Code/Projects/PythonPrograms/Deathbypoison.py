# Create a character (variable) that has 30 health. Have him lose 1 health steadily due to poison. When their health reaches 10 print a warning.
Name = 'Harry Potter'
Health = 30

print('Help', Name, "is poison by Draco Malfoy!")
print('We need to save', Name)

while (Health > 0):
    print(Health)
    Health -= 1
    if Health <= 10:
        print("Warning", Name, "Health is low: ", Health)
   

'''
TODO:
- Add options to save from poison
- Add options to increase potion strength
- Add Random Options using functions
'''