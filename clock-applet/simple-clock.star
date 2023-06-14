load("render.star", "render")
load("time.star", "time")
load("sunrise.star", "sunrise")
load("encoding/json.star", "json")
load("encoding/base64.star", "base64")


# current plan: icon at top will change depending on time of day
# two modes: sun after sunrise, and moon after sunset

DEFAULT_LOCATION = {
    "lat": "40.6781784",
	"lng": "-73.9441579",
	"description": "Brooklyn, NY, USA",
	"locality": "Brooklyn",
	"place_id": "ChIJCSF8lBZEwokRhngABHRcdoI",
	"timezone": "America/New_York"
}

sun = """iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAALJJREFUaEPtlsENwCAMA2EBZukEHb4TMAsLUIEEopXaZ2wR90VfsS8OJAbnX3TuPwiAEuCcAHwE6pXq2oN4FlNNpsVWo9P4UZ4ZzKn/W4HAAnibHyhy2htA7/6XeWMIkAQIgBLgfATamP+Owe6X4ATQDl6fwXHZu12EWDZwyDPIYr5vnExiEFoEAEGdqaYSwNQNhBYlAEGdqaYSwNQNhBYlAEGdqaYSwNQNhBYlAEGdqeYNN9o4Ie8+jk4AAAAASUVORK5CYII="""

moon = """iVBORw0KGgoAAAANSUhEUgAAADQAAAAKCAYAAAD7CH02AAAAAXNSR0IArs4c6QAAALRJREFUSEtjZEAC/////8/IyMiILEZtdnH+6/+9E0VpZgfVDCYmMECeCQphZVi35jcDuZ4iZA/FHsJlAbo4zDOwGCfkKUIOx5VyiPIQuYYjW0qqh4hN6uhuI8pDxBqOSx26Z0DqCMUQuXYOCg9RIwXAAgDDQ9Q0HBQzIItABQEyoEbs4HInVWMI2RJsyQxfgUCtgCTbQ/gcQKpniMkvxHgYrAZkGDGKibEUvVTDpofc+odY+wE4E4QH7t5qlgAAAABJRU5ErkJggg=="""

def get_clock_color(minute):
    # Will return purple if it is the start of an hour (4:00, 12:00), else white
    return "#60F" if minute == 0 else "#FFF"

def get_icon(sunrise, sunset, now):
    if sunrise.unix < now.unix and sunset.unix > now.unix:
        return render.Box(
            height = 14,
            child = render.Image(src = base64.decode(sun))
        )
    else:
        return render.Box(
            height = 14,
            child = render.Image(src = base64.decode(moon))
        )

def main(config):
    # location = json.decode(config.get("location"))
    location = json.decode(str(DEFAULT_LOCATION))
    lat = float(location["lat"])
    lng = float(location["lng"])
    
    now = time.now().in_location(location["timezone"])
    sunrise_time = sunrise.sunrise(lat, lng, now).in_location(location["timezone"])
    sunset_time = sunrise.sunset(lat, lng, now).in_location(location["timezone"])
    
    minute = now.minute

    return render.Root(
        delay = 500,
        child = render.Column(
            expanded = True,
            main_align = "space_around",
            cross_align = "center",
            children = [
                get_icon(sunrise_time, sunset_time, now),
                render.Box(
                    child = render.Animation(
                        children = [
                            render.Text(
                                content = now.format("3:04 PM"),
                                font = "6x13",
                                color = get_clock_color(minute)
                            ),
                            render.Text(
                                content = now.format("3 04 PM"),
                                font = "6x13",
                                color = get_clock_color(minute)
                            ),
                        ],
                    ),
                ),            
            ],
        ),
    )