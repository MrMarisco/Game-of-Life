require_relative "Tcell.rb"
require 'ruby2d'

set title: "Game Of Life",fullscreen: true,background: 'navy'

puts"
Controlos:
==> Usar rato e Left button para marcar as células que deseja ver vivas e mortas
==> Enter para ver a magia acontecer
-----------Pressione Enter para continuar------------"
gets

m=Mcells.new

x=[20,21,22,23,24]
y=[33,35,37]


for x1 in x
    for y1 in y
        unless y1==35 && x1>=21 && x1<=23
        m.m[x1][y1]=1
        end
    end
end

k=0
on :mouse_down do |event| 
    case event.button
    when :left
        y=(event.x-20)/8.5
        x=(event.y-20)/8.5
        m.m[x][y]=m.m[x][y]==1?0:1
    end
end

tick=0
on :key_down do |event|
    if event.key=="return"
        k=1
    elsif event.key=="escape"
        close
    end
    puts event.key

end

#s=Sound.new('pew.mp3')
update do
    if tick%5==0
        clear
        Rectangle.new(
            x:20,
            y:20,
            width: 69*7.5+89,
            height: 49*7.5+69,
            color: 'black'
        )
        m.m.each_with_index do |line,x1|
            line.each_with_index do |cell,y1|
                if m.m[x1][y1]==1
                    Square.new(
                    x:7.5*y1+y1+20,
                    y:7.5*x1+x1+20, 
                    size: 7.5,
                    color: ['red','yellow','red','yellow'])
                end
            end
        end
        if k==1
          #  s.play
            m.timePass()
        end
    end
    tick+=1
end

show





