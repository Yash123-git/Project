import mysql.connector
import difflib

# Database connection
def connect_db():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="admin",
        database="recipes"
    )

# Login Function
def login():
    connection = connect_db()
    cursor = connection.cursor()
    
    username = input("Enter your username: ")
    password = input("Enter your password: ")
    
    query = "SELECT role FROM Users WHERE username = %s AND password = %s"
    cursor.execute(query, (username, password))
    result = cursor.fetchone()
    
    if result:
        print(f"\nWelcome, {username}!\n")
        return result[0]  # Return user role
    else:
        print("\nInvalid credentials, please try again.\n")
        return None

# Viewer Menu
def viewer_menu():
    while True:
        print("\n===== Viewer Menu =====")
        print("1. View All Recipes")
        print("2. Search Recipe by Name")
        print("3. View Recipes by Chef")
        print("4. View Recipes by Category")
        print("5. Exit")
        print()
        choice = input("\nSelect an option: ")
        
        if choice == "1":
            view_all_recipes()
        elif choice == "2":
            search_recipe_by_name()
        elif choice == "3":
            view_recipes_by_chef()
        elif choice == "4":
            view_recipes_by_category()
        elif choice == "5":
            print("\nExiting... Goodbye!")
            break
        else:
            print("\nInvalid option, please try again.")

# Editor Menu
def editor_menu():
    while True:
        print("\n===== Editor Menu =====")
        print("1. Add New Recipe")
        print("2. Update Existing Recipe")
        print("3. Delete Recipe")
        print("4. View All Recipes")
        print("5. Search Recipe by Name")
        print("6. View Recipes by Chef")
        print("7. View Recipes by Category")
        print("8. Exit")
        choice = input("\nSelect an option: ")
        print()
        
        if choice == "1":
            add_new_recipe()
        elif choice == "2":
            update_recipe()
        elif choice == "3":
            delete_recipe()
        elif choice == "4":
            view_all_recipes()
        elif choice == "5":
            search_recipe_by_name()
        elif choice == "6":
            view_recipes_by_chef()
        elif choice == "7":
            view_recipes_by_category()
        elif choice == "8":
            print("\nExiting... Goodbye!")
            break
        else:
            print("\nInvalid option, please try again.")

# Function to view all recipes
def view_all_recipes():
    connection = connect_db()
    cursor = connection.cursor()
    query = "SELECT * FROM dishes"
    cursor.execute(query)
    results = cursor.fetchall()
    
    print("\n===== All Recipes =====")
    if results:
        for row in results:
            print(f"\nID: {row[0]}")
            print(f"Dish Name: {row[1]}")
            print(f"Category: {row[2]}")
            print("-" * 30)
    else:
        print("No recipes found.")
    
    connection.close()

# Function to search recipe by name
def search_recipe_by_name():
    connection = connect_db()
    cursor = connection.cursor()
    recipe_name = input("\nEnter the recipe name: ")
    query = "SELECT * FROM dishes WHERE name LIKE %s"
    cursor.execute(query, (f"%{recipe_name}%",))
    results = cursor.fetchall()
    dish_name=results[0][1]
    query2="SELECT name, DISHES_THEY_MAKE FROM CHEF"
    cursor.execute(query2)
    results=cursor.fetchall()
    dict1={}
    for i in range(len(results)):
        list1=results[i][1].split(',')
        a=difflib.get_close_matches(dish_name,list1)
        if a!=[]:
            dict1[results[i][0]]=a[0]   
    i=1
    dict2={}
    for r in dict1:
        print(str(i)+".",r+"'s", dict1[r],"recipe")
        dict2[i]=r
        i+=1
    list_keys = list(dict2.keys())
    formatted_list = '/'.join(map(str, list_keys))
    choice=int(input(f"\nEnter your choice ({formatted_list}): "))
    if choice in list_keys:
        list_name=dict2[choice].split()
        query3=f"SELECT * from {list_name[0]}_{list_name[1]}_Recipes where dish_name=%s"        
        cursor.execute(query3,(dish_name,))
        results=cursor.fetchall()
        for row in results:
            print()
            print("-" * 30)
            print(f"Chef: {dict2[choice]}")
            print(f"Dish ID: {row[0]}")
            print(f"Dish Name: {row[1]}")
            print(f"Category: {row[2]}\n")
            print(f"Ingredients: {row[3]}\n")
            print(f"Instructions: {row[4]}\n")
            print(f"Prep Time: {row[5]}")
            print(f"Cook Time: {row[6]}")
            print(f"Rating: {row[7]}")
            print("-" * 30)
    else:
        print("Please enter a valid option.")
        
    connection.close()

