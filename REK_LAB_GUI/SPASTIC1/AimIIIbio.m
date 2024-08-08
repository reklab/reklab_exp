function bio=AimIIIbio
bio = [];
bio(1).blkName='NumActuators';
bio(1).sigName='';
bio(1).portIdx=0;
bio(1).dim=[1,1];
bio(1).sigWidth=1;
bio(1).sigAddress='&AimIII_B.NumActuators';
bio(1).ndims=2;
bio(1).size=[];

bio(getlenBIO) = bio(1);

bio(2).blkName='POS_Offset';
bio(2).sigName='';
bio(2).portIdx=0;
bio(2).dim=[1,1];
bio(2).sigWidth=1;
bio(2).sigAddress='&AimIII_B.POS_Offset';
bio(2).ndims=2;
bio(2).size=[];


bio(3).blkName='Scope_offset';
bio(3).sigName='';
bio(3).portIdx=0;
bio(3).dim=[1,1];
bio(3).sigWidth=1;
bio(3).sigAddress='&AimIII_B.Scope_offset';
bio(3).ndims=2;
bio(3).size=[];


bio(4).blkName='scope_switch_signal';
bio(4).sigName='';
bio(4).portIdx=0;
bio(4).dim=[1,1];
bio(4).sigWidth=1;
bio(4).sigAddress='&AimIII_B.scope_switch_signal';
bio(4).ndims=2;
bio(4).size=[];


bio(5).blkName='visual_select';
bio(5).sigName='';
bio(5).portIdx=0;
bio(5).dim=[1,1];
bio(5).sigWidth=1;
bio(5).sigAddress='&AimIII_B.visual_select';
bio(5).ndims=2;
bio(5).size=[];


bio(6).blkName='FwdFlow_Stat';
bio(6).sigName='';
bio(6).portIdx=0;
bio(6).dim=[1,1];
bio(6).sigWidth=1;
bio(6).sigAddress='&AimIII_B.FwdFlow_Stat';
bio(6).ndims=2;
bio(6).size=[];


bio(7).blkName='Scope_gain';
bio(7).sigName='';
bio(7).portIdx=0;
bio(7).dim=[1,1];
bio(7).sigWidth=1;
bio(7).sigAddress='&AimIII_B.Scope_gain';
bio(7).ndims=2;
bio(7).size=[];


bio(8).blkName='scope_multiport_switch First input is the desired position Second inpt is the measured position Third input is measured Torque Fourth input is visual feedback signal';
bio(8).sigName='';
bio(8).portIdx=0;
bio(8).dim=[1,1];
bio(8).sigWidth=1;
bio(8).sigAddress='&AimIII_B.scope_multiport_switchFirstin_m';
bio(8).ndims=2;
bio(8).size=[];


bio(9).blkName='PCIM-DAS1602 16 1/p1';
bio(9).sigName='';
bio(9).portIdx=0;
bio(9).dim=[1,1];
bio(9).sigWidth=1;
bio(9).sigAddress='&AimIII_B.PCIMDAS1602161_o1';
bio(9).ndims=2;
bio(9).size=[];


bio(10).blkName='PCIM-DAS1602 16 1/p2';
bio(10).sigName='Torque';
bio(10).portIdx=1;
bio(10).dim=[1,1];
bio(10).sigWidth=1;
bio(10).sigAddress='&AimIII_B.Torque';
bio(10).ndims=2;
bio(10).size=[];


bio(11).blkName='PCIM-DAS1602 16 1/p3';
bio(11).sigName='';
bio(11).portIdx=2;
bio(11).dim=[1,1];
bio(11).sigWidth=1;
bio(11).sigAddress='&AimIII_B.PCIMDAS1602161_o3';
bio(11).ndims=2;
bio(11).size=[];


bio(12).blkName='PCIM-DAS1602 16 1/p4';
bio(12).sigName='Position';
bio(12).portIdx=3;
bio(12).dim=[1,1];
bio(12).sigWidth=1;
bio(12).sigAddress='&AimIII_B.Position';
bio(12).ndims=2;
bio(12).size=[];


