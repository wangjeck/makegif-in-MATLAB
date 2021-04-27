clc
clear
pic_num = 1;
for epsilon = 0.01:-0.001:0.005 % Replace it with the change parameter that you want to draw
    t = 1;
    syms x;
    ur = -1;
    ul = 1;
    s = (ur + ul)/2;
    w = ur + 1/2*(ul - ur)*(1-tanh((ul-ur)*(x-s*t)/(4*epsilon)));% Replace it with the function that you want to draw
    figure(1);
    ezplot(w);
    axis([-0.05,0.05 -1.5 1.5])
    drawnow;
    F=getframe(gcf);
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);
    if pic_num == 1
        imwrite(I,map,'test.gif','gif', 'Loopcount',inf,'DelayTime',0.2);
    else
        imwrite(I,map,'test.gif','gif','WriteMode','append','DelayTime',0.2);
    end
    pic_num = pic_num + 1;
end
