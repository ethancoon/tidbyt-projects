load("render.star", "render")
load("time.star", "time")

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

ICONS = {
    "sun": """iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAALlJREFUaEPtlcsNgDAMQ9sN2AcxPWIfNigqoojfoUhOlCjuGRL32UlzCn5y8PsnAmACghPgCCgHoBz9zIDXFlKWeU3jNFQO2r0/vdYWsQOoxwoETQDn5QkgYAJu7kdKwL7129y3LWRl/qU38cv1i/PSvbtfd8kl2N78pxjJnt0Xbx+aEvNbPeAHAgBAdF2CCXBtH0A8EwCA6LoEE+DaPoB4JgAA0XUJJsC1fQDxTAAAousSTIBr+wDiN0rsHiHos/QUAAAAAElFTkSuQmCC"""

    "moon": """iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAALJJREFUaEPtlsENwCAMA2EBZukEHb4TMAsLUIEEopXaZ2wR90VfsS8OJAbnX3TuPwiAEuCcAHwE6pXq2oN4FlNNpsVWo9P4UZ4ZzKn/W4HAAnibHyhy2htA7/6XeWMIkAQIgBLgfATamP+Owe6X4ATQDl6fwXHZu12EWDZwyDPIYr5vnExiEFoEAEGdqaYSwNQNhBYlAEGdqaYSwNQNhBYlAEGdqaYSwNQNhBYlAEGdqeYNN9o4Ie8+jk4AAAAASUVORK5CYII="""
}


def get_clock_color(minute):
    # Will return purple if it is the start of an hour (4:00, 12:00), else white
    return "#60F" if minute == 0 else "#FFF"

def get_icon():
    

def main(config):
    # Obtaining the timezone given, or a default timezone if none is given.
    timezone = config.get("timezone") or "America/New_York"
    # The current time in the location specified by the timezone
    now = time.now().in_location(timezone)
    # The current minute of the day
    minute = now.minute

    return render.Root(
        delay = 500,
        child = render.Column(
            expanded = True,
            main_align = "space_around",
            cross_align = "center",
            children = [
                render.Box(
                    height = 15,
                    child = render.Circle(
                        color = "#ff0",
                        diameter = 10,  
                    ),  
                ),
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