load("render.star", "render")

def main():
    return render.Root(
        child = render.Circle(
            color = "#630",
            diameter = 30,
            child = render.Circle(
                color = "#C60",
                diameter = 28
            ),
        ),
    )