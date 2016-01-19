function varargout = WignerFunctionApp(varargin)
% WIGNERFUNCTIONAPP MATLAB code for WignerFunctionApp.fig
%      WIGNERFUNCTIONAPP, by itself, creates a new WIGNERFUNCTIONAPP or raises the existing
%      singleton*.
%
%      H = WIGNERFUNCTIONAPP returns the handle to a new WIGNERFUNCTIONAPP or the handle to
%      the existing singleton*.
%
%      WIGNERFUNCTIONAPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIGNERFUNCTIONAPP.M with the given input arguments.
%
%      WIGNERFUNCTIONAPP('Property','Value',...) creates a new WIGNERFUNCTIONAPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WignerFunctionApp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WignerFunctionApp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WignerFunctionApp

% Last Modified by GUIDE v2.5 17-Jan-2016 23:37:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WignerFunctionApp_OpeningFcn, ...
                   'gui_OutputFcn',  @WignerFunctionApp_OutputFcn, ...
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


% --- Executes just before WignerFunctionApp is made visible.
function WignerFunctionApp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WignerFunctionApp (see VARARGIN)





% Choose default command line output for WignerFunctionApp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WignerFunctionApp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WignerFunctionApp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)

%set all panels to non-visible
if(get(hObject,'Value')==1)
    set(handles.uipanel1,'Visible','off');
    set(handles.uipanel2,'Visible','off');
    set(handles.uipanel3,'Visible','off');
end
%set gaussian panel on and all others off
if(get(hObject,'Value')==2)
    set(handles.uipanel1,'Visible','on');
    set(handles.uipanel2,'Visible','off');
    set(handles.uipanel3,'Visible','off');
    
    wigRefresh(hObject, eventdata, handles)
end
%set Pulse panel on and all the rest off
if(get(hObject,'Value')==3)
    set(handles.uipanel1,'Visible','off');
    set(handles.uipanel2,'Visible','on');
    set(handles.uipanel3,'Visible','off');
    
    wigRefresh(hObject, eventdata, handles)
end

%set Triangle panel on and all the rest off
if(get(hObject,'Value')==4)
    set(handles.uipanel1,'Visible','off');
    set(handles.uipanel2,'Visible','off');
    set(handles.uipanel3,'Visible','on');
    
    wigRefresh(hObject, eventdata, handles)
end

guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%THE FOLLOWING ARE THE SLIDERS AND EDIT TEXT BOXES FOR THE GAUSSIAN SIGNAL ANALYSIS
%THEY ARE FOUND IN UIPANEL1

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)

    wigRefresh(hObject, eventdata, handles)
   

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)

set(hObject,'Value',1);

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)

    wigRefresh(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)

