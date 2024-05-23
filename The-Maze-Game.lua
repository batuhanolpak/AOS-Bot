-- Maze definition (2D table)
maze = {
    { "S", "0", "1", "1", "1" },
    { "1", "0", "1", "0", "1" },
    { "1", "0", "0", "0", "1" },
    { "1", "1", "1", "0", "E" }
}

-- Player's starting position
player = { x = 1, y = 1 }

-- Movement directions
directions = {
    ["up"] = { x = 0, y = -1 },
    ["down"] = { x = 0, y = 1 },
    ["left"] = { x = -1, y = 0 },
    ["right"] = { x = 1, y = 0 }
}

-- Print the maze to the screen
function printMaze()
    for y = 1, #maze do
        for x = 1, #maze[y] do
            if player.x == x and player.y == y then
                io.write("P ")
            else
                io.write(maze[y][x] .. " ")
            end
        end
        io.write("\n")
    end
end

-- Check and move the player
function movePlayer(direction)
    local newX = player.x + directions[direction].x
    local newY = player.y + directions[direction].y

    if newX < 1 or newX > #maze[1] or newY < 1 or newY > #maze then
        print("Invalid move! You cannot go outside the maze.")
        return false
    end

    if maze[newY][newX] == "1" then
        print("Invalid move! You hit a wall.")
        return false
    end

    player.x = newX
    player.y = newY
    return true
end

-- Main game loop
while true do
    printMaze()
    print("Enter direction to move (up, down, left, right): ")
    local direction = io.read()

    if directions[direction] then
        if movePlayer(direction) then
            if maze[player.y][player.x] == "E" then
                print("Congratulations! You have reached the exit of the maze.")
                break
            end
        end
    else
        print("Invalid direction! Please try again.")
    end
end