bio(13).blkName='PCIM-DAS1602 16 1/p5';
bio(13).sigName='';
bio(13).portIdx=4;
bio(13).dim=[1,1];
bio(13).sigWidth=1;
bio(13).sigAddress='&AimIII_B.PCIMDAS1602161_o5';
bio(13).ndims=2;
bio(13).size=[];


bio(14).blkName='PCIM-DAS1602 16 1/p6';
bio(14).sigName='';
bio(14).portIdx=5;
bio(14).dim=[1,1];
bio(14).sigWidth=1;
bio(14).sigAddress='&AimIII_B.PCIMDAS1602161_o6';
bio(14).ndims=2;
bio(14).size=[];


bio(15).blkName='PCIM-DDA06 16 2';
bio(15).sigName='';
bio(15).portIdx=0;
bio(15).dim=[1,1];
bio(15).sigWidth=1;
bio(15).sigAddress='&AimIII_B.PCIMDDA06162';
bio(15).ndims=2;
bio(15).size=[];


bio(16).blkName='Stim1/p1';
bio(16).sigName='';
bio(16).portIdx=0;
bio(16).dim=[3,1];
bio(16).sigWidth=3;
bio(16).sigAddress='&AimIII_B.Stim1_o1[0]';
bio(16).ndims=2;
bio(16).size=[];


bio(17).blkName='Stim1/p2';
bio(17).sigName='';
bio(17).portIdx=1;
bio(17).dim=[1,1];
bio(17).sigWidth=1;
bio(17).sigAddress='&AimIII_B.Stim1_o2';
bio(17).ndims=2;
bio(17).size=[];


bio(18).blkName='Stim1/p3';
bio(18).sigName='';
bio(18).portIdx=2;
bio(18).dim=[1,1];
bio(18).sigWidth=1;
bio(18).sigAddress='&AimIII_B.Stim1_o3';
bio(18).ndims=2;
bio(18).size=[];


bio(19).blkName='Sum1';
bio(19).sigName='';
bio(19).portIdx=0;
bio(19).dim=[1,1];
bio(19).sigWidth=1;
bio(19).sigAddress='&AimIII_B.Sum1_l';
bio(19).ndims=2;
bio(19).size=[];


bio(20).blkName='Sum2';
bio(20).sigName='';
bio(20).portIdx=0;
bio(20).dim=[1,1];
bio(20).sigWidth=1;
bio(20).sigAddress='&AimIII_B.Sum2_m';
bio(20).ndims=2;
bio(20).size=[];


bio(21).blkName='Switch';
bio(21).sigName='';
bio(21).portIdx=0;
bio(21).dim=[1,1];
bio(21).sigWidth=1;
bio(21).sigAddress='&AimIII_B.Switch_b';
bio(21).ndims=2;
bio(21).size=[];


bio(22).blkName='Switch1';
bio(22).sigName='';
bio(22).portIdx=0;
bio(22).dim=[1,1];
bio(22).sigWidth=1;
bio(22).sigAddress='&AimIII_B.Switch1';
bio(22).ndims=2;
bio(22).size=[];


bio(23).blkName='Buffer Width';
bio(23).sigName='';
bio(23).portIdx=0;
bio(23).dim=[1,1];
bio(23).sigWidth=1;
bio(23).sigAddress='&AimIII_B.BufferWidth';
bio(23).ndims=2;
bio(23).size=[];


bio(24).blkName='Servo Controller/Dead Zone';
bio(24).sigName='';
bio(24).portIdx=0;
bio(24).dim=[1,1];
bio(24).sigWidth=1;
bio(24).sigAddress='&AimIII_B.DeadZone_l';
bio(24).ndims=2;
bio(24).size=[];


bio(25).blkName='Servo Controller/Derivative';
bio(25).sigName='';
bio(25).portIdx=0;
bio(25).dim=[1,1];
bio(25).sigWidth=1;
bio(25).sigAddress='&AimIII_B.Derivative';
bio(25).ndims=2;
bio(25).size=[];


