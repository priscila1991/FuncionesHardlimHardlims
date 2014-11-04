function varargout = figuraPrueba(varargin)
% FIGURAPRUEBA MATLAB code for figuraPrueba.fig
%      FIGURAPRUEBA, by itself, creates a new FIGURAPRUEBA or raises the existing
%      singleton*.
%
%      H = FIGURAPRUEBA returns the handle to a new FIGURAPRUEBA or the handle to
%      the existing singleton*.
%
%      FIGURAPRUEBA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIGURAPRUEBA.M with the given input arguments.
%
%      FIGURAPRUEBA('Property','Value',...) creates a new FIGURAPRUEBA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before figuraPrueba_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to figuraPrueba_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help figuraPrueba

% Last Modified by GUIDE v2.5 03-Nov-2014 20:03:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @figuraPrueba_OpeningFcn, ...
                   'gui_OutputFcn',  @figuraPrueba_OutputFcn, ...
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


% --- Executes just before figuraPrueba is made visible.
function figuraPrueba_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to figuraPrueba (see VARARGIN)

% Choose default command line output for figuraPrueba
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes figuraPrueba wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = figuraPrueba_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in entrenar.
function entrenar_Callback(hObject, eventdata, handles)
% hObject    handle to entrenar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global orh
e=[-1 -1 -1 -1 -1 -1 -1 -1 1 1 1 1 1 1 1 1;-1 -1 -1 -1 1 1 1 1 -1 -1 -1 -1 1 1 1 1;-1 -1 1 1 -1 -1 1 1 -1 -1 1 1 -1 -1 1 1;-1 1 -1 1 -1 1 -1 1 -1 1 -1 1 -1 1 -1 1];

s=[-1 -1 1 -1 -1 -1 -1 -1 -1 -1 1 1 -1 -1 1 1 ];
%plotpv(e,s)
red = newp([-1 1;-1 1;-1 1; -1 1],1,'hardlims');
red.trainParam.epochs=1000;
red.trainParam.show=5;

red = train(red, e , s);
handles.orh=red;
pesos = red.iw{1,1};
bias = red.b{1};
guidata(hObject,handles)



% --- Executes on button press in fijarValores.
function fijarValores_Callback(hObject, eventdata, handles)
% hObject    handle to fijarValores (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global orh
opl=handles.orh;
a=str2num(get(handles.v1, 'String'));
b=str2num(get(handles.v2, 'String'));
c=str2num(get(handles.v3, 'String'));
d=str2num(get(handles.v4, 'String'));
entradas=[a; b; c; d];


%entradas1=[a1;b;c;d]
set(handles.prueba, 'String',entradas);

simu = sim(opl,entradas);
simu
op=1;
opc=-1;
if simu==op
    %disp('está aprobado')
    set(handles.prueba, 'String','está aprobado');
elseif simu==opc
    %disp('no esta aprobado')
    set(handles.prueba, 'String','no está aprobado');
end


guidata(hObject,handles);

function v1_Callback(hObject, eventdata, handles)
% hObject    handle to v1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v1 as text
%        str2double(get(hObject,'String')) returns contents of v1 as a double


% --- Executes during object creation, after setting all properties.
function v1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v2_Callback(hObject, eventdata, handles)
% hObject    handle to v2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v2 as text
%        str2double(get(hObject,'String')) returns contents of v2 as a double


% --- Executes during object creation, after setting all properties.
function v2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v3_Callback(hObject, eventdata, handles)
% hObject    handle to v3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v3 as text
%        str2double(get(hObject,'String')) returns contents of v3 as a double


% --- Executes during object creation, after setting all properties.
function v3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v4_Callback(hObject, eventdata, handles)
% hObject    handle to v4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v4 as text
%        str2double(get(hObject,'String')) returns contents of v4 as a double


% --- Executes during object creation, after setting all properties.
function v4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text7.
function text7_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = [0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1;
      0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1;
      0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1;
      0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1];
x2 = [0 0 0 0 0 0 0 0 0 1 0 1 0 1 0 1];
%plotpv(x1,x2)
net = newp([0 1;0 1;0 1;0 1],1,'hardlim');
net.trainParam.show=90;
net = train(net,x1,x2);
pesos=net.iw{1,1};
bias=net.b{1};
en=[1;1;0;1];
s = sim (net,en)
x2
handles.orh1=net;
guidata(hObject,handles)

function hm1_Callback(hObject, eventdata, handles)
% hObject    handle to hm1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hm1 as text
%        str2double(get(hObject,'String')) returns contents of hm1 as a double


% --- Executes during object creation, after setting all properties.
function hm1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hm1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hm2_Callback(hObject, eventdata, handles)
% hObject    handle to hm2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hm2 as text
%        str2double(get(hObject,'String')) returns contents of hm2 as a double


% --- Executes during object creation, after setting all properties.
function hm2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hm2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hm3_Callback(hObject, eventdata, handles)
% hObject    handle to hm3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hm3 as text
%        str2double(get(hObject,'String')) returns contents of hm3 as a double


% --- Executes during object creation, after setting all properties.
function hm3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hm3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hm4_Callback(hObject, eventdata, handles)
% hObject    handle to hm4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hm4 as text
%        str2double(get(hObject,'String')) returns contents of hm4 as a double


% --- Executes during object creation, after setting all properties.
function hm4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hm4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in fijarVaHL.
function fijarVaHL_Callback(hObject, eventdata, handles)
% hObject    handle to fijarVaHL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
op2=handles.orh1;
a=str2num(get(handles.hm1, 'String'));
b=str2num(get(handles.hm2, 'String'));
c=str2num(get(handles.hm3, 'String'));
d=str2num(get(handles.hm4, 'String'));
entradas=[a; b; c; d];
%set(handles.prueba, 'String',entradas);

simu = sim(op2,entradas);
simu
op=1;
opc=0;
if simu==op
    %disp('está aprobado')
    set(handles.credito, 'String','Aprobado');
elseif simu==opc
    %disp('no esta aprobado')
    set(handles.credito, 'String','No aprobado');
end


guidata(hObject,handles);



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in credito.
function credito_Callback(hObject, eventdata, handles)
% hObject    handle to credito (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in prueba.
function prueba_Callback(hObject, eventdata, handles)
% hObject    handle to prueba (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
