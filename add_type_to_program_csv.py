import csv

# define input and output file paths
input_file = './Data/program.csv'
output_file = './program.csv'

# open input and output files
with open(input_file, 'r', encoding='utf8') as f_in, open(output_file, 'w', newline='', encoding='utf8') as f_out:
    reader = csv.DictReader(f_in)  # create a dictionary reader for input file
    # add new field 'types' to fieldnames
    fieldnames = reader.fieldnames + ['type']
    # create a dictionary writer for output file
    writer = csv.DictWriter(f_out, fieldnames)
    writer.writeheader()  # write the header row to output file

    # iterate over each row of input file and add new column
    for row in reader:
        if 'min' in row['duration']:  # check if 'min' is in the 'duration' field
            row['type'] = 'Movie'  # add new column with value 'TV Show'
        else:
            row['type'] = 'TV Show'  # add new column with value 'Movie'

        # remove non-numeric characters
        duration = ''.join(filter(str.isdigit, row['duration']))
        if duration:  # if duration is empty
            row['duration'] = int(duration)  # convert 'duration' to integer
        else:
            row['duration'] = 0
        writer.writerow(row)  # write updated row to output file
