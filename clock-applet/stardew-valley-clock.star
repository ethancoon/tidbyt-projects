load("render.star", "render")
load("encoding/base64.star", "base64")

CLOCK_ICON = base64.decode("""iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAAdVJREFUaEPlmb9KBDEQh3PFVVY2gmAliFjIdaediJW9jyBuJYgPIsJV6zPYW/kA2h1WIlxlZWNlZRFJvHi5uPn/m5jFtMsm832ZmR3YAfvna/BH/NxxbtGYSh72Az0at1b+6WOjPyOPj/wAxpgEd0HbbGgyyOIk23gOxVPATSFzESSxkmyKhFcyqCRQCeAn51fs5WEF1mO39j7Y7eRS7AeNGbqZunkBrxZCgoBXCy0BLUDevLlyJOjwFBKKCBCBp0joghd7IbMAKaDz9vVsiJFgg0dnQVEBoZngg0dmQXEBPgkh8DUK8KZ/SGMMhUeWASoDogWYmRACv7F7tOTx+myUPRfABFzcTK1Dz+vTvfWZaIyHp/tJA1NvBLjoBIRLnu/d3MmwSAbYIHYO1lkzG7J28zMpA5rttXpKoH1+S4OYDeV7KRJ6L0Dcvr5iJdQkQHDwmCww4WNFIOCz68fI+WABLvhQEb0UEApuNpOu0qhRgLMMUuGVDF0CCh5dAlYBufC/Pi/Hq7DYUXOAHuNSL6gZHmaxYwDg7O49aS5wvgS8eXUORQaovbESCOApMwArgQi+hADZGKWNlJL4BieNk7IEzHJe/BB1yVhAk4KTm/V0wGr+Dn8BCpurIU0DrUEAAAAASUVORK5CYII=""")


def main():
    return render.Root(
        child = render.Circle(
            color = "#630",
            diameter = 33,
            child = render.Image(
                src = CLOCK_ICON
                # child = render.Column(
                #     main_align = "space_between",
                #     expanded = True,
                #     children = [ 
                #         render.Circle(
                #             color = "#077",
                #             diameter = 4
                #         ),
                #         render.Circle(
                #             color = "#CE3",
                #             diameter = 4,
                #         )
                #     ],
                # ),
            ),
        ),
    )