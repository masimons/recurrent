## Task 1

### Description and Usage

This is a program that processes EV data (where the input is a csv). There are two queries you can make! If you'd like, you can run this command from the command line:

```
ruby ev_data_query.rb ev_data.csv average_daily_miles cat-car
```

and you will get back the average number of miles that `cat-car` drove over the time range where data is accessible.

Feel free to use the included ev_data.csv, or kindly point my program to the csv file of your choosing. Make sure you change the vehicle_id (`cat-car`) to an appropriate vehicle that exists in the data set.

You may swap out `average_daily_miles` for `charged_above`, if you don't care so much about miles driven, but prefer to learn about the number of vehicles that charged above a given percentage. This command will return the number of cars that charged above 33% over the time interval in the data set:

```
ruby ev_data_query.rb ev_data.csv charged_above 0.33
```

To run tests, you'll need rspec installed (`gem install rspec`), then run `rspec spec/` from the root dir.

### Considerations and Trade-offs
- I assumed that the data set wouldn't be too "big", for simplicity's case. If there was a data set with millions of rows, I would consider reading the file in batches. I'd also probably iterate over the rows in the file just once, as opposed to using fancy methods like `filter` and `map` a bunch of times. This would involve caching information like which vehicles we've iterated over so far that have seen a charge drop below the given percentage.
- I printed the query results to make it easier for the user to see them from the command line, but normally would just return the result.
- Improvements: I'd expand on error-handling, and run the inputs through more rigorous validations (e.g. make sure that the percentage was provided as an int/float and not a random string of non-numeric characters). I'd also flesh out the tests a bit more - I wrote a few to give an idea of what my tests would look like, but I would want to write a few more before checking the code in.

## Task 2
Your mission, should you choose to accept, is to write code that will return the number of vehicles that were not driven at all on a given date. Inputs will be a csv file (example attached), and a date. The code will be invoked from the command line as such:

```
ruby ev_data_query.rb ev_data.csv drove_nowhere 2020-01-01
```

You may find it useful to reference the car.rb file, where you will be able to see the structure in place to handle queries like this. The methods on `Car` are called from `QueryProcessor`, which is called in `ev_data_query.rb`.

Feel free to reach out to Marissa if you have questions about what's going on in those files. Also, feel free to refactor and improve as you see fit :)

Outstanding questions I submit for your consideration:
1) How to determine if a car didn't drive on a certain day if there's only 1 data point during that day (which may have been recorded right smack dab in the middle of the day). One approach might be to check if the car has been driven in the previous 24 hours, using the first data point that was collected more than 24 hours ago as reference.
2) How to handle the date input - my example above leaves off the time of day, but it's unclear whether that's desired. Maybe we want to include the timestamp, and use data from the previous 24 hours? Or maybe the expectation is that if a simple date is passed (`2020-01-01`), we should figure out if a car drove at all midnight to midnight that day.