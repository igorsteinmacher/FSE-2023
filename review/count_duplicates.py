# Count the number of duplicates in the test set
# Also deploys a new test set without duplicates
import pandas
from collections import OrderedDict

test_set = pandas.read_csv('test.csv')
train_set = pandas.read_csv('train.csv')

duplicates = OrderedDict()
total_duplicates = 0

print(len(test_set.index))

for index, row in train_set.iterrows():
    if row['Paragraph'] in test_set['Paragraph'].value_counts() and row['Paragraph'] not in duplicates.keys():
        num_occurrences = test_set['Paragraph'].value_counts()[row['Paragraph']]
        duplicates[row['Paragraph']] = num_occurrences
        total_duplicates += num_occurrences
        test_set = test_set[test_set['Paragraph'] != row['Paragraph']]

print(duplicates)
# test_set.to_csv('test_without_duplicates.csv', encoding='utf-8', index=False)