class Life
    def initialize height, width
        @grid = []
        @width = width
        @height = height
    end

    def fill_grid
        @height.times do |row|
            newRow = ""
            @width.times do |e|
                newRow << '.'
            end
            @grid.push(newRow)
        end
    end

    def create_life
        cel1 = rand(0...(@height * @width))
        cel2 = rand(0...(@height * @width))
        cel3 = rand(0...(@height * @width))
        edit_grid([cel1,cel2,cel3])
    end

    def edit_grid arr
      arr.each do |cel|
        row = cel/@width
        pos = (@width * (row + 1) ) - cel
        pos = @width - pos
        @grid[row][pos - 1] = '*'
      end
      puts ">>>>>>>>>>>>>>>>>"
      get_grid
    end

    def check_neighbors
        puts ">>>>>>>>>>> check"
        i = 0
        while i < @grid.size
          j = 0
          while j <  @grid[i].size
            if j == 0 || j == @width - 1
              check_corner(i,j)
            else
              check_center(i,j)
            end
            j += 1
          end
          i += 1
        end
      puts ">>>>> end"
    end

    def get_grid
      puts @grid
    end

    def check_corner x,y
      if @grid[x][y] != '.'
        side = 'left'
        side = 'right' if y == @width - 1 
        #Check neighbors by side
        check_life_by_side(side,x,y)
      end
    end

    def check_center x,y
      if @grid[x][y] != '.'
        num_neighbors = 0
        if x != 0 
          num_neighbors += 1 if @grid[x - 1][y].nil? == false && @grid[x - 1][y] == "*"
          num_neighbors += 1 if @grid[x - 1][y + 1].nil? == false && @grid[x - 1][y + 1] == "*"
          num_neighbors += 1 if @grid[x - 1][y].nil? == false && @grid[x - 1][y] == "*"
          num_neighbors += 1 if @grid[x - 1][y - 1].nil? == false && @grid[x - 1][y - 1] == "*"
        end
        num_neighbors += 1 if @grid[x][y + 1].nil? == false && @grid[x][y + 1] == "*"
        num_neighbors += 1 if @grid[x][y - 1].nil? == false && @grid[x][y - 1] == "*"
        if x != @height - 1
          num_neighbors += 1 if @grid[x + 1][y].nil? == false && @grid[x + 1][y] == "*"
          num_neighbors += 1 if @grid[x + 1][y + 1].nil? == false && @grid[x + 1][y + 1] == "*"
          num_neighbors += 1 if @grid[x + 1][y].nil? == false && @grid[x + 1][y] == "*"
          num_neighbors += 1 if @grid[x + 1][y - 1].nil? == false && @grid[x + 1][y - 1] == "*"
        end
        
        puts "#{num_neighbors}, center"
      end
    end

    def check_life_by_side side,x,y
      num_neighbors = 0
      if side == "left"
        if x != 0 
          num_neighbors += 1 if @grid[x - 1][y].nil? == false && @grid[x - 1][y] == "*"
          num_neighbors += 1 if @grid[x - 1][y + 1].nil? == false && @grid[x - 1][y + 1] == "*"
        end
        num_neighbors += 1 if @grid[x][y + 1].nil? == false && @grid[x][y + 1] == "*"
        if x != @height - 1
          num_neighbors += 1 if @grid[x + 1][y].nil? == false && @grid[x + 1][y] == "*"
          num_neighbors += 1 if @grid[x + 1][y + 1].nil? == false && @grid[x + 1][y + 1] == "*"
        end
      else
        if x != 0
          num_neighbors += 1 if @grid[x - 1][y].nil? == false && @grid[x - 1][y] == "*"
          num_neighbors += 1 if @grid[x - 1][y - 1].nil? == false && @grid[x - 1][y - 1] == "*"
        end
        num_neighbors += 1 if @grid[x][y - 1].nil? == false && @grid[x][y - 1] == "*"
        if x != @height - 1
          num_neighbors += 1 if @grid[x + 1][y].nil? == false && @grid[x + 1][y] == "*"
          num_neighbors += 1 if @grid[x + 1][y - 1].nil? == false && @grid[x + 1][y - 1] == "*"
        end
      end
      
      puts "#{num_neighbors},#{side}"
    end

end

puts "Chose your height: "
userHeight = gets
puts "Choose your width: "
userWidth = gets



newLife = Life.new(userHeight.to_i,userWidth.to_i)

newLife.fill_grid
newLife.get_grid
newLife.create_life
newLife.check_neighbors;

