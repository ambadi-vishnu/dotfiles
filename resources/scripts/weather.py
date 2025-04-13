#!/usr/bin/env python3

import sys
import argparse
import requests
from unidecode import unidecode
import jinja2

# API keys
owm_api_key = "xxxxxxxx"  # Replace with your actual OpenWeatherMap API key
ip2l_api_key = "xxxxxxxx"  # Replace with your actual ip2location.io API key

icons = {
    # clear
    800: '☀️',  # clear sky

    # clouds
    801: '🌤',  # few clouds
    802: '⛅️',  # scattered clouds
    803: '🌥',  # broken clouds
    804: '☁️',  # overcast clouds

    # drizzle
    300: '🌨',  # light intensity drizzle
    301: '🌨',  # drizzle
    302: '🌨',  # heavy intensity drizzle
    310: '🌨',  # light intensity drizzle rain
    311: '🌨',  # drizzle rain
    312: '🌨',  # heavy intensity drizzle rain
    313: '🌨',  # shower rain and drizzle
    314: '🌨',  # heavy shower rain and drizzle
    321: '🌨',  # shower drizzle

    # rain
    500: '🌨',  # light rain
    501: '🌨',  # moderate rain
    502: '🌨',  # heavy intensity rain
    503: '🌨',  # very heavy rain
    504: '🌨',  # extreme rain
    511: '🌨',  # freezing rain
    520: '🌨',  # light intensity shower rain
    521: '🌨',  # shower rain
    522: '🌨',  # heavy intensity shower rain
    531: '🌨',  # ragged shower rain

    # thunderstorm
    200: '⛈',  # thunderstorm with light rain
    201: '⛈',  # thunderstorm with rain
    202: '⛈',  # thunderstorm with heavy rain
    210: '⛈',  # light thunderstorm
    211: '⛈',  # thunderstorm
    212: '⛈',  # heavy thunderstorm
    221: '⛈',  # ragged thunderstorm
    230: '⛈',  # thunderstorm with light drizzle
    231: '⛈',  # thunderstorm with drizzle
    232: '⛈',  # thunderstorm with heavy drizzle

    # snow
    600: '❄️',  # light snow
    601: '❄️',  # Snow
    602: '❄️',  # Heavy snow
    611: '❄️',  # Sleet
    612: '❄️',  # Light shower sleet
    613: '❄️',  # Shower sleet
    615: '❄️',  # Light rain and snow
    616: '❄️',  # Rain and snow
    620: '❄️',  # Light shower snow
    621: '❄️',  # Shower snow
    622: '❄️',  # Heavy shower snow

    # atmosphere
    701: '',  # mist
    711: '',  # smoke
    721: '',  # haze
    731: '',  # sand/dust whirls
    741: '󰖑',  # fog
    751: '',  # sand
    761: '',  # dust
    762: '🌋',  # volcanic ash
    771: '💨',  # squalls
    781: '🌪',  # tornado
}


class _WeatherInfo():
    def __init__(self, raw_json_data):
        raw_weather = raw_json_data["weather"][0]
        raw_main = raw_json_data["main"]

        self._condition_id = raw_weather["id"]
        self.description_short = raw_weather["main"].lower()
        self.description_long = raw_weather["description"]
        self.temperature = raw_main["temp"]
        self.temperature_min = raw_main["temp_min"]
        self.temperature_max = raw_main["temp_max"]
        self.pressure = raw_main["pressure"]
        self.humidity = raw_main["humidity"]

        # Default icon for unknown conditions
        self.icon = icons.get(self._condition_id, '🌦')  # Default icon

    def __getitem__(self, item):
        return getattr(self, item)


class WeatherMan(object):
    def __init__(self, owm_api_key, city_id=None, lat=None, lon=None, units='metric'):
        self._api_key = owm_api_key
        self._units = units

        self._city_id = city_id
        self._gps = (lat, lon)

        self.city = ""
        self.current = None
        self.next = None

        if self._gps[0] is None or self._gps[1] is None:
            self._gps = (10.3554600, 76.128090)  # Default to Thrissur

        self._get_weather()

    def _get_weather(self):
        params = {
            'units': self._units,
            'appid': self._api_key,
        }

        if self._city_id is not None:
            params['id'] = self._city_id
        else:
            params['lat'] = self._gps[0]
            params['lon'] = self._gps[1]

        r = requests.get("http://api.openweathermap.org/data/2.5/forecast", params=params)
        d = r.json()

        if d['cod'] != '200':
            raise Exception("cannot get weather forecast", d['message'])

        self.city = d["city"]["name"]
        self._city_id = d["city"]["id"] if self._city_id is None else self._city_id
        self.current = _WeatherInfo(d["list"][0])
        self.next = _WeatherInfo(d["list"][1])

    def __getitem__(self, item):
        return getattr(self, item)


def get_public_ip():
    try:
        response = requests.get('https://api64.ipify.org?format=json')
        response.raise_for_status()
        data = response.json()
        return data['ip']
    except requests.exceptions.RequestException as e:
        print(f"Error retrieving public IP: {e}")
        return None


def get_location(ip_address):
    url = f'https://api.ip2location.io/?Key={ip2l_api_key}&ip={ip_address}'

    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()

        lat = data.get('latitude')
        lon = data.get('longitude')

        if lat and lon:
            return lat, lon
        else:
            print("Error: Could not extract latitude/longitude.")
            return None, None
    except requests.exceptions.RequestException as e:
        print(f"Error retrieving geolocation data: {e}")
        return None, None


def main(city_id, lat, lon, template):
    ip_address = get_public_ip()
    if ip_address:
        lat, lon = get_location(ip_address)
        if lat and lon:
            # Get weather data
            weather = WeatherMan(owm_api_key, city_id, lat, lon)
            t = jinja2.Template(template)
            print(t.render(city=weather.city, current=weather.current, next=weather.next))
        else:
            print("Could not retrieve location.")
            return
    else:
        print("Could not retrieve public IP address.")
        return


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        add_help=True, description='Print weather information for a location')

    parser.add_argument("--lat", action="store", dest="lat",
                        default=None, help="GPS latitude")
    parser.add_argument("--lon", action="store", dest="lon",
                        default=None, help="GPS longitude")
    parser.add_argument("--city-id", action="store", dest="city_id",
                        default=None, help="City ID by OpenWeatherMap")
    parser.add_argument("--output-format", action="store", dest="output_format",
                        default="{{city}} - {{current.description_long | title}} - {{current.temperature}}°C", help="Output format jinja template")

    try:
        args = parser.parse_args()
    except SystemExit as exception:
        print(exception)
    args, unknown = parser.parse_known_args()

    main(args.city_id, args.lat, args.lon, args.output_format)

