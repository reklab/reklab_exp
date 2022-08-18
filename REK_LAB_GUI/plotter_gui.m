function varargout = plotter_gui(varargin)
% PLOTTER_GUI M-file for plotter_gui.fig
%      PLOTTER_GUI, by itself, creates a new PLOTTER_GUI or raises the existing
%      singleton*.
%
%      H = PLOTTER_GUI returns the handle to a new PLOTTER_GUI or the handle to
%      the existing singleton*.
%
%      PLOTTER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTTER_GUI.M with the given input arguments.
%
%      PLOTTER_GUI('Property','Value',...) creates a new PLOTTER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before analysis_gui3_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plotter_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plotter_gui

% Last Modified by GUIDE v2.5 27-Nov-2009 15:35:18
% $Revision: 1.1 $  
% $Date: 2009/11/30 19:09:28 $

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plotter_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @plotter_gui_OutputFcn, ...
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


% --- Executes just before plotter_gui is made visible.
function plotter_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plotter_gui (see VARARGIN)

% Create blank cell_array for math structure
handles.math = {};

% Choose default command line output for plotter_gui
handles.output = hObject;

%Set flb_file name to input
flbfile = varargin{1};
flbfile = flbfile{1}; %convert from cell to string

%Check to see if valid file name was sent, otherwise chose flb file
if (exist(flbfile, 'file') ~= 2) %If file doesn't exists
    %Get Flb file
    [FileName,PathName] = uigetfile('*.flb','Select the FLB-file');
    flbfile = [PathName FileName];
end

set(handles.text_file, 'String', flbfile);
% flbfile = fopen(flbname);

%Get index of flb file
flblength = flb2mat(flbfile,'length');
flbindex = flb2mat(flbfile,'index');

%Build case list
caselist{1} = 'Select a case';
for i = 1:flblength
    caselist{i+1} = [num2str(i) ': ' flbindex(i).comment];
end

%Update case list
set(handles.popup_case, 'String', caselist);
set(handles.popup_case, 'Enable', 'on');
 set(handles.plot_new_figure, 'enable', 'off'); %Cannot plot data in separate window until channel is chosen

%Store flb file
handles.flbfile = flbfile;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plotter_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plotter_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox_channels.
function listbox_channels_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_channels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox_channels contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_channels

global nldata
global d_math

%Get Flb case, realization, and channel
flbfile = handles.flbfile;
flbcase = get(handles.popup_case, 'Value') -1;
flbreal = get(handles.popup_realization, 'Value') -1;
flbchannel = get(handles.listbox_channels, 'Value') - 1;

if flbchannel == 0
    return
end

%Get data from file flb
% Switch to nldat in future
flbdata = flb2mat(flbfile, 'read_case', flbcase);

%Check to see if more than 1 realization
numReal = flbdata.nReal;

nldata = nldat; %Instantiate nldat object
if numReal > 1
    set(nldata, 'Data', flbdata.Data(:,flbchannel,flbreal));%3 dimensional data
else
    set(nldata, 'Data', flbdata.Data(:,flbchannel)); %2 dimensional data
end

set(nldata, 'ChanNames', {flbdata.chanName{flbchannel}});
set(nldata, 'DomainIncr', flbdata.domainIncr);
set(nldata, 'DomainName', {flbdata.domainName});
set(nldata, 'DomainStart', flbdata.domainStart);
set(nldata, 'comment', '');


%plot data in built in window and update statistics
doplot(nldata, handles)

%Can now plot data in separate window because channel is chosen
set(handles.plot_new_figure, 'enable', 'on'); 

