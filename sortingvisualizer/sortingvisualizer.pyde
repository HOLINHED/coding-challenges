# How many data points the set has.
DATA = 200;

# Stores values
values = []

# variables for sort
x = 0
j = 0

# variables for display
comps = 0
swaps = 0

def setup():
    size(600,600)
    
    # Create random numbers from 0 to the height of the window
    for i in range(DATA):
        values.append(floor(random(0,height)))
        
    #for x in range(len(values)):
    #    for j in range(len(values) - x - 1):
    #        if (values[j] > values[j + 1]):
    #            temp = values[j]
    #            values[j] = values[j + 1]
    #            values[j + 1] = temp
    
    
def draw():
    background(50)
    
    global x, j, values, comps, swaps
    
    text("Comparisons: " + `comps`, 10, 20)
    text("Swaps: " + `swaps`, 10, 40)
    
    # Draw each rectanle
    for i in range(DATA):
        rect(i * (width/DATA), height-values[i], (width/DATA), values[i])
        
    comps += 1

    # Swaps if current value is greater than the next value
    if (values[j] > values[j + 1]):
        swaps += 1
        temp = values[j]
        values[j] = values[j + 1]
        values[j + 1] = temp
        
    j += 1
    
    # resets j when it gets to the end of the array
    if (j >= len(values) - x - 1):
        j = 0
        x += 1
        
    # stops looping when i reaches the end of the array
    if (x > len(values)):
        print("done!")
        noLoop()
    
