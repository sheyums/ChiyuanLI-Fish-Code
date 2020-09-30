Ystart=30;
%Ystart=48;new video
Yend=430;
w=45;
Xstart=17;
%Xstart=130;new video
Xend=600;

YYposition=zeros(15,800000);
XXposition=zeros(15,800000);
nshadow=zeros(15,500000);
sumx=zeros(15,480);
Yinitial=zeros(1,15);
Xinitial=zeros(1,15);

first=1;
add=1;


frame=read(mov,[first first]);
%frame=rgb2gray(frame);

%framenext=rgb2gray(framenext);
frame(Ystart,1:end)=255;
frame(Yend,1:end)=255;
figure(1);

for i=Xstart:w:Xend
    frame(1:end,i)=254;
end
figure(9);
imshow(frame);
cha=15;
cha2=25;

frame=read(mov,[first first]);%frame=rgb2gray(frame);
jubu=frame(1:512,1:256);
jubud=jubu;



figure(9);

%frame=read(mov,[add add]);
%jubu=rgb2gray(frame);
bbb=0;

for i=1:1:2000
    i
    if mod(i,400)==1
        
        framecluster=read(mov,[i i+400]);
        
        frameclusterback=read(mov,[i+800 i+1200]);
        
    end
    frame(1:512,1:256)=framecluster(1:512,1:256,1,mod(i-1,400)+1);
    frame=uint8(frame);
    jubu=frame(1:512,1:256);
    jubud(1:512,1:256)=frameclusterback(1:512,1:256,1,mod(i-1,400)+1);
    jubud=uint8(jubud);
    jubucha=jubu;
    jubucha(jubu<jubud-cha2)=uint8(255);
    jubucha(jubu>=jubud-cha2)=uint8(0);  
    jubucha2 = bwareaopen(jubucha,5);
    jubucha=255*(uint8(jubucha2));
    jubuunit=jubucha/255;
    jubucha(1:Ystart,1:end)=0;
    jubucha(Yend:end,1:end)=0;
    for fish=1:1:1
        Xbegin=Xstart+(fish-1)*w;
        Xstop=Xstart+fish*w;
        for y=Ystart:20:Yend-20
            nshadow(fish,i)=sum(sum(jubuunit(y:y+40,Xbegin:Xstop)));
            inten=jubud-jubu;
            if nshadow(fish,i)>=7&&sum(sum(jubuunit(y+20:y+60,Xbegin:Xstop)))<nshadow(fish,i)&&max(max(inten(y:y+40,Xbegin:Xstop)))>20
                break;
            end
        end
        nshadow(fish,i)=0;
        Xsum=0;
        Ysum=0;
        weight=0;
        for y=y:1:y+40;
            for x=Xbegin:1:Xstop
                if jubucha(y,x)==255
                    ww=double(jubud(y,x)-cha2-jubu(y,x));
                    nshadow(fish,i)=nshadow(fish,i)+1;
                    Xsum=Xsum+x*ww;
                    Ysum=Ysum+y*ww;
                    weight=weight+ww;
                end
            end
        end
        if nshadow(fish,i)>=7
            XXposition(fish,i)=Xsum/weight;%nshadow(fish,i);
            YYposition(fish,i)=Ysum/weight;%nshadow(fish,i);
            YYY=floor(YYposition(fish,i));
            XXX=floor(XXposition(fish,i));
            %jubucha(floor(YYposition(fish,i)),floor(XXposition(fish,i))+10)=255;
            %jubucha(YYY+15:YYY+16,XXX-15:XXX+15)=254;
            %jubucha(YYY-16:YYY-15,XXX-15:XXX+15)=254;
            %jubucha(YYY-15:YYY+15,XXX-16:XXX-15)=254;
            %jubucha(YYY-15:YYY+15,XXX+15:XXX+16)=254;
        else
            if i>1
                XXposition(fish,i)=XXposition(fish,i-1);
                YYposition(fish,i)=YYposition(fish,i-1);
            end
        end
    end
    
    for j=Xstart:w:Xstart+w*2
         jubucha(Ystart:Yend,j)=254;
         jubu(Ystart:Yend,j)=254;
    end
    imshow([jubu jubucha]);
    %imshow([jubu(Ystart:Yend,Xstart+12*w+2:Xstart+13*w-2) jubucha(Ystart:Yend,Xstart+12*w+2:Xstart+13*w-2)]);
    if i==211
       w1=jubu(Ystart:Yend,Xstart+0*w+2:Xstart+1*w-2); 
       b1=jubucha(Ystart:Yend,Xstart+0*w+2:Xstart+1*w-2);
    end
    if i==311
       w2=jubu(Ystart:Yend,Xstart+0*w+2:Xstart+1*w-2); 
       b2=jubucha(Ystart:Yend,Xstart+0*w+2:Xstart+1*w-2);
    end
    if i==411
       w3=jubu(Ystart:Yend,Xstart+0*w+2:Xstart+1*w-2); 
       b3=jubucha(Ystart:Yend,Xstart+0*w+2:Xstart+1*w-2);
    end
    pause(0.05);
end
%%

figure(10);
imshow([[b1 b2 b3]']);
%%


for yn=1:0
    fid=fopen(['C:\lcydata\New folder\fishposition6\Yposition' num2str(yn) '.txt'],'w');
    for ii=1:1:400000
        fprintf(fid,'%10d',floor(10*YYposition(yn,ii)));
    
    end
    fclose(fid);
end