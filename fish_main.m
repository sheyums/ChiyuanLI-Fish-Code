function fish_main(handles);
global w;
global mov;
global Yinitial;
global n;
global trans;
global mov;
global Nframe;
global pathname;
global YYposition;
global Istop;
Ystart=48;
Yend=430;
scanofflast=0;
screenoff=0;




%mov=VideoReader('C:\lcydata\4Hour_041615\5dpf 06252014.wmv')
YYposition=zeros(n,Nframe);
XXposition=zeros(n,Nframe);
nshadow=zeros(n,Nframe);



first=1;
add=1;


axes(handles.axes2);
%figure(1);
%%
frame=read(mov,[first first]);
frame=rgb2gray(frame);

if trans==0
    frame=frame';
end

si=size(frame);
xend=si(2);
yend=si(1);

yyy=zeros(960,1280);
yyy(:)=240;
yyy=uint8(yyy);

cha=15;
cha2=30;
%%



%frame=read(mov,[add add]);
%jubu=rgb2gray(frame);
bbb=0;
scanend=floor((Nframe-900)/400)*400;
for i=1:1:scanend
    i
    if mod(i,400)==1
        set(handles.edit3,'string',num2str(i));
        framecluster=read(mov,[i i+400]);
        
        frameclusterback=read(mov,[i+800 i+1200]);
        
    end
    frame(1:yend,1:xend)=framecluster(1:yend,1:xend,1,mod(i-1,400)+1);
    jubud(1:yend,1:xend)=frameclusterback(1:yend,1:xend,1,mod(i-1,400)+1);

    frame=uint8(frame);
    jubu=frame(1:yend,1:xend);
    
    jubud=uint8(jubud);
    jubucha=jubu;
    jubucha(jubu<jubud-cha2)=uint8(255);
    jubucha(jubu>=jubud-cha2)=uint8(0);  
    jubucha2 = bwareaopen(jubucha,5);
    jubucha=255*(uint8(jubucha2));
    jubuunit=jubucha/255;
    jubucha(1:20,1:end)=0;
    jubucha(Yend-20:Yend,1:end)=0;
    for fish=1:1:n
        Xbegin=Yinitial+(fish-1)*w;
        Xstop=Yinitial+fish*w;
        for y=21:20:Yend-21
            nshadow(fish,i)=sum(sum(jubuunit(y:y+40,Xbegin:Xstop)));
            inten=jubud-jubu;
            if nshadow(fish,i)>=7&&sum(sum(jubuunit(y+20:y+60,Xbegin:Xstop)))<nshadow(fish,i)&&max(max(inten(y:y+40,Xbegin:Xstop)))>65
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
        if nshadow(fish,i)>=10
            XXposition(fish,i)=Xsum/weight;%nshadow(fish,i);
            YYposition(fish,i)=Ysum/weight;%nshadow(fish,i);
            YYY=floor(YYposition(fish,i));
            XXX=floor(XXposition(fish,i));
            jubucha(floor(YYposition(fish,i)),floor(XXposition(fish,i))+10)=255;
            jubucha(YYY+15:YYY+16,XXX-15:XXX+15)=254;
            jubucha(YYY-16:YYY-15,XXX-15:XXX+15)=254;
            jubucha(YYY-15:YYY+15,XXX-16:XXX-15)=254;
            jubucha(YYY-15:YYY+15,XXX+15:XXX+16)=254;
        else
            if i>1
                XXposition(fish,i)=XXposition(fish,i-1);
                YYposition(fish,i)=YYposition(fish,i-1);
            end
        end
    end
    
    for j=Yinitial:w:Yinitial+w*n
         jubucha(20:Yend-20,j:j+1)=254;
         jubu(20:Yend-20,j:j+1)=254;
    end
    if mod(i,20)==0
        screenoff=get(handles.radiobutton2,'Value');
 
    end
    if screenoff==1
        imshow(yyy);
        pause(0.005);
    end
    if screenoff==0
        imshow([jubu' jubucha']);
        pause(0.03);
    end

end


for yn=1:n
    fid=fopen([pathname '\position' num2str(yn) '.txt'],'w');
    for ii=1:1:Nframe
        fprintf(fid,'%10d',floor(10*YYposition(yn,ii)));
    
    end
    fclose(fid);
end