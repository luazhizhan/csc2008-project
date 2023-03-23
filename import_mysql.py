import csv

# with open('./Data/netflix_titles.csv', 'r', encoding = 'utf-8') as input_file:
#     reader = csv.reader(input_file)

#     # Open a new CSV file for writing
#     with open('output9.csv', 'w', newline='', encoding = 'utf-8') as output_file:
#         writer = csv.writer(output_file)

#         # Loop over each row in the input file
#         for row in reader:
#             # Get the row number and names
#             row_number = row[0]
#             names = row[1]
# #             date = row[2]
# #             year = row[3]

#             # Check if the names column is empty
#             if not names.strip():
#                 writer.writerow([row_number, "",date,year])

#             # Split the names by comma
#             name_list = names.split(',')

#             # Loop over each name and write a new row with the original row number
#             for name in name_list:
#                 writer.writerow([row_number, name.strip(),date,year])

# Open the actor ID to name mapping CSV file for reading
# with open('Country.csv', 'r', encoding='utf-8') as actor_file:
#     actor_reader = csv.reader(actor_file)

#     # Create a dictionary to map actor names to IDs
#     actor_dict = {}
#     for actor_row in actor_reader:
#         actor_id = actor_row[0]
#         actor_name = actor_row[1]
#         actor_dict[actor_name] = actor_id

# # Open the input CSV file for reading
with open('output9.csv', 'r', encoding='utf-8') as input_file:
    reader = csv.reader(input_file)

    # Open a new CSV file for writing
    with open('Release2.csv', 'w', newline='', encoding='utf-8') as output_file:
        writer = csv.writer(output_file)

        # Loop over each row in the input file
        for row in reader:
            # Get the ID and name from the input file
            actor_id = row[0]
            actor_name = row[1]
            # date = row[2]
            # year = row[3]

            if actor_name == "":
                writer.writerow([actor_id, "",date,year])
                continue

            # Lookup the actor ID in the dictionary
            if actor_name in actor_dict:
                actor_name = actor_dict[actor_name]

            # Write the new row with the updated actor ID
            writer.writerow([actor_id, actor_name,date,year])
