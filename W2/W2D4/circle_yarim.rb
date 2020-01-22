class Circle
    attr_reader :r, :area, :cir, :unit
    def initialize(r,unit)
        @r = r
        @area = area
        @cir = cir
        @unit = unit
    end

    def area
        @area = "#{Math::PI * @r**2} #{@unit}^2"
    end

    def cir 
        @cir = "#{2 * Math::PI * @r} #{@unit}"
    end

    def r=(num)
        @r = num
    end

    def unit=(str)
        if str == "cm"
            @r = @r * 2.54
            @unit = "cm"
        else
            @r = @r /2.54
            @unit = "in"
        end
    end    

end 

c = Circle.new(5,"cm")
p "r: #{c.r} #{c.unit}"
p "area: #{c.area}"
p "cir: #{c.cir}"

c = Circle.new(5,"in")
p "r: #{c.r} #{c.unit}"
p "area: #{c.area}"
p "cir: #{c.cir}"

# # bi de cm cinsinden bakalim yahu
# c.unit = "cm"
# p "cm cinsinden alani da #{c.area}"

# c.r = 10 
# p "r: #{c.r}"
# p "area: #{c.area}"
# p "cir: #{c.cir}"
