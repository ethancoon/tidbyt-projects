load("render.star", "render")
load("time.star", "time")

# plan: top image will change depending on time of day
# may also change color of text for hour marks (4:00, 12:00)

def main(config):
    timezone = config.get("timezone") or "America/New_York"
    now = time.now().in_location(timezone)

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
                            ),
                            render.Text(
                                content = now.format("3 04 PM"),
                                font = "6x13",
                            ),
                        ],
                    ),
                ),            
            ],
        ),
    )