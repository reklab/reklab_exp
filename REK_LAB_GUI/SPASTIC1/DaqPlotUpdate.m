function DaqPlotUpdate( obj, event, nBlockSize, handle, titlehandle, objDevice )
% $Revision: 1.3 $
%<
    % these have to be global (or persistent) in order for the callback to pass data back to the GUI
    global data;
    global data2;
    global index;
    global STOP_ACQUISITION;
    global nTraceChannels
    %DL added stopwatch
    global stopwatch;
    
    % scaling constants
    global CONVERTING_VOLTS_2_TORQUE;
    global CONVERTING_VOLTS_2_RADS;
    global SCALING_FACTOR;
    global TRIGGER_SAMPLING;

 
%DL Debuggings
% Stop acquisition 10 seconds prior to finish
% spt = get(objDevice(1), 'Samplespertrigger');
% sa = get(objDevice(1), 'SamplesAcquired');
% if spt > 11000
%     if sa > spt- 8e3
%         stop (objDevice);
%         return;
%     end
% end


if TRIGGER_SAMPLING ~= 1
    % stop request by the user
    if ( STOP_ACQUISITION == 1 )
        % reset of STOP_ACQUISITION is done in the NEXT method so that we
        % can flag stopped data
        stop( objDevice );
        return;
    end

    % increment counter indicating the number of callbacks
    index = index + 1;


    % append the next block to the data
    dstringgetdata =  'data = [data; ';



    for i = 1:length ( objDevice )
        dstringgetdata = [dstringgetdata 'getdata(objDevice(' num2str(i) '), nBlockSize) '];
    end







    dstringgetdata = [dstringgetdata '];'];
    try
        eval(dstringgetdata);
    catch
        stop( objDevice );
        error_msg(1) = {' Could not collect all the data. Stopping acquisition.'};
        error_msg(2) = {[' Number of samples that should have been collected ' num2str(get(objDevice(1),'SamplesPerTrigger')) '.']};
        for i = 1:length(objDevice)
            error_msg(2+i) = {[' Card ' num2str(i) ' collected ' num2str(get(objDevice(i), 'SamplesAcquired')) ' samples.']};
        end
        errordlg(error_msg,'Data Acquisition Error','modal');
        return
    end


    % Old way of getting data
    %         data = [data; getdata(objDevice(1), nBlockSize) getdata(objDevice(2), nBlockSize)];
    %data = [data; getdata(objDevice, nBlockSize) ];





    nChannel1 = nTraceChannels(1);
    nScaleChannel1 = 1;


    % Position
    if ( ( nChannel1 == 1 ) || ( nChannel1 == 3 ) )
        nScaleChannel1 = SCALING_FACTOR * CONVERTING_VOLTS_2_RADS;
        % Torque
    elseif ( ( nChannel1 == 2 ) || ( nChannel1 == 4 ) )
        nScaleChannel1 = SCALING_FACTOR * CONVERTING_VOLTS_2_TORQUE;
    end


    %DL Stopped plotting


    %         return

    % Plot 1
    H1 =  handle.m_ctrlPlot1 ;

    %DL setup time vector
    t = [1:1:length(data)]'/1e3;

    % DL Changed plot to limit to 20 sec(20,000 samples to be exact) of data
    % plot( data( :, nChannel1 ) * nScaleChannel1 );

    if length (data) > 20e3
        plot(H1,t(end-20e3+1:end), data(end-20e3+1:end, nChannel1 ) * nScaleChannel1 );
    else
        plot(H1,t, data( :, nChannel1 ) * nScaleChannel1 );
    end




    title(H1, ['Channel #: ', num2str( nChannel1 ),',   Callback: ', num2str( index )]);

    
    if nChannel1 == 1 || nChannel1 == 3
        ylabel(H1,'Position (rad)');
    elseif nChannel1 == 2 || nChannel1 == 4
        ylabel(H1,'Torque (Nm)');
    else
        ylabel(H1,'Volts (V)');
    end



    nChannel2 = nTraceChannels(2);
    nScaleChannel2 = 1;

    % Position
    if ( ( nChannel2 == 1 ) || ( nChannel2 == 3 ) )
        nScaleChannel2 = SCALING_FACTOR * CONVERTING_VOLTS_2_RADS;
        % Torque
    elseif ( ( nChannel2 == 2 ) || ( nChannel2 == 4 ) )
        nScaleChannel2 = SCALING_FACTOR * CONVERTING_VOLTS_2_TORQUE;
    end


    % Plot 2
    H2 = handle.m_ctrlPlot2 ;


    % plot( data( :, nChannel2 ) * nScaleChannel2 );
    if length (data) > 20e3
        plot(H2,t(end-20e3+1:end), data( end-20e3+1 : end, nChannel2 ) * nScaleChannel2 );
    else
        plot(H2,t, data( :, nChannel2 ) * nScaleChannel2 )
    end



    title(H2,['Channel #: ', num2str( nChannel2 ),',   Callback: ', num2str( index )]);

    if nChannel2 == 1 || nChannel2 == 3
        ylabel(H2,'Position (rad)');
    elseif nChannel2 == 2 || nChannel2 == 4
        ylabel(H2,'Torque (Nm)');
    else
        ylabel(H2,'Volts (V)');
    end

    % update graphics
    drawnow;


end
%>