# Function to view recipes by chef
def view_recipes_by_chef():
    connection = connect_db()
    cursor = connection.cursor()
    query = "SELECT name FROM Chef"
    cursor.execute(query)
    results = cursor.fetchall()
    dict1={}
    i=1
    for r in range(len(results)):
        print(str(i)+".",results[r][0]+"'s","recipes")
        dict1[i]=results[r][0]
        i+=1
    list_keys = list(dict1.keys())
    formatted_list = '/'.join(map(str, list_keys))
    choice=int(input(f"\nEnter your choice ({formatted_list}): "))
    print()
    if choice in list_keys:
        print("=====",dict1[choice]+"'s","recipes","=====")
        list_name=dict1[choice].split()
        query2=f"SELECT dish_name from {list_name[0]}_{list_name[1]}_Recipes"
        cursor.execute(query2)
        results=cursor.fetchall()
        dict2={}
        i=1
        for r in range (len(results)):
            print(str(i)+".",results[r][0],"recipe")
            dict2[i]=results[r][0]
            i+=1
        list_keys_2 = list(dict1.keys())
        formatted_list_2 = '/'.join(map(str, list_keys_2))
        choice_2=int(input(f"\nEnter your choice ({formatted_list_2}): "))
        print()
        if choice_2 in list_keys_2:
            query3=f"SELECT * FROM {list_name[0]}_{list_name[1]}_Recipes where dish_name=%s"
            #print(dict2[choice])
            cursor.execute(query3,(dict2[choice_2],))
            results=cursor.fetchall()
            for row in results:
                print()
                print("-" * 30)
                print(f"Chef: {dict1[choice]}")
                print(f"Dish ID: {row[0]}")
                print(f"Dish Name: {row[1]}")
                print(f"Category: {row[2]}\n")
                print(f"Ingredients: {row[3]}\n")
                print(f"Instructions: {row[4]}\n")
                print(f"Prep Time: {row[5]}")
                print(f"Cook Time: {row[6]}")
                print(f"Rating: {row[7]}")
                print("-" * 30)
        else:
            print("Please enter a valid option.")
    else:
        print("Please enter a valid option.")
        
    connection.close()
