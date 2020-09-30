function varargout = fish_initial(varargin)
% FISH_INITIAL MATLAB code for fish_initial.fig
%      FISH_INITIAL, by itself, creates a new FISH_INITIAL or raises the existing
%      singleton*.
%
%      H = FISH_INITIAL returns the handle to a new FISH_INITIAL or the handle to
%      the existing singleton*.
%
%      FISH_INITIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FISH_INITIAL.M with the given input arguments.
%
%      FISH_INITIAL('Property','Value',...) creates a new FISH_INITIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fish_initial_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fish_initial_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fish_initial

% Last Modified by GUIDE v2.5 16-Nov-2015 13:47:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fish_initial_OpeningFcn, ...
                   'gui_OutputFcn',  @fish_initial_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before fish_initial is made visible.
function fish_initial_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fish_initial (see VARARGIN)

% Choose default command line output for fish_initial
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fish_initial wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fish_initial_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global mov;
global w;
global Yinitial;
global n;
global trans;
a=get(hObject,'Value');
Yinitial=floor(a*300)+1;

frame=read(mov,[1 1]);
frame=rgb2gray(frame);
if trans==1
    frame=frame';
end
si=size(frame);
xend=si(2);
yend=si(1);
for xn=1:1:1
    for yn=1:1:n+1
        if Yinitial+(yn-1)*w+1<yend-1
             frame(Yinitial+(yn-1)*w:Yinitial+(yn-1)*w+1,20:xend-20)=255;
             %frame(Ystart(xn)+(2*yn-1)*w(xn):Ystart(xn)+(2*yn-1)*w(xn)+1,Xstart(xn):Xend(xn))=254;
        end
        if Yinitial+(yn-1)*w+1>=yend-1
            set(handles.edit4,'string','lines out of image');
        end
    
    
    end
end
axes(handles.axes2); 
imshow(frame);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global mov;
global w;
global Yinitial;
global n;
global trans;
b=get(hObject,'Value');
w=b*40+15;
w=floor(w);
frame=read(mov,[1 1]);
frame=rgb2gray(frame);
if trans==1
    frame=frame';
end
si=size(frame);
xend=si(2);
yend=si(1);
for xn=1:1:1
    for yn=1:1:n+1
        if Yinitial+(yn-1)*w+1<yend-1
             frame(Yinitial+(yn-1)*w:Yinitial+(yn-1)*w+1,20:xend-20)=255;
             %frame(Ystart(xn)+(2*yn-1)*w(xn):Ystart(xn)+(2*yn-1)*w(xn)+1,Xstart(xn):Xend(xn))=254;
             set(handles.edit4,'string','');
        end
        if Yinitial+(yn-1)*w+1>=yend-1
            set(handles.edit4,'string','lines out of image');
        end
    
    end
end
axes(handles.axes2); 
imshow(frame);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global w;
global mov;
global Yinitial;
global n;
global trans;
global xend;
global yend;


%mov=VideoReader([addres '.wmv']);
frame=read(mov,[1 1]);
frame=rgb2gray(frame);
trans=0;
if trans==1
    frame=frame';
end
w=15;
Yinitial=20;
n=10;
si=size(frame);
xend=si(2);
yend=si(1);
for xn=1:1:1
    for yn=1:1:n+1
        if Yinitial+(yn-1)*w+1<yend-1
             frame(Yinitial+(yn-1)*w:Yinitial+(yn-1)*w+1,20:xend-20)=255;
             %frame(Ystart(xn)+(2*yn-1)*w(xn):Ystart(xn)+(2*yn-1)*w(xn)+1,Xstart(xn):Xend(xn))=254;
             set(handles.edit4,'string','');
        end
        if Yinitial+(yn-1)*w+1>=yend-1
            set(handles.edit4,'string','lines out of image');
        end
    end
end
axes(handles.axes2); 
imshow(frame);
% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function uipanel2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
global w;
global mov;
global Yinitial;
global n;
global trans;
nn=get(hObject,'String') ;
n=str2double(nn);
n=floor(n);
frame=read(mov,[1 1]);
frame=rgb2gray(frame);
if trans==1
    frame=frame';
end
si=size(frame);
xend=si(2);
yend=si(1);
for xn=1:1:1
    for yn=1:1:n+1
        if Yinitial+(yn-1)*w+1<yend-1
             frame(Yinitial+(yn-1)*w:Yinitial+(yn-1)*w+1,20:xend-20)=255;
             %frame(Ystart(xn)+(2*yn-1)*w(xn):Ystart(xn)+(2*yn-1)*w(xn)+1,Xstart(xn):Xend(xn))=254;
             set(handles.edit4,'string','');
        end
        if Yinitial+(yn-1)*w+1>=yend-1
            set(handles.edit4,'string','lines out of image');
        end
    end
end
axes(handles.axes2); 
imshow(frame);

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fish_main(handles);

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global w;
global mov;
global Yinitial;
global n;
global trans;


trans=get(hObject,'Value');
frame=read(mov,[1 1]);
frame=rgb2gray(frame);
if trans==1
    frame=frame';
end
si=size(frame);
xend=si(2);
yend=si(1);
for xn=1:1:1
    for yn=1:1:n+1
        if Yinitial+(yn-1)*w+1<yend-1
             frame(Yinitial+(yn-1)*w:Yinitial+(yn-1)*w+1,20:xend-20)=255;
             %frame(Ystart(xn)+(2*yn-1)*w(xn):Ystart(xn)+(2*yn-1)*w(xn)+1,Xstart(xn):Xend(xn))=254;
             set(handles.edit4,'string','');
        end
        if Yinitial+(yn-1)*w+1>=yend-1
            set(handles.edit4,'string','lines out of image');
        end
    end
end
axes(handles.axes2); 
imshow(frame);


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global w;
global mov;
global Yinitial;
global n;
global trans;
global Nframe;
[filename, pathname] = uigetfile('*.*', 'Pick a video');
filename
pathname
fullname=strcat(pathname,filename)
set(handles.text5,'string','reading video');
mov=VideoReader(fullname);
Nframe=get(mov, 'NumberOfFrames');
set(handles.text7,'string',num2str(Nframe));
pause(1.5);
set(handles.text5,'string','video ready');
set(handles.edit1,'string',[pathname filename]);
test2;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pathname;
pathname = uigetdir( 'pick a file to save data');
pathname


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n;
global Nframe;
global YYposition;
pathname2 = uigetdir( 'pick a file to save data');
pathname2
for yn=1:n
    fid=fopen([pathname2 '/position' num2str(yn) '.txt'],'w');
    for ii=1:1:Nframe
        fprintf(fid,'%10d',floor(10*YYposition(yn,ii)));
    
    end
    fclose(fid);
end


% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Istop;
Istop=1;
