# Prepare data for use in FastText (Meta)
import pandas
from collections import OrderedDict

test_set = pandas.read_csv('test.csv')
train_set = pandas.read_csv('train.csv')

with open('train_fasttext.txt', 'w', encoding='utf-8') as train_file:
    for index, row in train_set.iterrows():
        paragraph, label = row['Paragraph'], row['Label']
        train_file.write('__label__' + str(label[:2]).lower() + ' ' + str(paragraph).replace('\n', '') + '\n')

with open('test_fasttext.txt', 'w', encoding='utf-8') as test_file:
    for index, row in test_set.iterrows():
        paragraph, label = row['Paragraph'], row['Label']
        test_file.write('__label__' + str(label[:2]).lower() + ' ' + str(paragraph).replace('\n', '') + '\n')