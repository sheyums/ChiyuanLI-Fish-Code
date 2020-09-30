function varargout = data_analysis(varargin)
% DATA_ANALYSIS MATLAB code for data_analysis.fig
%      DATA_ANALYSIS, by itself, creates a new DATA_ANALYSIS or raises the existing
%      singleton*.
%
%      H = DATA_ANALYSIS returns the handle to a new DATA_ANALYSIS or the handle to
%      the existing singleton*.
%
%      DATA_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_ANALYSIS.M with the given input arguments.
%
%      DATA_ANALYSIS('Property','Value',...) creates a new DATA_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before data_analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to data_analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help data_analysis

% Last Modified by GUIDE v2.5 06-Dec-2015 21:15:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @data_analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @data_analysis_OutputFcn, ...
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


% --- Executes just before data_analysis is made visible.
function data_analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to data_analysis (see VARARGIN)

% Choose default command line output for data_analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes data_analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = data_analysis_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fishtype1;
global fishtype2;
fishtype1=zeros(1,30);
fishtype2=zeros(1,30);
type1=get(handles.edit1,'String');
type2=get(handles.edit3,'String');
type1
type2
l1=length(type1);
l2=length(type2);
wlast=0;
for i=1:l1
    if type1(i)==','||i==l1
        if type1(i)==','
            ee=i-1;
        end
        if i==l1
            ee=i;
        end
        b='0';
        k=1;
        for j=wlast+1:ee
            b(k)=type1(j);
            k=k+1;
        end
        b
        bb=str2num(b);
        fishtype1(bb)=1;
        wlast=i;
    end

end

wlast=0;
for i=1:l2
    if type2(i)==','||i==l2
        if type2(i)==','
            ee=i-1;
        end
        if i==l2
            ee=i;
        end
        b='0';
        k=1;
        for j=wlast+1:ee
            b(k)=type2(j);
            k=k+1;
        end
        b
        bb=str2num(b);
        fishtype2(bb)=1;
        wlast=i;
    end

end
fishtype1
fishtype2
