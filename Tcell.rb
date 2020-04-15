
class Mcells

    attr_accessor :m

    def initialize()
        @m=Array.new(50) {Array.new(70) {0}}
    end

    def alive(l,cm)
        @m[l][cm]=1
    end

    def die(l,cm)
        @m[l][cm]=0
    end

=begin
    def showMap()
        @m.each do |line|
            line.each do |block|
                if block == 1
                    print "[]"
                else 
                    print "  "
                end
            end
            puts ""
        end
    end
=end

    def around!(x,y)
        count=0
        around1=[x-1,x,x+1]
        around2=[y-1,y,y+1]
        around1.each do |x1|
            around2.each do |y1|
                x1=x1%50
                y1=y1%70
                unless x1==x && y1==y
                    if @m[x1][y1]==1
                        count+=1
                    end
                end
            end
        end
        return count
    end

    def timePass()
        morreram=[]
        ficamvivas=[]
        @m.each_with_index do |line,x|
            line.each_with_index do |cell,y|
                k=around!(x,y)
                m=cell
                if k==3 && m==0
                    ficamvivas.push([x,y])
                elsif (k>3 || k<2) && m==1
                    morreram.push([x,y])
                end
            end
        end
        morreram.each do |pos|
            die(pos[0],pos[1])
        end
        ficamvivas.each do |pos|
            alive(pos[0],pos[1])
        end
    end
end