import os
import csv

def check_files_missing():
    # At some point during the whole research process, I noticed that two spreadsheet files were missing from
    # the sample of projects extracted from GitHub. I compared the files existing in here with the files
    # reported in documentation_analysis.xlsx and found that electron/electron and facebook/hhvm were missing. 
    # I don't know exactly what happened, but it was probably a human mistake while I was organizing the
    # spreadsheets in folders for the replication package. I fixed the problem by moving a new copy of
    # these two files to the folder of spreadsheets for prediction.
    filenames = []
    with open('files.csv', 'w', encoding='utf-8', newline='') as csv_file:
        writer = csv.DictWriter(csv_file, fieldnames=['file', 'folder'])
        writer.writeheader()

        for path, subdir, files in os.walk('./'):
            for name in files:
                filenames.append(name)

    input_file = open('extracted_files.csv', 'r')
    reader = csv.DictReader(input_file, fieldnames=['owner', 'project', 'is_valid'])

    for row in reader:
        if row['is_valid'] == 'TRUE':
            filename = row['owner'] + '@' + row['project'] + '.xlsx'
            
            if filename not in filenames:
                print(filename)

    # Output:
    # electron@electron.xlsx
    # facebook@hhvm.xlsx

def check_spreadsheet_moved_by_mistake():
    # I also noticed that at some point I moved one spreadsheet in the training folder that wasn't used for training.
    # I compared the files inside the 'for-training' folder with the files reported as part of the training set in the documentation_analysis.xlsx.
    # I found that the file deepmind@trfl.xlsx was moved by mistake into this folder. I fixed the problem by moving this file to the folder of spreadsheets
    # for prediction. 
    filenames = []
    input_file = open('training_files.csv', 'r')
    reader = csv.DictReader(input_file, fieldnames=['project'])

    for row in reader:
        filenames.append(row['project'])

    for path, subdir, files in os.walk('./'):
        for name in files:
            if 'for-training' in path:
                if name not in filenames:
                    print(name)

# check_files_missing()
# check_spreadsheet_moved_by_mistake()