bio(26).blkName='Servo Controller/Derivative1';
bio(26).sigName='';
bio(26).portIdx=0;
bio(26).dim=[1,1];
bio(26).sigWidth=1;
bio(26).sigAddress='&AimIII_B.Derivative1';
bio(26).ndims=2;
bio(26).size=[];


bio(27).blkName='Servo Controller/D';
bio(27).sigName='';
bio(27).portIdx=0;
bio(27).dim=[1,1];
bio(27).sigWidth=1;
bio(27).sigAddress='&AimIII_B.D';
bio(27).ndims=2;
bio(27).size=[];


bio(28).blkName='Servo Controller/I';
bio(28).sigName='';
bio(28).portIdx=0;
bio(28).dim=[1,1];
bio(28).sigWidth=1;
bio(28).sigAddress='&AimIII_B.I';
bio(28).ndims=2;
bio(28).size=[];


bio(29).blkName='Servo Controller/P';
bio(29).sigName='';
bio(29).portIdx=0;
bio(29).dim=[1,1];
bio(29).sigWidth=1;
bio(29).sigAddress='&AimIII_B.P';
bio(29).ndims=2;
bio(29).size=[];


bio(30).blkName='Servo Controller/ddt_gain';
bio(30).sigName='';
bio(30).portIdx=0;
bio(30).dim=[1,1];
bio(30).sigWidth=1;
bio(30).sigAddress='&AimIII_B.ddt_gain';
bio(30).ndims=2;
bio(30).size=[];


bio(31).blkName='Servo Controller/didder_gain';
bio(31).sigName='';
bio(31).portIdx=0;
bio(31).dim=[1,1];
bio(31).sigWidth=1;
bio(31).sigAddress='&AimIII_B.didder_gain';
bio(31).ndims=2;
bio(31).size=[];


bio(32).blkName='Servo Controller/Integrator';
bio(32).sigName='';
bio(32).portIdx=0;
bio(32).dim=[1,1];
bio(32).sigWidth=1;
bio(32).sigAddress='&AimIII_B.Integrator';
bio(32).ndims=2;
bio(32).size=[];


bio(33).blkName='Servo Controller/Saturation';
bio(33).sigName='';
bio(33).portIdx=0;
bio(33).dim=[1,1];
bio(33).sigWidth=1;
bio(33).sigAddress='&AimIII_B.Saturation';
bio(33).ndims=2;
bio(33).size=[];


bio(34).blkName='Servo Controller/Saturation1';
bio(34).sigName='';
bio(34).portIdx=0;
bio(34).dim=[1,1];
bio(34).sigWidth=1;
bio(34).sigAddress='&AimIII_B.Saturation1';
bio(34).ndims=2;
bio(34).size=[];


bio(35).blkName='Servo Controller/Saturation2';
bio(35).sigName='';
bio(35).portIdx=0;
bio(35).dim=[1,1];
bio(35).sigWidth=1;
bio(35).sigAddress='&AimIII_B.Saturation2';
bio(35).ndims=2;
bio(35).size=[];


bio(36).blkName='Servo Controller/N-Sample Enable1';
bio(36).sigName='';
bio(36).portIdx=0;
bio(36).dim=[1,1];
bio(36).sigWidth=1;
bio(36).sigAddress='&AimIII_B.NSampleEnable1';
bio(36).ndims=2;
bio(36).size=[];


bio(37).blkName='Servo Controller/Cut-off 1 Hz1';
bio(37).sigName='';
bio(37).portIdx=0;
bio(37).dim=[1,1];
bio(37).sigWidth=1;
bio(37).sigAddress='&AimIII_B.Cutoff1Hz1';
bio(37).ndims=2;
bio(37).size=[];


bio(38).blkName='Servo Controller/Cut-off 35 Hz';
bio(38).sigName='';
bio(38).portIdx=0;
bio(38).dim=[1,1];
bio(38).sigWidth=1;
bio(38).sigAddress='&AimIII_B.Cutoff35Hz';
bio(38).ndims=2;
bio(38).size=[];