handles.nldata = nldata;

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function listbox_channels_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_channels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in popup_case.
function popup_case_Callback(hObject, eventdata, handles)
% hObject    handle to popup_case (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popup_case contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_case

%Get flbfile from handles
flbfile = handles.flbfile;

%Get case number from pop-up menu
flbcase = get(hObject, 'Value') -1;

%If case not selected, do nothing and return
if flbcase == 0
    set(handles.popup_realization, 'enable', 'off');
    return
end

%Reset chosen item to 1 - as default when new case selected
set(handles.popup_realization,'Value',1); 
set(handles.listbox_channels,'Value',1); 


%Populate channel list
real1{1} = 'Select a realization';
flbindex = flb2mat(flbfile,'index');%Get info about data in flb file
numReal = flbindex(flbcase).nReal; %extract the number of realization for chosen case

%create string of available realizations
reals= (1:numReal)';
real_str = num2str(reals); %Convert to string

%Set list of available realizations to list box
RealizationList = cat(2, real1, real_str);
set(handles.popup_realization, 'string', RealizationList);
set(handles.listbox_channels, 'string', ''); %clear channels until realization is chosen
 set(handles.popup_realization, 'enable', 'on'); %Now allow realization to be selected
 set(handles.listbox_channels, 'enable', 'off'); %Do not allow channel to be selected until a realization is chosen
 set(handles.plot_new_figure, 'enable', 'off'); %Cannot plot data in separate window until channel is chosen


% --- Executes during object creation, after setting all properties.
function popup_case_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_case (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function menu_openflb_Callback(hObject, eventdata, handles)
% hObject    handle to menu_openflb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Get Flb file
[FileName,PathName] = uigetfile('*.flb','Select the FLB-file');
flbfile = [PathName FileName];
set(handles.text_file, 'String', flbfile);

%Get index of flb file
flblength = flb2mat(flbfile,'length');
flbindex = flb2mat(flbfile,'index');

%Build case list
caselist{1} = 'Select a case';
for i = 1:flblength
    caselist{i+1} = [num2str(i) ': ' flbindex(i).comment];
end

%Reset item selected in all popup menus and listboxes to default value
%because new file may have different channels/realizations
set(handles.popup_case,'Value',1);
set(handles.popup_realization,'Value',1);
set(handles.listbox_channels,'Value',1);

%clear list of realizations and channels
set(handles.popup_realization,'String','');
set(handles.listbox_channels,'String','');

%Disable realization and channel choices until a case is selected
set(handles.popup_realization, 'Enable', 'off');
set(handles.listbox_channels, 'Enable', 'off');
set(handles.plot_new_figure, 'enable', 'off'); %Cannot plot data in separate window until channel is chosen

%Update case list
set(handles.popup_case, 'String', caselist);
set(handles.popup_case, 'Enable', 'on');


%Store flb file
handles.flbfile = flbfile;

% Update handles structure
guidata(hObject, handles);



function doplot (d_nldata,handles)

%Plots selected case - realization - channel in built-in plot window

% %Get time vector
tstart = get(d_nldata, 'DomainStart');
tincr = get(d_nldata, 'DomainIncr');
tend = tstart+(length(d_nldata)-1)*tincr;
t = tstart: tincr: tend;

% %Get labels
d_xlabel = get(d_nldata, 'DomainName');
d_ylabel = get(d_nldata, 'ChanNames');

% plot data
d_data = get(d_nldata, 'Data');
axes1 = handles.axes1;
plot(axes1, t, d_data);
xlabel(axes1, d_xlabel);
ylabel(axes1, d_ylabel);
xlim(axes1, [tstart tend]);



% --- Executes on selection change in popup_realization.
function popup_realization_Callback(hObject, eventdata, handles)
% hObject    handle to popup_realization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popup_realization contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_realization


%Get flbfile from handles
flbfile = handles.flbfile;

%Get case number and realization number from pop-up menus
flbcase = get(handles.popup_case, 'Value') -1;
flbReal = get(hObject, 'Value') -1;

%If no proper case or realization selected, do nothing and disable channels
%so they can't be selected
if (flbcase == 0) || (flbReal == 0) 
    set(handles.listbox_channels, 'enable', 'off');
    return
end
    
%Reset to default value because there may be different channels associated
%with this case and realization
set(handles.listbox_channels,'Value',1); 


%Populate channel list
channel1{1} = 'Select a channel';
flbindex = flb2mat(flbfile,'index'); %Get all flb data info
channame = flbindex(flbcase).chanName; %Get channels for chosen case
channellist = cat(2, channel1, channame);
set(handles.listbox_channels, 'string', channellist);
set(handles.listbox_channels, 'enable', 'on');
set(handles.plot_new_figure, 'enable', 'off'); %Cannot plot data in separate window until channel is chosen


% --- Executes during object creation, after setting all properties.
function popup_realization_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_realization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in plot_new_figure.
function plot_new_figure_Callback(hObject, eventdata, handles)
% hObject    handle to plot_new_figure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Opens data selected through popup menus and listbox in a separate figure

data = handles.nldata; %Get data

figure;
plot(data); %nldat plotting function
sizeData = get(data, 'Size');
domainEnd=(sizeData(1)-1)*get(data, 'DomainIncr')+ data.DomainStart;
xlim([data.DomainStart domainEnd]);





% --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


