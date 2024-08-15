#!/Users/deorz/.config/sketchybar/utils/.venv/bin/python

from sys import argv


def main(weather: str) -> str:
    weather, *_ = weather.split(": ")
    weather = weather.strip()
    icon_mapping = {
        "Clear": "􀆫",
        "Sunny": "􀆭",
        "Partly cloudy": "􀇔",
        "Cloudy": "􀇂",
        "Overcast": "􀇂",
        "Mist": "􀇊",
        "Patchy rain possible": "􀇆",
        "Patchy snow possible": "􀇎",
        "Patchy sleet possible": "􀇐",
        "Patchy freezing drizzle possible": "􀇄",
        "Thundery outbreaks possible": "􀇒",
        "Blowing snow": "􀇎",
        "Blizzard": "􀇎",
        "Fog": "􀇊",
        "Freezing fog": "􀇊",
        "Patchy light drizzle": "􀇄",
        "Light drizzle": "􀇄",
        "Freezing drizzle": "􀇄",
        "Heavy freezing drizzle": "􀇄",
        "Patchy light rain": "􀇆",
        "Light rain": "􀇆",
        "Moderate rain at times": "􀇆",
        "Moderate rain": "􀇆",
        "Heavy rain at times": "􀇈",
        "Heavy rain": "􀇈",
        "Light freezing rain": "􀇆",
        "Moderate or heavy freezing rain": "􀇈",
        "Light sleet": "􀇐",
        "Moderate or heavy sleet": "􀇐",
        "Patchy light snow": "􀇎",
        "Light snow": "􀇎",
        "Patchy moderate snow": "􀇎",
        "Moderate snow": "􀇎",
        "Patchy heavy snow": "􀇎",
        "Heavy snow": "􀇎",
        "Ice pellets": "􀇥",
        "Light rain shower": "􀇆",
        "Moderate or heavy rain shower": "􀇆",
        "Torrential rain shower": "􀇆",
        "Light sleet showers": "􀇐",
        "Moderate or heavy sleet showers": "􀇐",
        "Light snow showers": "􀇎",
        "Moderate or heavy snow showers": "􀇎",
        "Patchy light rain with thunder": "􀇞",
        "Moderate or heavy rain with thunder": "􀇞",
        "Patchy light snow with thunder": "􀇞",
        "Moderate or heavy snow with thunder": "􀇞",
        "Patchy rain nearby": "􀇆",
    }
    return icon_mapping.get(weather, "􀇂")


if __name__ == "__main__":
    try:
        print(main(weather=argv[-1]))
    except IndexError:
        print("􀇂")
