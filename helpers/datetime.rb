# Use these helpers to format your database timestamps (eg - created_at).

# => Dec 23 (OR if it was last year) => Dec 2012
def simple_date(date)
  if Time.now.strftime("%Y") == date.strftime("%Y")
    date.strftime("%h %e")
  else
    date.strftime("%h %Y")
  end
end
# => December 23, 2013
def format_date(date)
  date.strftime("%B %e, %Y")
end
# => 1pm
def simple_time(time)
  time.strftime("%l%P")
end
# => 07:27:52 PM
def format_time(time)
  time.strftime("%I:%M:%S %p")
end