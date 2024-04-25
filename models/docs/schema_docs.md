############################################################################################################# 
                                            STAGING MODELS
#############################################################################################################
{% docs column___time %}
Date of the weather observation.
{% enddocs %}

{% docs column__aicraft_age %}
The age of the aircraft in years.
{% enddocs %}

{% docs column__airline %}
The airline that operated the flight.
{% enddocs %}

{% docs column__airport %}
The official name of the airport.
{% enddocs %}

{% docs column__airport_id %}
The three-letter code of the arrival airport.
{% enddocs %}

{% docs column__arr_airport %}
The three-letter code of the arrival airport.
{% enddocs %}

{% docs column__arr_cityname %}
The city name of the arrival airport.
{% enddocs %}

{% docs column__arr_delay %}
The arrival delay in minutes.
{% enddocs %}

{% docs column__arr_delay_type %}
The type of delay that occurred at arrival.
{% enddocs %}

{% docs column__cancelled %}
Indicates if the flight was cancelled.
{% enddocs %}

{% docs column__city %}
The city or major town nearest the airport.
{% enddocs %}

{% docs column__country %}
The country where the airport is located.
{% enddocs %}

{% docs column__day_of_week %}
The day of the week.
{% enddocs %}

{% docs column__delay_carrier %}
Encoded value representing delay attributable to the carrier (0 - No Delay, 1 - Delay).
{% enddocs %}

{% docs column__delay_lastaircraft %}
Encoded value representing delay attributable to the previous aircraft (0 - No Delay, 1 - Delay).
{% enddocs %}

{% docs column__delay_nas %}
Encoded value representing delay attributable to National Airspace System (0 - No Delay, 1 - Delay).
{% enddocs %}

{% docs column__delay_security %}
Encoded value representing delay attributable to security (0 - No Delay, 1 - Delay).
{% enddocs %}

{% docs column__delay_weather %}
Encoded value representing delay attributable to weather (0 - No Delay, 1 - Delay).
{% enddocs %}

{% docs column__dep_airport %}
The three-letter code of the departure airport.
{% enddocs %}

{% docs column__dep_cityname %}
The city name of the departure airport.
{% enddocs %}

{% docs column__dep_delay %}
The departure delay in minutes.
{% enddocs %}

{% docs column__dep_delay_tag %}
Textual description of the departure delay.
{% enddocs %}

{% docs column__dep_delay_type %}
The type of delay that occurred at departure.
{% enddocs %}

{% docs column__deptime_label %}
Category describing the departure time (e.g., Morning, Afternoon, Evening).
{% enddocs %}

{% docs column__distance_type %}
Category describing the flight distance.
{% enddocs %}

{% docs column__diverted %}
Indicates if the flight was diverted.
{% enddocs %}

{% docs column__flight_duration %}
The duration of the flight in minutes.
{% enddocs %}

{% docs column__flightdate %}
The date of the flight.
{% enddocs %}

{% docs column__iata_code %}
The three-letter code assigned by the International Air Transport Association (IATA) to uniquely identify an airport.
{% enddocs %}

{% docs column__latitude %}
The geographic coordinate specifying the north-south position of the airport in decimal degrees.
{% enddocs %}

{% docs column__loaded_at %}
The time the data was ingested
{% enddocs %}

{% docs column__longitude %}
The geographic coordinate specifying the east-west position of the airport in decimal degrees.
{% enddocs %}

{% docs column__manufacturer %}
The manufacturer of the aircraft.
{% enddocs %}

{% docs column__model %}
The model of the aircraft.
{% enddocs %}

{% docs column__prcp %}
Total precipitation for the period.
{% enddocs %}

{% docs column__pres %}
Atmospheric pressure in millibars.
{% enddocs %}

{% docs column__snow %}
Total snowfall for the period.
{% enddocs %}

{% docs column__state %}
The U.S. states where the airport is located.
{% enddocs %}

{% docs column__tail_number %}
The tail number of the aircraft.
{% enddocs %}

{% docs column__tavg %}
Average temperature for the period.
{% enddocs %}

{% docs column__tmax %}
Maximum temperature for the period.
{% enddocs %}

{% docs column__tmin %}
Minimum temperature for the period.
{% enddocs %}

{% docs column__wdir %}
Wind direction in degrees (from which direction the wind is blowing).
{% enddocs %}