bio(39).blkName='Servo Controller/Sum';
bio(39).sigName='';
bio(39).portIdx=0;
bio(39).dim=[1,1];
bio(39).sigWidth=1;
bio(39).sigAddress='&AimIII_B.Sum';
bio(39).ndims=2;
bio(39).size=[];


bio(40).blkName='Servo Controller/Sum1';
bio(40).sigName='';
bio(40).portIdx=0;
bio(40).dim=[1,1];
bio(40).sigWidth=1;
bio(40).sigAddress='&AimIII_B.Sum1';
bio(40).ndims=2;
bio(40).size=[];


bio(41).blkName='Servo Controller/Sum2';
bio(41).sigName='';
bio(41).portIdx=0;
bio(41).dim=[1,1];
bio(41).sigWidth=1;
bio(41).sigAddress='&AimIII_B.Sum2';
bio(41).ndims=2;
bio(41).size=[];


bio(42).blkName='Servo Controller/Sum3';
bio(42).sigName='';
bio(42).portIdx=0;
bio(42).dim=[1,1];
bio(42).sigWidth=1;
bio(42).sigAddress='&AimIII_B.Sum3';
bio(42).ndims=2;
bio(42).size=[];


bio(43).blkName='Servo Controller/Sum5';
bio(43).sigName='';
bio(43).portIdx=0;
bio(43).dim=[1,1];
bio(43).sigWidth=1;
bio(43).sigAddress='&AimIII_B.Sum5';
bio(43).ndims=2;
bio(43).size=[];


bio(44).blkName='Servo Controller/Uniform Random Number 0.1 ms';
bio(44).sigName='';
bio(44).portIdx=0;
bio(44).dim=[1,1];
bio(44).sigWidth=1;
bio(44).sigAddress='&AimIII_B.UniformRandomNumber01ms';
bio(44).ndims=2;
bio(44).size=[];


bio(45).blkName='Trigger Data Acquisition/Hearbeat';
bio(45).sigName='';
bio(45).portIdx=0;
bio(45).dim=[1,1];
bio(45).sigWidth=1;
bio(45).sigAddress='&AimIII_B.Hearbeat';
bio(45).ndims=2;
bio(45).size=[];


bio(46).blkName='Trigger Data Acquisition/Memory7';
bio(46).sigName='';
bio(46).portIdx=0;
bio(46).dim=[1,1];
bio(46).sigWidth=1;
bio(46).sigAddress='&AimIII_B.Memory7';
bio(46).ndims=2;
bio(46).size=[];


bio(47).blkName='Trigger Data Acquisition/Product1';
bio(47).sigName='';
bio(47).portIdx=0;
bio(47).dim=[1,1];
bio(47).sigWidth=1;
bio(47).sigAddress='&AimIII_B.Product1';
bio(47).ndims=2;
bio(47).size=[];


bio(48).blkName='Trigger Data Acquisition/Switch';
bio(48).sigName='';
bio(48).portIdx=0;
bio(48).dim=[1,1];
bio(48).sigWidth=1;
bio(48).sigAddress='&AimIII_B.Switch_d';
bio(48).ndims=2;
bio(48).size=[];


bio(49).blkName='Visual Feedback Controller/Abs';
bio(49).sigName='';
bio(49).portIdx=0;
bio(49).dim=[1,1];
bio(49).sigWidth=1;
bio(49).sigAddress='&AimIII_B.Abs';
bio(49).ndims=2;
bio(49).size=[];


bio(50).blkName='Visual Feedback Controller/zero';
bio(50).sigName='';
bio(50).portIdx=0;
bio(50).dim=[1,1];
bio(50).sigWidth=1;
bio(50).sigAddress='&AimIII_B.zero';
bio(50).ndims=2;
bio(50).size=[];


bio(51).blkName='Visual Feedback Controller/Pulse Generator';
bio(51).sigName='';
bio(51).portIdx=0;
bio(51).dim=[1,1];
bio(51).sigWidth=1;
bio(51).sigAddress='&AimIII_B.PulseGenerator';
bio(51).ndims=2;
bio(51).size=[];


