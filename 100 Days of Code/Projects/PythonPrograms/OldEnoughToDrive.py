user_age = input("What is your age?")

if (int(user_age) < 16):
    print("You are not old enough to drive")
elif (int(user_age) == 63):
    print('Congratulations, You are awesome!')
elif ((int(user_age) > 16) and (int(user_age) < 63)):
    print('You are old enough to drive')
