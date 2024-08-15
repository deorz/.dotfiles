#!/Users/deorz/.config/sketchybar/utils/.venv/bin/python

import requests
import geocoder


def get_geolocation():
    # Get the location based on IP address
    g = geocoder.ip("me")
    return g.latlng


def get_weather(lat, lng):
    # Construct the URL for wttr.in with geolocation
    url = f"https://wttr.in/{lat},{lng}?format=%C:+%t"
    response = requests.get(url)
    return response.text


def main():
    try:
        # Get current geolocation
        location = get_geolocation()
        if location:
            lat, lng = location
            # Get the weather for the current location
            weather = get_weather(lat, lng)
            print(weather)
        else:
            print("Could't determine geolocation.")
    except Exception:
        print("Could't fetch weather")


if __name__ == "__main__":
    main()
