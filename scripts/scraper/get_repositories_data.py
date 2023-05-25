import csv
import pandas
from api_scraper import Create

# This code was implemented to respond an FSE reviewer. It is not part of our replication package.    

def get_contributors():
    dataframe = pandas.read_excel('repositories.xlsx')
    output_file = open('repositories_contributors.csv', 'w', newline='')
    writer = csv.writer(output_file)
    writer.writerow(['owner', 'name', 'is_valid', 'n_contributors'])

    for index, row in dataframe.iterrows():
        try:
            owner, name, is_valid = row['Owner'], row['Name'], row['Is Valid?']
            print('Collecting data from {}/{}'.format(owner, name))

            api_scraper = Create()

            num_contributors = 0
            contributors_query = 'https://api.github.com/repos/%s/%s/contributors?per_page=100' % (owner, name)
            contributors_response = api_scraper.request(contributors_query, file_type='response')
            num_contributors += len(contributors_response.json())

            while 'next' in contributors_response.links:
                contributors_query = contributors_response.links['next']['url']
                contributors_response = api_scraper.request(contributors_query, file_type='response')
                num_contributors += len(contributors_response.json())

            writer.writerow([owner, name, is_valid, num_contributors])

        except:
            try:
                with open('ignored.txt', 'a') as ignored_file:
                    ignored_file.write(str(owner) + '/' + str(name) + '\n')
            except:
                print("Problema.")

def get_repositories_data():
    dataframe = pandas.read_excel('repositories.xlsx')
    output_file = open('repositories_info.csv', 'w', newline='')
    writer = csv.writer(output_file)
    writer.writerow(['owner', 'name', 'is_valid', 'language', 'n_issues', 'n_prs', 'n_stars', 'n_forks'])

    for index, row in dataframe.iterrows():
        try:
            owner, name, is_valid = row['Owner'], row['Name'], row['Is Valid?']
            print('Collecting data from {}/{}'.format(owner, name))


            api_scraper = Create()

            # pull-requests
            graphql_query = """
            {
            repository(name: "%s", owner: "%s") {
                issues {
                    totalCount
                }
                pullRequests(orderBy: {field: CREATED_AT, direction: ASC}, first: 1) {
                    totalCount
                    edges {
                        node {
                            closedAt
                        }
                    }
                }
                stargazers {
                    totalCount
                }
                forks {
                    totalCount
                }
                primaryLanguage {
                    name
                }
            }
            }
            """ % (name, owner)

            query_response = api_scraper.graphql_request(graphql_query)
            num_issues = query_response['data']['repository']['issues']['totalCount']
            num_pull_requests = query_response['data']['repository']['pullRequests']['totalCount']
            num_stars = query_response['data']['repository']['stargazers']['totalCount']
            num_forks = query_response['data']['repository']['forks']['totalCount']
            first_language = query_response['data']['repository']['primaryLanguage']['name']
            first_pull_request_date = query_response['data']['repository']['pullRequests']['edges'][0]['node']['closedAt']

            writer.writerow([owner, name, is_valid, first_language, num_issues, num_pull_requests, num_stars, num_forks])

        except:
            with open('ignored.txt', 'a') as ignored_file:
                try:
                    ignored_file.write(str(owner) + '/' + str(name) + '\n')
                except:
                    ignored_file.write('Error. \n')


def organize_data():
    return