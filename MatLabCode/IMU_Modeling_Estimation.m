function varargout = IMU_Modeling_Estimation(varargin)
% IMU_MODELING_ESTIMATION M-file for IMU_Modeling_Estimation.fig
%      IMU_MODELING_ESTIMATION, by itself, creates a new IMU_MODELING_ESTIMATION or raises the existing
%      singleton*.
%
%      H = IMU_MODELING_ESTIMATION returns the handle to a new IMU_MODELING_ESTIMATION or the handle to
%      the existing singleton*.
%
%      IMU_MODELING_ESTIMATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMU_MODELING_ESTIMATION.M with the given input arguments.
%
%      IMU_MODELING_ESTIMATION('Property','Value',...) creates a new IMU_MODELING_ESTIMATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IMU_Modeling_Estimation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IMU_Modeling_Estimation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IMU_Modeling_Estimation

% Last Modified by GUIDE v2.5 02-Aug-2023 12:27:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IMU_Modeling_Estimation_OpeningFcn, ...
                   'gui_OutputFcn',  @IMU_Modeling_Estimation_OutputFcn, ...
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


% --- Executes just before IMU_Modeling_Estimation is made visible.
function IMU_Modeling_Estimation_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

global breaker 

breaker = 0;

axes(handles.axes_map);
cla reset
load World;
image([-180 180],[-90 90],World,'CDataMapping', 'scaled');
set(handles.axes_map,'Visible','off');

axes(handles.axes_map);
hold on;

axes(handles.Fig2);
set(handles.Fig2,'Visible','on');

global IMU
IMU=1;
function varargout = IMU_Modeling_Estimation_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

% --- Executes on button press in IMU42CV.
function IMU42CV_Callback(hObject, eventdata, handles)
% hObject    handle to IMU42CV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of IMU42CV
global IMU
IMU42CV=get(handles.IMU42CV,'Value');
if IMU42CV==1
    set(handles.IMU42XP,'Value',0);
    set(handles.IMU42,'Value',0);
    IMU=1;
end

% --- Executes on button press in IMU42.
function IMU42_Callback(hObject, eventdata, handles)
% hObject    handle to IMU42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of IMU42
global IMU
IMU42=get(handles.IMU42,'Value');
if IMU42==1
    set(handles.IMU42CV,'Value',0);
    set(handles.IMU42XP,'Value',0);
    IMU=2;
end
% --- Executes on button press in IMU42XP.
function IMU42XP_Callback(hObject, eventdata, handles)
% hObject    handle to IMU42XP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of IMU42XP
global IMU
IMU42XP=get(handles.IMU42,'Value');
if IMU42XP==1
    set(handles.IMU42CV,'Value',0);
    set(handles.IMU42,'Value',0);
    IMU=3;
end



function Period_Callback(hObject, eventdata, handles)
% hObject    handle to Period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Period as text
%        str2double(get(hObject,'String')) returns contents of Period as a double

global Period
Period = str2num(get(handles.Period, 'String'));


% --- Executes during object creation, after setting all properties.
function Period_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Altitude_Callback(hObject, eventdata, handles)
% hObject    handle to Altitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Altitude as text
%        str2double(get(hObject,'String')) returns contents of Altitude as a double
Altitude = str2num(get(hObject, 'String'));
if isempty(Altitude)
    set(hObject, 'String','688');
end

% --- Executes during object creation, after setting all properties.
function Altitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Altitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ecc_Callback(hObject, eventdata, handles)
ecc = str2num(get(hObject, 'String'));
if isempty(ecc)
    set(hObject, 'String','0');
end
function ecc_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function inc_Callback(hObject, eventdata, handles)

inc = str2num(get(hObject, 'String'));
if isempty(inc)
    set(hObject, 'String','98.8');
end
function inc_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function RAAN_Callback(hObject, eventdata, handles)

RAAN = str2num(get(hObject, 'String'));
if isempty(RAAN)
    set(hObject, 'String','0');
end

