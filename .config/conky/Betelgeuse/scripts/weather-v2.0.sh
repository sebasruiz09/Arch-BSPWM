#!/bin/bash

city_id=3689560

api_key=a61799ff43ae6d0166af1f62eac82500

unit=metric

lang=en

url="api.openweathermap.org/data/2.5/weather?id=${city_id}&appid=${api_key}&cnt=5&units=${unit}&lang=${lang}"
curl ${url} -s -o ~/.config/conky/Betelgeuse/.cache/weather.json

exit
