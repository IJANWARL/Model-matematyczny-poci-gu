function varargout = Projekt(varargin)
% PROJEKT MATLAB code for Projekt.fig
%      PROJEKT, by itself, creates a new PROJEKT or raises the existing
%      singleton*.
%
%      H = PROJEKT returns the handle to a new PROJEKT or the handle to
%      the existing singleton*.
%
%      PROJEKT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJEKT.M with the given input arguments.
%
%      PROJEKT('Property','Value',...) creates a new PROJEKT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Projekt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Projekt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Projekt

% Last Modified by GUIDE v2.5 03-Dec-2018 21:00:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Projekt_OpeningFcn, ...
                   'gui_OutputFcn',  @Projekt_OutputFcn, ...
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


% --- Executes just before Projekt is made visible.
function Projekt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Projekt (see VARARGIN)
% Choose default command line output for Projekt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

exe(handles)

% UIWAIT makes Projekt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Projekt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function silaT_Callback(hObject, eventdata, handles)
% hObject    handle to silaT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of silaT as text
%        str2double(get(hObject,'String')) returns contents of silaT as a double

exe(handles)

% --- Executes during object creation, after setting all properties.
function silaT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to silaT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function exe(handles)

var = get(handles.silaT, 'string');
F = str2double(var);

var = get(handles.zakresT, 'string');
zakres = str2double(var);

var = get(handles.masatowaruT, 'string');
masatowaru = str2double(var);

var = get(handles.luzT, 'string');
luz = str2double(var);

var = get(handles.okresT, 'string');
okres = str2double(var);

var = get(handles.kdT, 'string');
kd = str2double(var);

var = get(handles.kpT, 'string');
kp = str2double(var);

var = get(handles.kiT, 'string');
ki = str2double(var);

if get(handles.stala,'Value') == 1       
     wybor=1;
elseif get(handles.liniowa,'Value') == 1  
     wybor=2;
else    
     wybor=3;
end

wykres=Funkcja(F,masatowaru,zakres,luz,okres,wybor,kp,kd,ki);

cla(handles.pol);

tw=linspace(0,zakres,zakres*10);


title('Po³o¿enie');
axes(handles.pol);
plot(tw,wykres(:,1))
hold on
plot(tw,wykres(:,2))
hold on
plot(tw,wykres(:,3))
hold on
plot(tw,wykres(:,4))
hold on
title('Wykres drogi od czasu')
xlabel('Czas [s]') 
ylabel('Droga [m]') 
legend({'Polo¿enie lokomotywy','Polo¿enie pierwszego wagonu','Polo¿enie drugiego wagonu','Polo¿enie trzeciego wagonu'},'Location','southeast')

axes(handles.pre);
plot(tw,wykres(:,5))
title('Wykres prêdkoœci od czasu')
xlabel('Czas [s]') 
ylabel('Prêdkoœæ [m/s]') 
legend({'Prêdkoœæ sk³adu'},'Location','southeast')



function zakresT_Callback(hObject, eventdata, handles)
% hObject    handle to zakresT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zakresT as text
%        str2double(get(hObject,'String')) returns contents of zakresT as a double

exe(handles)

% --- Executes during object creation, after setting all properties.
function zakresT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zakresT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function masatowaruT_Callback(hObject, eventdata, handles)
% hObject    handle to masatowaruT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of masatowaruT as text
%        str2double(get(hObject,'String')) returns contents of masatowaruT as a double

exe(handles)

% --- Executes during object creation, after setting all properties.
function masatowaruT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to masatowaruT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in stala.
function stala_Callback(hObject, eventdata, handles)
% hObject    handle to stala (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stala
exe(handles)

% --- Executes on button press in liniowa.
function liniowa_Callback(hObject, eventdata, handles)
% hObject    handle to liniowa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of liniowa
exe(handles)

% --- Executes on button press in sinus.
function sinus_Callback(hObject, eventdata, handles)
% hObject    handle to sinus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sinus
exe(handles)


function luzT_Callback(hObject, eventdata, handles)
% hObject    handle to luzT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of luzT as text
%        str2double(get(hObject,'String')) returns contents of luzT as a double
exe(handles)

% --- Executes during object creation, after setting all properties.
function luzT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to luzT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function okresT_Callback(hObject, eventdata, handles)
% hObject    handle to okresT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of okresT as text
%        str2double(get(hObject,'String')) returns contents of okresT as a double
exe(handles)

% --- Executes during object creation, after setting all properties.
function okresT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to okresT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kdT_Callback(hObject, eventdata, handles)
% hObject    handle to kdT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kdT as text
%        str2double(get(hObject,'String')) returns contents of kdT as a double
exe(handles)

% --- Executes during object creation, after setting all properties.
function kdT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kdT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kiT_Callback(hObject, eventdata, handles)
% hObject    handle to kiT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kiT as text
%        str2double(get(hObject,'String')) returns contents of kiT as a double
exe(handles)

% --- Executes during object creation, after setting all properties.
function kiT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kiT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kpT_Callback(hObject, eventdata, handles)
% hObject    handle to kpT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kpT as text
%        str2double(get(hObject,'String')) returns contents of kpT as a double
exe(handles)

% --- Executes during object creation, after setting all properties.
function kpT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kpT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
