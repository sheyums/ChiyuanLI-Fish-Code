day=6;  
YYposition=zeros(15,500000);
XX=zeros(1,500000);
%figure(16);
for yn=1:1:5
        add=['C:\lcydata\New folder\fishposition' num2str(day) '\']
        fid=fopen([add 'Yposition' num2str(yn) '.txt'],'r');
        [YYposition(yn,1:400000),COUNT(yn)]=fscanf(fid,'%10d',inf);
        XX(1:400000)=YYposition(yn,1:400000);
        fclose(fid);
        figure(yn);
        %subplot(5,3,yn);
        plot(XX);
end
YYposition=YYposition/10;
%%