set(hObject,'Value',1);

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)

    wigRefresh(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit2_Callback(hObject, eventdata, handles)

wigRefresh(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
       
%THE FOLLOWING ARE THE SLIDERS AND EDIT TEXT BOXES FOR THE PULSE SIGNAL ANALYSIS
%THEY ARE FOUND IN UIPANEL2

% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)

wigRefresh(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)

wigRefresh(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit3_Callback(hObject, eventdata, handles)

wigRefresh(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit4_Callback(hObject, eventdata, handles)

wigRefresh(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%THE FOLLOWING ARE THE SLIDERS AND EDIT TEXT BOXES FOR THE TRIANGLE SIGNAL ANALYSIS
%THEY ARE FOUND IN UIPANEL3

% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit5_Callback(hObject, eventdata, handles)

wigRefresh(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)

wigRefresh(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit6_Callback(hObject, eventdata, handles)

wigRefresh(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)

wigRefresh(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit7_Callback(hObject, eventdata, handles)

wigRefresh(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function wigRefresh(hObject, eventdata, handles)
    axes(handles.axes1);

    if (get(handles.popupmenu1,'value'))==2
        %
        %if slider pressed it will set all edit texts and vice versa
        if(length(get(hObject,'Style')) == length('slider'))
            
            s1=get(handles.slider1,'value');
            set(handles.edit1,'String',s1);
            
            s2=get(handles.slider2,'value');
            set(handles.edit2,'String',s2);
            
        elseif(length(get(hObject,'Style')) == length('edit'))
            
            val = str2double(get(handles.edit2, 'String'));
            set(handles.slider2, 'Value', val);
            
            val = str2double(get(handles.edit1, 'String'));
            set(handles.slider1, 'Value', val);
            
        else
            disp('Start Gauss');
        end
       
        %produce the refresh for the GAUSSIAN signal 
        [T,F,W] = Wigner(@(x) Gauss(x,get(handles.slider1,'Value'),get(handles.slider2,'Value')),-5,5);
        surf(real(T),real(F),real(W));
        
        handles.axes1.CameraPosition = [0,0,90];
        handles.axes1.XLabel.String = 'Time';
        handles.axes1.YLabel.String = 'Frequency';
        
        [X,Y]=Signal(@(x) Gauss(x,get(handles.slider1,'Value'),get(handles.slider2,'Value')),-5,5);
        plot(handles.axes2,real(X),real(Y));
        handles.axes2.XLabel.String = 'Time';
        
        [X,Y]=ForierTransform(@(x) Gauss(x,get(handles.slider1,'Value'),get(handles.slider2,'Value')),-5,5);
        plot(handles.axes3,real(X),real(Y));
        
        handles.axes3.XLabel.String = 'Amplitude';
        handles.axes3.YLabel.String = 'Frequency';
        
    elseif (get(handles.popupmenu1,'value'))==3
        %if slider pressed it will set all edit texts and vice versa
        if(length(get(hObject,'Style')) == length('slider'))
            
            s3=get(handles.slider3,'value');
            set(handles.edit3,'String',s3);
            
            s4=get(handles.slider4,'value');
            set(handles.edit4,'String',s4);
            
        elseif(length(get(hObject,'Style')) == length('edit'))
            
            val = str2double(get(handles.edit3, 'String'));
            set(handles.slider3, 'Value', val);
            
            val = str2double(get(handles.edit4, 'String'));
            set(handles.slider4, 'Value', val);
            
        else
            disp('Start Pulse');
        end
        
        %produce the refresh for the PULSE signal
        [T,F,W] = Wigner(@(x) Pulse(x,get(handles.slider3,'Value'),get(handles.slider4,'Value')),-5,5);
        surf(real(T),real(F),real(W));
        
        handles.axes1.CameraPosition = [0,0,90];
        handles.axes1.XLabel.String = 'Time';
        handles.axes1.YLabel.String = 'Frequency';
        
        [X,Y]=Signal(@(x) Pulse(x,get(handles.slider3,'Value'),get(handles.slider4,'Value')),-5,5);
        plot(handles.axes2,real(X),real(Y));
        handles.axes2.XLabel.String = 'Time';
        
        [X,Y]=ForierTransform(@(x) Pulse(x,get(handles.slider3,'Value'),get(handles.slider4,'Value')),-5,5);
        plot(handles.axes3,real(X),real(Y));
        
        handles.axes3.XLabel.String = 'Amplitude';
        handles.axes3.YLabel.String = 'Frequency';
      
    
    elseif (get(handles.popupmenu1,'value'))==4
        %if slider pressed it will set all edit texts and vice versa
        if(length(get(hObject,'Style')) == length('slider'))
            
            s5=get(handles.slider5,'value');
            set(handles.edit5,'String',s5);
            
            s6=get(handles.slider6,'value');
            set(handles.edit6,'String',s6);
            
            s7=get(handles.slider7,'value');
            set(handles.edit7,'String',s7);
            
        elseif(length(get(hObject,'Style')) == length('edit'))
            
            val = str2double(get(handles.edit5, 'String'));
            set(handles.slider5, 'Value', val);
            
            val = str2double(get(handles.edit6, 'String'));
            set(handles.slider6, 'Value', val);
            
            val = str2double(get(handles.edit7, 'String'));
            set(handles.slider7, 'Value', val);
            
        else
            disp('Start Pulse');
        end
        
        %produce the refresh for the PULSE signal
        [T,F,W] = Wigner(@(x) Trang(x,get(handles.slider5,'Value'),get(handles.slider6,'Value'),get(handles.slider7,'Value')),-5,5);
        surf(real(T),real(F),real(W));
        
        handles.axes1.CameraPosition = [0,0,90];
        handles.axes1.XLabel.String = 'Time';
        handles.axes1.YLabel.String = 'Frequency';
        
        [X,Y]=Signal(@(x) Trang(x,get(handles.slider5,'Value'),get(handles.slider6,'Value'),get(handles.slider7,'Value')),-5,5);
        plot(handles.axes2,real(X),real(Y));
        handles.axes2.XLabel.String = 'Time';
        
        [X,Y]=ForierTransform(@(x) Trang(x,get(handles.slider5,'Value'),get(handles.slider6,'Value'),get(handles.slider7,'Value')),-5,5);
        plot(handles.axes3,real(X),real(Y));
        
        handles.axes3.XLabel.String = 'Amplitude';
        handles.axes3.YLabel.String = 'Frequency';
    else
        
        disp('End')
        
    end
   
    
    % --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

keyboard
