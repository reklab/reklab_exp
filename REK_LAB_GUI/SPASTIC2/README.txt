For the Ali's GUI

Please follow these steps:

1. Open the GUI file (`BVGUI_current.mlapp`).

2. Click on "Connect" (Skip if already connected to Speedgoat).

3. Click on "Initialize Target" -> A model will open, and you may receive an error in MATLAB (Ignore this error).

4. Run the following code in the MATLAB command window:



   tg = slrealtime('TargetPC1');
   global tg
   newDir = 'G:\Users\Ali_R\Final_Delivery\slrt_models\';
   cd(newDir);
   sampleTime = 0.001;
   endTime = 5;
   numberOfSamples = endTime * 1/sampleTime + 1;
   timeVector = (0:numberOfSamples) * sampleTime;
   c = timeseries(timeVector*0, timeVector);
   model = 'Supine_SpeedGoat_v1_original';
   open_system(model);
   waveform = c;
   set_param(model, 'ExternalInput', 'waveform');
   set_param(model, 'LoadExternalInput', 'on');
   set_param(model, 'StopTime', 'Inf');
   evalc('slbuild(model)');





5. From within the Simulink editor, click on "Run on Target".

6. Verify that the model is loaded and running from the Speedgoat monitor (If presented with error try Run on Target one more time)

7. Use the GUI to load and run the trial.

8. Click on "Load file".

9. Browse to `G:\Users\Ali_R\Final_Delivery\GUI\sample_inputs_file` and select `inputs.mat`.

10. Use the drop-down menu to select the quasi-stationary position (`n6`, `n4`, `n3`, ..., `p4`).

11. Click on "Load stim".

12. Turn on Forward flow.

13. Click "Start stim".

14. Change the stim from the drop-down menu if desired.

These steps outline the process to set up and run your simulation and experiment using MATLAB, Simulink, and the Speedgoat hardware. Adjust paths and model names as per your specific setup.