# Function to view recipes by category
def view_recipes_by_category():
    connection = connect_db()
    cursor = connection.cursor()
    query="SELECT DISTINCT category from dishes"
    cursor.execute(query)
    results=cursor.fetchall()
    i=1
    dict1={}
    for r in range(len(results)):
        print(str(i)+".",results[r][0])
        dict1[i]=results[r][0]
        i+=1
    
    list_keys = list(dict1.keys())
    formatted_list = '/'.join(map(str, list_keys))
    choice=int(input(f"\nEnter your choice ({formatted_list}): "))
    print()
    if choice in list_keys:
        query2="SELECT name from dishes where category=%s "
        cursor.execute(query2,(dict1[choice],))
        results2=cursor.fetchall()
        i=1
        dict2={}
        for r in range (len(results2)):
            print(str(i)+".",results2[r][0])
            dict2[i]=results2[r][0]
            i+=1
        list_keys2 = list(dict2.keys())
        formatted_list2 = '/'.join(map(str, list_keys2))
        choice2=int(input(f"\nEnter your choice ({formatted_list2}): "))
        
        if choice2 in list_keys2:
            query3="SELECT name, dishes_they_make from chef"
            cursor.execute(query3)
            results3=cursor.fetchall()
        
            dict3={}
            for i in range (len(results3)):
              list1=results3[i][1].split(',')
              a=difflib.get_close_matches(dict2[choice2],list1)
              
              if a!=[]:
                  dict3[results3[i][0]]=dict2[choice2]
              
            
            print(f"\n====={dict2[choice2]}=====")
            i=1
            dict4={}
            for r in dict3:
                print(str(i)+".",r+"'s", dict3[r],"recipe")
                dict4[i]=r
                i+=1
            list_keys3 = list(dict4.keys())
            formatted_list3 = '/'.join(map(str, list_keys3))
            choice3=int(input(f"\nEnter your choice ({formatted_list3}): "))
            if choice3 in list_keys3:
                list_name=dict4[choice3].split()
                query3=f"SELECT * from {list_name[0]}_{list_name[1]}_Recipes where dish_name=%s"        
                cursor.execute(query3,(dict2[choice2],))
                results=cursor.fetchall()
                for row in results:
                    print()
                    print("-" * 30)
                    print(f"Chef: {dict4[choice3]}")
                    print(f"Dish ID: {row[0]}")
                    print(f"Dish Name: {row[1]}")
                    print(f"Category: {row[2]}\n")
                    print(f"Ingredients: {row[3]}\n")
                    print(f"Instructions: {row[4]}\n")
                    print(f"Prep Time: {row[5]}")
                    print(f"Cook Time: {row[6]}")
                    print(f"Rating: {row[7]}")
                    print("-" * 30)
            else:
                print("Please enter a valid option.")
        else:
            print("Please enter a valid option.")
    else:
        print("Please enter a valid option.")
    connection.close()

# Function to add a new recipe (Editor only)
def add_new_recipe():
    connection = connect_db()
    cursor = connection.cursor()
    
    chef_name = input("Enter the chef name: ")
    chef_name_list=chef_name.split()
    recipe_id=int(input("Enter the recipe ID: "))
    dish_name = input("Enter the dish name: ")
    category = input("Enter the category: ")
    ingredients = input("Enter the ingredients: ")
    instructions = input("Enter the instructions: ")
    prep_time = input("Enter the preparation time (HH:MM:SS): ")
    cook_time = input("Enter the cook time (HH:MM:SS): ")
    rating = float(input("Enter the rating (e.g., 4.5): "))
    dish_id=int(input("Enter the dish ID:"))

    query="SELECT name from dishes "
    cursor.execute(query)
    results=cursor.fetchall()
    dish_list = [item[0] for item in results]
    if dish_name not in dish_list:
          query_insert="""
          INSERT INTO dishes (id,name,category)
          VALUES(%s,%s,%s)
          """
          cursor.execute(query_insert,(dish_id,dish_name,category))
    
    query2 = f"""
    INSERT INTO {chef_name_list[0]}_{chef_name_list[1]}_Recipes (id,dish_name, category, ingredients, instructions, prep_time, cook_time, rating,dish_id)
    VALUES (%s, %s, %s, %s, %s, %s, %s,%s,%s)
    """
    cursor.execute(query2, (recipe_id, dish_name, category, ingredients,instructions, prep_time, cook_time, rating,dish_id))
         
    query_dishes="SELECT DISHES_THEY_MAKE FROM CHEF where name=%s"
    cursor.execute(query_dishes,(chef_name,))
    results=list(cursor.fetchall()[0])[0]
    results_=results.split(",")
    results_= [dish.strip() for dish in results_]
    results_.append(dish_name)
    combined_string = ', '.join(results_)
    query3="UPDATE chef set dishes_they_make=%s where name=%s"
    cursor.execute(query3,(combined_string,chef_name))
        
    connection.commit()
    
    print("\nRecipe added successfully!")
    connection.close()

