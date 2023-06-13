load("render.star", "render")
load("time.star", "time")

def get_clock_color(minute):
    # Will return purple if it is the start of an hour (4:00, 12:00), else white
    return "#60F" if minute == 0 else "#FFF"

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