{% docs column__wspd %}
Wind speed in knots.
{% enddocs %}

#############################################################################################################
                                            INTERMEDIATE MODELS
#############################################################################################################
{% docs __time %}
Date of the weather observation.
{% enddocs %}

{% docs _aicraft_age %}
The age of the aircraft in years.
{% enddocs %}

{% docs _airline %}
The airline that operated the flight.
{% enddocs %}

{% docs _airport %}
The official name of the airport.
{% enddocs %}

{% docs _airport_id %}
The three-letter code of the arrival airport.
{% enddocs %}

{% docs _arr_airport %}
The three-letter code of the arrival airport.
{% enddocs %}

{% docs _arr_cityname %}
The city name of the arrival airport.
{% enddocs %}

{% docs _arr_delay %}
The arrival delay in minutes.
{% enddocs %}

{% docs _arr_delay_type %}
The type of delay that occurred at arrival.
{% enddocs %}

{% docs _cancelled %}
Indicates if the flight was cancelled.
{% enddocs %}

{% docs _city %}
The city or major town nearest the airport.
{% enddocs %}

{% docs _country %}
The country where the airport is located.
{% enddocs %}

{% docs _day_of_week %}
The day of the week.
{% enddocs %}

{% docs _delay_carrier %}
Encoded value representing delay attributable to the carrier (0 - No Delay, 1 - Delay).
{% enddocs %}

{% docs _delay_lastaircraft %}
Encoded value representing delay attributable to the previous aircraft (0 - No Delay, 1 - Delay).
{% enddocs %}

{% docs _delay_nas %}
Encoded value representing delay attributable to National Airspace System (0 - No Delay, 1 - Delay).
{% enddocs %}

{% docs _delay_security %}
Encoded value representing delay attributable to security (0 - No Delay, 1 - Delay).
{% enddocs %}

{% docs _delay_weather %}
Encoded value representing delay attributable to weather (0 - No Delay, 1 - Delay).
{% enddocs %}

{% docs _dep_airport %}
The three-letter code of the departure airport.
{% enddocs %}

{% docs _dep_cityname %}
The city name of the departure airport.
{% enddocs %}

{% docs _dep_delay %}
The departure delay in minutes.
{% enddocs %}

{% docs _dep_delay_tag %}
Textual description of the departure delay.
{% enddocs %}

{% docs _dep_delay_type %}
The type of delay that occurred at departure.
{% enddocs %}

{% docs _deptime_label %}
Category describing the departure time (e.g., Morning, Afternoon, Evening).
{% enddocs %}

{% docs _distance_type %}
Category describing the flight distance.
{% enddocs %}

{% docs _diverted %}
Indicates if the flight was diverted.
{% enddocs %}

{% docs _flight_duration %}
The duration of the flight in minutes.
{% enddocs %}

{% docs _flight_date %}
The date of the flight.
{% enddocs %}

{% docs _airport_code %}
The three-letter code assigned by the International Air Transport Association (IATA) to uniquely identify an airport.
{% enddocs %}

{% docs _latitude %}
The geographic coordinate specifying the north-south position of the airport in decimal degrees.
{% enddocs %}

{% docs _loaded_at %}
The time the data was ingested
{% enddocs %}

{% docs _longitude %}
The geographic coordinate specifying the east-west position of the airport in decimal degrees.
{% enddocs %}

{% docs _manufacturer %}
The manufacturer of the aircraft.
{% enddocs %}

{% docs _model %}
The model of the aircraft.
{% enddocs %}

{% docs _prcp %}
Total precipitation for the period.
{% enddocs %}

{% docs _pres %}
Atmospheric pressure in millibars.
{% enddocs %}

{% docs _snow %}
Total snowfall for the period.
{% enddocs %}

{% docs _state %}
The U.S. states where the airport is located.
{% enddocs %}

{% docs _tail_number %}
The tail number of the aircraft.
{% enddocs %}

{% docs _tavg %}
Average temperature for the period.
{% enddocs %}

{% docs _tmax %}
Maximum temperature for the period.
{% enddocs %}

{% docs _tmin %}
Minimum temperature for the period.
{% enddocs %}

{% docs _wdir %}
Wind direction in degrees (from which direction the wind is blowing).
{% enddocs %}

{% docs _wspd %}
Wind speed in knots.
{% enddocs %}