bio(52).blkName='Visual Feedback Controller/ten';
bio(52).sigName='';
bio(52).portIdx=0;
bio(52).dim=[1,1];
bio(52).sigWidth=1;
bio(52).sigAddress='&AimIII_B.ten';
bio(52).ndims=2;
bio(52).size=[];


bio(53).blkName='Visual Feedback Controller/ten1';
bio(53).sigName='';
bio(53).portIdx=0;
bio(53).dim=[1,1];
bio(53).sigWidth=1;
bio(53).sigAddress='&AimIII_B.ten1';
bio(53).ndims=2;
bio(53).size=[];


bio(54).blkName='Visual Feedback Controller/volt_to_tq';
bio(54).sigName='';
bio(54).portIdx=0;
bio(54).dim=[1,1];
bio(54).sigWidth=1;
bio(54).sigAddress='&AimIII_B.volt_to_tq';
bio(54).ndims=2;
bio(54).size=[];


bio(55).blkName='Visual Feedback Controller/scope_multiport_switch First input is the desired position Second inpt is the measured position Third input is measured Torque Fourth input is visual feedback signal';
bio(55).sigName='';
bio(55).portIdx=0;
bio(55).dim=[2,1];
bio(55).sigWidth=2;
bio(55).sigAddress='&AimIII_B.scope_multiport_switchFirstin_c[0]';
bio(55).ndims=2;
bio(55).size=[];


bio(56).blkName='Visual Feedback Controller/Divide';
bio(56).sigName='';
bio(56).portIdx=0;
bio(56).dim=[1,1];
bio(56).sigWidth=1;
bio(56).sigAddress='&AimIII_B.Divide';
bio(56).ndims=2;
bio(56).size=[];


bio(57).blkName='Visual Feedback Controller/Divide1';
bio(57).sigName='';
bio(57).portIdx=0;
bio(57).dim=[1,1];
bio(57).sigWidth=1;
bio(57).sigAddress='&AimIII_B.Divide1';
bio(57).ndims=2;
bio(57).size=[];


bio(58).blkName='Visual Feedback Controller/Cut-off 0.7 Hz';
bio(58).sigName='';
bio(58).portIdx=0;
bio(58).dim=[1,1];
bio(58).sigWidth=1;
bio(58).sigAddress='&AimIII_B.Cutoff07Hz';
bio(58).ndims=2;
bio(58).size=[];


bio(59).blkName='Visual Feedback Controller/Sum4';
bio(59).sigName='';
bio(59).portIdx=0;
bio(59).dim=[1,1];
bio(59).sigWidth=1;
bio(59).sigAddress='&AimIII_B.Sum4';
bio(59).ndims=2;
bio(59).size=[];


bio(60).blkName='Visual Feedback Controller/Sum5';
bio(60).sigName='';
bio(60).portIdx=0;
bio(60).dim=[1,1];
bio(60).sigWidth=1;
bio(60).sigAddress='&AimIII_B.Sum5_d';
bio(60).ndims=2;
bio(60).size=[];


bio(61).blkName='Servo Controller/Sample and Hold/In';
bio(61).sigName='';
bio(61).portIdx=0;
bio(61).dim=[1,1];
bio(61).sigWidth=1;
bio(61).sigAddress='&AimIII_B.In';
bio(61).ndims=2;
bio(61).size=[];


bio(62).blkName='Trigger Data Acquisition/N-Sample Switch/N-Sample Enable';
bio(62).sigName='';
bio(62).portIdx=0;
bio(62).dim=[1,1];
bio(62).sigWidth=1;
bio(62).sigAddress='&AimIII_B.NSampleEnable';
bio(62).ndims=2;
bio(62).size=[];


bio(63).blkName='Trigger Data Acquisition/N-Sample Switch/Switch';
bio(63).sigName='';
bio(63).portIdx=0;
bio(63).dim=[1,1];
bio(63).sigWidth=1;
bio(63).sigAddress='&AimIII_B.Switch_g';
bio(63).ndims=2;
bio(63).size=[];