function RAAN_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function omega_Callback(hObject, eventdata, handles)
% hObject    handle to omega (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of omega as text
%        str2double(get(hObject,'String')) returns contents of omega as a double
omega = str2num(get(hObject, 'String'));
if isempty(omega)
    set(hObject, 'String','0');
end

% --- Executes during object creation, after setting all properties.
function omega_CreateFcn(hObject, eventdata, handles)
% hObject    handle to omega (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nu_Callback(hObject, eventdata, handles)
% hObject    handle to nu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nu as text
%        str2double(get(hObject,'String')) returns contents of nu as a double
nu = str2num(get(hObject, 'String'));
if isempty(nu)
    set(hObject, 'String','0');
end

% --- Executes during object creation, after setting all properties.
function nu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function AngX_Callback(hObject, eventdata, handles)
% hObject    handle to AngX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AngX as text
%        str2double(get(hObject,'String')) returns contents of AngX as a double

phi = str2num(get(hObject, 'String'));
if isempty(phi)
    set(hObject, 'String','0');
end
% --- Executes during object creation, after setting all properties.
function AngX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AngX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function AngY_Callback(hObject, eventdata, handles)
% hObject    handle to AngY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AngY as text
%        str2double(get(hObject,'String')) returns contents of AngY as a double
theta = str2num(get(hObject, 'String'));
if isempty(theta)
    set(hObject, 'String','0');
end

% --- Executes during object creation, after setting all properties.
function AngY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AngY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AngZ_Callback(hObject, eventdata, handles)
% hObject    handle to AngZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AngZ as text
%        str2double(get(hObject,'String')) returns contents of AngZ as a double
psi = str2num(get(hObject, 'String'));
if isempty(psi)
    set(hObject, 'String','0');
end

% --- Executes during object creation, after setting all properties.
function AngZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AngZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function AngVX_Callback(hObject, eventdata, handles)
% hObject    handle to AngVX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AngVX as text
%        str2double(get(hObject,'String')) returns contents of AngVX as a double

omgX = str2num(get(hObject, 'String'));
if isempty(omgX)
    set(hObject, 'String','0');
end
% --- Executes during object creation, after setting all properties.
function AngVX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AngVX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function AngVY_Callback(hObject, eventdata, handles)
% hObject    handle to AngVY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AngVY as text
%        str2double(get(hObject,'String')) returns contents of AngVY as a double

omgY = str2num(get(hObject, 'String'));
if isempty(omgY)
    set(hObject, 'String','0');
end
% --- Executes during object creation, after setting all properties.
function AngVY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AngVY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AngVZ_Callback(hObject, eventdata, handles)
% hObject    handle to AngVZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AngVZ as text
%        str2double(get(hObject,'String')) returns contents of AngVZ as a double
omgZ = str2num(get(hObject, 'String'));
if isempty(omgZ)
    set(hObject, 'String','0');
end

% --- Executes during object creation, after setting all properties.
function AngVZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AngVZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global IMU OE Euler Angularv Period latlonaltt

rad=pi/180;
Re     = 6378.1363 ;                                 % Earth mean equatorial radius km

    Hx=str2num(get(handles.Altitude,'String'));
    e=str2num(get(handles.ecc,'String'));
    i=str2num(get(handles.inc,'String'))*rad;
    Om=str2num(get(handles.RAAN,'String'))*rad;
    om=str2num(get(handles.omega,'String'))*rad;
    nu=str2num(get(handles.nu,'String'))*rad;
    
    r=Re+Hx;
    p=r*(1+e*cos(nu));
    a=p/(1-e^2);
    OE=[a,e,i,Om,om,nu];

    phi=str2num(get(handles.AngX,'String'));
    theta=str2num(get(handles.AngY,'String'));
    psi=str2num(get(handles.AngZ,'String'));

    Euler =[phi,theta,psi];

    omgX=str2num(get(handles.AngVX,'String'));
    omgY=str2num(get(handles.AngVY,'String'));
    omgZ=str2num(get(handles.AngVZ,'String'));

    Period=str2num(get(handles.Period,'String'));

    Angularv =[omgX,omgY,omgZ];
    Satellite_Main;


% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global breaker
breaker=1;

% --- Executes on button press in Show.
function Show_Callback(hObject, eventdata, handles)
% hObject    handle to Show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global breaker 

Y2=get(handles.Variable_List, 'Value');
load Output2.mat;

Xreal= Output(2).Values;
Yreal= -Output(3).Values;

Ximu= Output(4).Values;
Yimu= -Output(5).Values;

axes(handles.axes_map);
load World;
image([-180 180],[-90 90],World,'CDataMapping', 'scaled');
set(handles.axes_map,'Visible','off');
plot(Xreal,Yreal,'y.',...
                'MarkerSize',6);
plot(Ximu,Yimu,'r.',...
                'MarkerSize',6);
hnd = plot(Xreal(1),Yreal(1),'y.',...
                'MarkerSize',30);   

set(hnd,'Xdata',Xreal(1),'Ydata',Yreal(1));
legend('Real','IMU')
handles.hnd  = hnd;
hold on
hnd   = handles.hnd;          
ix = 1;

 while ix <= length(Xreal)
     
     if ix > length(Xreal),ix = length(Xreal);  end 
          
          if breaker == 1, break, end  
     set(handles.Run_Time,'string',Output(1).Values(ix))

     set(hnd,'Xdata',Xreal(ix),'Ydata',Yreal(ix)); hold on

      drawnow;
         
      ix  = ix+10;
     
     pause(.001)
    
end
    
axes(handles.Fig2);

plot(Output(1).Values,Output(Y2+5).Values,'LineWidth',1.5),grid on
title(Output(Y2+5).Names)
xlabel(Output(1).Names)
ylabel(Output(Y2+5).Names)
legend(Output(Y2+5).Legends)


    % Y1=str2num(get(handles.Variable_List,'value'));
% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global breaker 
breaker =1;
close(IMU_Modeling_Estimation);
clc

function Run_Time_Callback(hObject, eventdata, handles)
% hObject    handle to Run_Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Run_Time as text
%        str2double(get(hObject,'String')) returns contents of Run_Time as a double


% --- Executes during object creation, after setting all properties.
function Run_Time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Run_Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in Variable_List.
function Variable_List_Callback(hObject, eventdata, handles)
% hObject    handle to Variable_List (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Variable_List contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Variable_List



% --- Executes during object creation, after setting all properties.
function Variable_List_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Variable_List (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function axes_map_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_map (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes_map


% --- Executes during object creation, after setting all properties.
function Fig2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fig2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate Fig2

function figure1_ResizeFcn(hObject, eventdata, handles)