# Function to update an existing recipe (Editor only)
def update_recipe():
    connection = connect_db()
    cursor = connection.cursor()
    
    chef_name=input("Enter the chef's name: ")
    dish_id = int(input("Enter the recipe ID to update: "))
    dish_name = input("Enter the new dish name (leave blank to keep current): ")
    category = input("Enter the new category (leave blank to keep current): ")
    ingredients=input("Enter the ingredients (leave blank to keep current): ")
    instructions = input("Enter the new instructions (leave blank to keep current): ")
    prep_time = input("Enter the new preparation time (HH:MM:SS, leave blank to keep current): ")
    cook_time = input("Enter the new cook time (HH:MM:SS, leave blank to keep current): ")
    rating = input("Enter the new rating (leave blank to keep current): ")
    chef_name_list=chef_name.split()
    query1 = "UPDATE dishes SET "
    query2=f"UPDATE {chef_name_list[0]}_{chef_name_list[1]}_Recipes SET "
    query3=f"SELECT id from dishes where name in (SELECT dish_name from {chef_name_list[0]}_{chef_name_list[1]}_Recipes where id=%s) "
    cursor.execute(query3,(dish_id,))
    results=cursor.fetchall()[0][0]
    updates_dishes = []
    updates_recipes=[]
    params_dishes = []
    params_recipes =[]
    
    if dish_name:
        updates_dishes.append("name = %s")
        updates_recipes.append("dish_name = %s")
        params_dishes.append(dish_name)
        params_recipes.append(dish_name)
    if category:
        updates_dishes.append("category = %s")
        updates_recipes.append("category = %s")
        params_dishes.append(category)
        params_recipes.append(category)
    if instructions:
        updates_recipes.append("ingredients = %s")
        params_recipes.append(ingredients)
    if instructions:
        updates_recipes.append("instructions = %s")
        params_recipes.append(instructions)
    if prep_time:
        updates_recipes.append("prep_time = %s")
        params_recipes.append(prep_time)
    if cook_time:
        updates_recipes.append("cook_time = %s")
        params_recipes.append(cook_time)
    if rating:
        updates_recipes.append("rating = %s")
        params_recipes.append(rating)
    
    query1 += ", ".join(updates_dishes) + " WHERE id = %s"
    query2 += ", ".join(updates_recipes) + " WHERE id = %s"
    params_dishes.append(results)
    params_recipes.append(dish_id)
    if updates_dishes!=[]:
        cursor.execute(query1, tuple(params_dishes))
    cursor.execute(query2, tuple(params_recipes))
    connection.commit()
    
    print("\nRecipe updated successfully!")
    connection.close()

# Function to delete a recipe (Editor only)
def delete_recipe():
    connection = connect_db()
    cursor = connection.cursor()
    chef_name=input("Enter the chef's name: ")
    chef_name_list=chef_name.split()
    recipe_id = int(input("Enter the recipe ID to delete: "))
    query = f"DELETE FROM {chef_name_list[0]}_{chef_name_list[1]}_Recipes WHERE id = %s"
    query_name=f"SELECT dish_name FROM {chef_name_list[0]}_{chef_name_list[1]}_Recipes where id=%s"
    cursor.execute(query_name,(recipe_id,))
    results_name=cursor.fetchall()[0][0]
    cursor.execute(query, (recipe_id,))

    
    query2="SELECT DISHES_THEY_MAKE FROM CHEF where name=%s"
    cursor.execute(query2,(chef_name,))
    results=list(cursor.fetchall()[0])[0]
    results_=results.split(",")
    results_= [dish.strip() for dish in results_]
    results_.remove(results_name)
    combined_string = ', '.join(results_)
    
    query3="UPDATE chef set dishes_they_make=%s where name=%s"
    cursor.execute(query3,(combined_string,chef_name))
    connection.commit()

    print("\nRecipe deleted successfully!")
    connection.close()

if __name__ == "__main__":
    role = None
    while not role:
        role = login()
    
    if role == "editor":
        editor_menu()
    elif role == "viewer":
        viewer_menu()