bio(64).blkName='Visual Feedback Controller/Data to TWITCH/Rate Transition';
bio(64).sigName='';
bio(64).portIdx=0;
bio(64).dim=[16,1];
bio(64).sigWidth=16;
bio(64).sigAddress='&AimIII_B.RateTransition[0]';
bio(64).ndims=2;
bio(64).size=[];


bio(65).blkName='Visual Feedback Controller/Data to TWITCH/Pack';
bio(65).sigName='';
bio(65).portIdx=0;
bio(65).dim=[16,1];
bio(65).sigWidth=16;
bio(65).sigAddress='&AimIII_B.Pack[0]';
bio(65).ndims=2;
bio(65).size=[];


bio(66).blkName='Visual Feedback Controller/Reference Processing System/Dead Zone';
bio(66).sigName='';
bio(66).portIdx=0;
bio(66).dim=[1,1];
bio(66).sigWidth=1;
bio(66).sigAddress='&AimIII_B.DeadZone';
bio(66).ndims=2;
bio(66).size=[];


bio(67).blkName='Visual Feedback Controller/Reference Processing System/scope_multiport_switch First input is the desired position Second inpt is the measured position Third input is measured Torque Fourth input is visual feedback signal1';
bio(67).sigName='';
bio(67).portIdx=0;
bio(67).dim=[1,1];
bio(67).sigWidth=1;
bio(67).sigAddress='&AimIII_B.scope_multiport_switchFirstinpu';
bio(67).ndims=2;
bio(67).size=[];


bio(68).blkName='Visual Feedback Controller/Reference Processing System/Sign';
bio(68).sigName='';
bio(68).portIdx=0;
bio(68).dim=[1,1];
bio(68).sigWidth=1;
bio(68).sigAddress='&AimIII_B.Sign';
bio(68).ndims=2;
bio(68).size=[];


bio(69).blkName='Visual Feedback Controller/Reference Processing System/Add';
bio(69).sigName='';
bio(69).portIdx=0;
bio(69).dim=[1,1];
bio(69).sigWidth=1;
bio(69).sigAddress='&AimIII_B.Add';
bio(69).ndims=2;
bio(69).size=[];


bio(70).blkName='Visual Feedback Controller/Reference Processing System/Switch';
bio(70).sigName='';
bio(70).portIdx=0;
bio(70).dim=[1,1];
bio(70).sigWidth=1;
bio(70).sigAddress='&AimIII_B.Switch';
bio(70).ndims=2;
bio(70).size=[];


bio(71).blkName='Visual Feedback Controller/Reference Processing System/Switch1';
bio(71).sigName='';
bio(71).portIdx=0;
bio(71).dim=[1,1];
bio(71).sigWidth=1;
bio(71).sigAddress='&AimIII_B.Switch1_d';
bio(71).ndims=2;
bio(71).size=[];


bio(72).blkName='Visual Feedback Controller/Reference Processing System/Switch2';
bio(72).sigName='';
bio(72).portIdx=0;
bio(72).dim=[1,1];
bio(72).sigWidth=1;
bio(72).sigAddress='&AimIII_B.Switch2';
bio(72).ndims=2;
bio(72).size=[];


bio(73).blkName='Visual Feedback Controller/Reference Processing System/Switch3';
bio(73).sigName='';
bio(73).portIdx=0;
bio(73).dim=[1,1];
bio(73).sigWidth=1;
bio(73).sigAddress='&AimIII_B.Switch3';
bio(73).ndims=2;
bio(73).size=[];


bio(74).blkName='Visual Feedback Controller/Reference Processing System/Compare To Constant/Compare';
bio(74).sigName='';
bio(74).portIdx=0;
bio(74).dim=[1,1];
bio(74).sigWidth=1;
bio(74).sigAddress='&AimIII_B.Compare';
bio(74).ndims=2;
bio(74).size=[];


bio(75).blkName='Visual Feedback Controller/Reference Processing System/Compare To Constant1/Compare';
bio(75).sigName='';
bio(75).portIdx=0;
bio(75).dim=[1,1];
bio(75).sigWidth=1;
bio(75).sigAddress='&AimIII_B.Compare_g';
bio(75).ndims=2;
bio(75).size=[];


function len = getlenBIO
len = 75;

