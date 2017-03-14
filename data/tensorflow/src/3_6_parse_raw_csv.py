import csv
import time

# via https://data.lacity.org/A-Well-Run-City/311-Call-Center-Tracking-Data-Archived-/ukiu-8trj
# curl 'https://data.lacity.org/api/views/ukiu-8trj/rows.csv?accessType=DOWNLOAD' > 311.csv 
#   will take about 13 min for 257 MB
#
def read(filename, date_idx, date_parse, year, bucket=7):
    days_in_year = 365

    freq = {}
    for period in range(0, int(days_in_year / bucket)):
        freq[period] = 0

    with open(filename, 'r') as csvfile:
        csvreader = csv.reader(csvfile)
        next(csvreader)
        for row in csvreader:
            t = time.strptime(row[date_idx], date_parse)
            if t.tm_year == year and t.tm_yday < (days_in_year-1):
                freq[int(t.tm_yday / bucket)] += 1
    return freq

#freq = read('311_short.csv', 0, '%m/%d/%Y', 2014)
freq = read('311.csv', 0, '%m/%d/%Y', 2014)
print(freq)
