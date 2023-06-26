import pandas
from api_scraper import Create

file_formats = open('file_formats.csv', 'w')
file_formats.write('url, extension, reason_for_invalidation\n')
projects = pandas.read_excel('repositories.xlsx', 'Repositories')
scraper = Create()

for index, project in projects.iterrows():
    is_valid = project['is_valid']

    if not is_valid:
        owner, name, invalid_reason = project['owner'], project['name'], project['reasons_for_invalidation']
        
        if 'contributing is not in Markdown.' in invalid_reason:
            profile = scraper.request('https://api.github.com/repos/{}/{}/community/profile'.format(owner, name))

            try:
                url = profile['files']['contributing']['url']
                extension = str(url).split('.')[-1]
                file_formats.write(url + ',' + extension + ',' + invalid_reason + '\n')
            except:
                print(profile)

