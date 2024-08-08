#ifndef RTW_HEADER_Supine_SpeedGoat_v1_original_cal_h_
#define RTW_HEADER_Supine_SpeedGoat_v1_original_cal_h_
#include "rtwtypes.h"

/* Storage class 'PageSwitching', for system '<Root>' */
struct Supine_SpeedGoat_v1_or_cal_type {
  uint32_T NSampleEnable1_ActiveLevel;
                                   /* Mask Parameter: NSampleEnable1_ActiveLevel
                                    * Referenced by: '<S2>/N-Sample Enable1'
                                    */
  uint32_T NSampleEnable_ActiveLevel;
                                    /* Mask Parameter: NSampleEnable_ActiveLevel
                                     * Referenced by: '<S5>/N-Sample Enable'
                                     */
  uint32_T NSampleEnable1_N;           /* Mask Parameter: NSampleEnable1_N
                                        * Referenced by: '<S2>/N-Sample Enable1'
                                        */
  uint32_T NSampleSwitch_N;            /* Mask Parameter: NSampleSwitch_N
                                        * Referenced by: '<S5>/N-Sample Enable'
                                        */
  real_T Constant1_Value;              /* Expression: 0
                                        * Referenced by: '<S4>/Constant1'
                                        */
  real_T Constant2_Value;              /* Expression: 1
                                        * Referenced by: '<S4>/Constant2'
                                        */
  real_T _Y0;                          /* Expression: initCond
                                        * Referenced by: '<S6>/ '
                                        */
  real_T PERCENT_MVC_Gain;             /* Expression: 0.40
                                        * Referenced by: '<S8>/PERCENT_MVC'
                                        */
  real_T Contraction3_Value;           /* Expression: 0
                                        * Referenced by: '<S8>/Contraction3'
                                        */
  real_T n6_PUSH1_Value;               /* Expression: 0.378
                                        * Referenced by: '<S10>/n6_PUSH1'
                                        */
  real_T n4_PUSH1_Value;               /* Expression: 0.4
                                        * Referenced by: '<S10>/n4_PUSH1'
                                        */
  real_T n3_PUSH1_Value;               /* Expression: 0
                                        * Referenced by: '<S10>/n3_PUSH1'
                                        */
  real_T n1_PUSH1_Value;               /* Expression: 0
                                        * Referenced by: '<S10>/n1_PUSH1'
                                        */
  real_T n0_PUSH1_Value;               /* Expression: 0
                                        * Referenced by: '<S10>/n0_PUSH1'
                                        */
  real_T p1_PUSH1_Value;               /* Expression: 0
                                        * Referenced by: '<S10>/p1_PUSH1'
                                        */
  real_T p3_PUSH1_Value;               /* Expression: 0
                                        * Referenced by: '<S10>/p3_PUSH1'
                                        */
  real_T p4_PUSH1_Value;               /* Expression: 0
                                        * Referenced by: '<S10>/p4_PUSH1'
                                        */
  real_T n6_PUSH_Value;                /* Expression: 0.095
                                        * Referenced by: '<S10>/n6_PUSH'
                                        */
  real_T n4_PUSH_Value;                /* Expression: 0.097
                                        * Referenced by: '<S10>/n4_PUSH'
                                        */
  real_T n3_PUSH_Value;                /* Expression: 0.095
                                        * Referenced by: '<S10>/n3_PUSH'
                                        */
  real_T n1_PUSH_Value;                /* Expression: 0.143
                                        * Referenced by: '<S10>/n1_PUSH'
                                        */
  real_T n0_PUSH_Value;                /* Expression: 0.2
                                        * Referenced by: '<S10>/n0_PUSH'
                                        */
  real_T p1_PUSH_Value;                /* Expression: 0.25
                                        * Referenced by: '<S10>/p1_PUSH'
                                        */
  real_T p3_PUSH_Value;                /* Expression: 0.29
                                        * Referenced by: '<S10>/p3_PUSH'
                                        */
  real_T p4_PUSH_Value;                /* Expression: 0.34
                                        * Referenced by: '<S10>/p4_PUSH'
                                        */
  real_T Setup_P1_Size[2];             /* Computed Parameter: Setup_P1_Size
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P1;                     /* Expression: parPciSlot
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P2_Size[2];             /* Computed Parameter: Setup_P2_Size
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P2;                     /* Expression: parModuleId
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P3_Size[2];             /* Computed Parameter: Setup_P3_Size
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P3;                     /* Expression: parTriggerSignal
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P4_Size[2];             /* Computed Parameter: Setup_P4_Size
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P4[8];                  /* Expression: parAdcChannels
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P5_Size[2];             /* Computed Parameter: Setup_P5_Size
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P5;                     /* Expression: parAdcMode
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P6_Size[2];             /* Computed Parameter: Setup_P6_Size
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P6[8];                  /* Expression: parAdcRanges
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P7_Size[2];             /* Computed Parameter: Setup_P7_Size
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P7[4];                  /* Expression: parDacChannels
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P8_Size[2];             /* Computed Parameter: Setup_P8_Size
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P8[4];                  /* Expression: parDacRanges
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P9_Size[2];             /* Computed Parameter: Setup_P9_Size
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Setup_P9[7];                  /* Expression: parDioFirstControl
                                        * Referenced by: '<Root>/Setup '
                                        */
  real_T Analoginput_P1_Size[2];      /* Computed Parameter: Analoginput_P1_Size
                                       * Referenced by: '<Root>/Analog input '
                                       */
  real_T Analoginput_P1;               /* Expression: parModuleId
                                        * Referenced by: '<Root>/Analog input '
                                        */
  real_T Analoginput_P2_Size[2];      /* Computed Parameter: Analoginput_P2_Size
                                       * Referenced by: '<Root>/Analog input '
                                       */
  real_T Analoginput_P2;               /* Expression: parSampleTime
                                        * Referenced by: '<Root>/Analog input '
                                        */
  real_T Analoginput_P3_Size[2];      /* Computed Parameter: Analoginput_P3_Size
                                       * Referenced by: '<Root>/Analog input '
                                       */
  real_T Analoginput_P3;               /* Expression: parPciSlot
                                        * Referenced by: '<Root>/Analog input '
                                        */
  real_T Analoginput_P4_Size[2];      /* Computed Parameter: Analoginput_P4_Size
                                       * Referenced by: '<Root>/Analog input '
                                       */
  real_T Analoginput_P4[8];            /* Expression: parAdcChannels
                                        * Referenced by: '<Root>/Analog input '
                                        */
  real_T Analoginput_P5_Size[2];      /* Computed Parameter: Analoginput_P5_Size
                                       * Referenced by: '<Root>/Analog input '
                                       */
  real_T Analoginput_P5;               /* Expression: parAdcMode
                                        * Referenced by: '<Root>/Analog input '
                                        */
  real_T Analoginput_P6_Size[2];      /* Computed Parameter: Analoginput_P6_Size
                                       * Referenced by: '<Root>/Analog input '
                                       */
  real_T Analoginput_P6;               /* Expression: parAdcRate
                                        * Referenced by: '<Root>/Analog input '
                                        */
  real_T Analoginput_P7_Size[2];      /* Computed Parameter: Analoginput_P7_Size
                                       * Referenced by: '<Root>/Analog input '
                                       */
  real_T Analoginput_P7[8];            /* Expression: parAdcRanges
                                        * Referenced by: '<Root>/Analog input '
                                        */
  real_T Analoginput_P8_Size[2];      /* Computed Parameter: Analoginput_P8_Size
                                       * Referenced by: '<Root>/Analog input '
                                       */
  real_T Analoginput_P8[2];            /* Expression: parAdcInitValues
                                        * Referenced by: '<Root>/Analog input '
                                        */
  real_T Analoginput_P9_Size[2];      /* Computed Parameter: Analoginput_P9_Size
                                       * Referenced by: '<Root>/Analog input '
                                       */
  real_T Analoginput_P9[2];            /* Expression: parAdcResets
                                        * Referenced by: '<Root>/Analog input '
                                        */
  real_T Gain1_Gain;                   /* Expression: 0.1
                                        * Referenced by: '<Root>/Gain1'
                                        */
  real_T Cutoff1Hz1_A_pr[3];           /* Computed Parameter: Cutoff1Hz1_A_pr
                                        * Referenced by: '<S2>/Cut-off 1 Hz1'
                                        */
  real_T Cutoff1Hz1_B_pr;              /* Computed Parameter: Cutoff1Hz1_B_pr
                                        * Referenced by: '<S2>/Cut-off 1 Hz1'
                                        */
  real_T Cutoff1Hz1_C_pr;              /* Computed Parameter: Cutoff1Hz1_C_pr
                                        * Referenced by: '<S2>/Cut-off 1 Hz1'
                                        */
  real_T Cutoff1Hz1_InitialCondition;  /* Expression: 0
                                        * Referenced by: '<S2>/Cut-off 1 Hz1'
                                        */
  real_T em_null_Gain;                 /* Expression: 1
                                        * Referenced by: '<Root>/em_null'
                                        */
  real_T P_Gain;                       /* Expression: 67
                                        * Referenced by: '<S2>/P'
                                        */
  real_T D_Gain;                       /* Expression: 0.01
                                        * Referenced by: '<S2>/D'
                                        */
  real_T Saturation_UpperSat;          /* Expression: 0.5
                                        * Referenced by: '<S2>/Saturation'
                                        */
  real_T Saturation_LowerSat;          /* Expression: -0.5
                                        * Referenced by: '<S2>/Saturation'
                                        */
  real_T Integrator_IC;                /* Expression: 0
                                        * Referenced by: '<S2>/Integrator'
                                        */
  real_T Integrator_UpperSat;          /* Expression: 1
                                        * Referenced by: '<S2>/Integrator'
                                        */
  real_T Integrator_LowerSat;          /* Expression: -1
                                        * Referenced by: '<S2>/Integrator'
                                        */
  real_T Saturation1_UpperSat;         /* Expression: 1
                                        * Referenced by: '<S2>/Saturation1'
                                        */
  real_T Saturation1_LowerSat;         /* Expression: -1
                                        * Referenced by: '<S2>/Saturation1'
                                        */
  real_T ddt_gain_Gain;                /* Expression: 0
                                        * Referenced by: '<S2>/ddt_gain'
                                        */
  real_T Saturation2_UpperSat;         /* Expression: 1
                                        * Referenced by: '<S2>/Saturation2'
                                        */
  real_T Saturation2_LowerSat;         /* Expression: -1
                                        * Referenced by: '<S2>/Saturation2'
                                        */
  real_T UniformRandomNumber01ms_Minimum;/* Expression: -1
                                          * Referenced by: '<S2>/Uniform Random Number 0.1 ms'
                                          */
  real_T UniformRandomNumber01ms_Maximum;/* Expression: 1
                                          * Referenced by: '<S2>/Uniform Random Number 0.1 ms'
                                          */
  real_T UniformRandomNumber01ms_Seed; /* Expression: 0
                                        * Referenced by: '<S2>/Uniform Random Number 0.1 ms'
                                        */
  real_T Cutoff35Hz_A_pr[19];          /* Computed Parameter: Cutoff35Hz_A_pr
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  real_T Cutoff35Hz_B_pr[3];           /* Computed Parameter: Cutoff35Hz_B_pr
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  real_T Cutoff35Hz_C_pr[5];           /* Computed Parameter: Cutoff35Hz_C_pr
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  real_T Cutoff35Hz_D_pr;              /* Computed Parameter: Cutoff35Hz_D_pr
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  real_T Cutoff35Hz_InitialCondition;  /* Expression: 0
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  real_T didder_gain_Gain;             /* Expression: 0
                                        * Referenced by: '<S2>/didder_gain'
                                        */
  real_T Gain_Gain;                    /* Expression: 1
                                        * Referenced by: '<Root>/Gain'
                                        */
  real_T Gain3_Gain;                   /* Expression: 10
                                        * Referenced by: '<Root>/Gain3'
                                        */
  real_T Analogoutput_P1_Size[2];    /* Computed Parameter: Analogoutput_P1_Size
                                      * Referenced by: '<Root>/Analog output '
                                      */
  real_T Analogoutput_P1;              /* Expression: parModuleId
                                        * Referenced by: '<Root>/Analog output '
                                        */
  real_T Analogoutput_P2_Size[2];    /* Computed Parameter: Analogoutput_P2_Size
                                      * Referenced by: '<Root>/Analog output '
                                      */
  real_T Analogoutput_P2;              /* Expression: parSampleTime
                                        * Referenced by: '<Root>/Analog output '
                                        */
  real_T Analogoutput_P3_Size[2];    /* Computed Parameter: Analogoutput_P3_Size
                                      * Referenced by: '<Root>/Analog output '
                                      */
  real_T Analogoutput_P3;              /* Expression: parPciSlot
                                        * Referenced by: '<Root>/Analog output '
                                        */
  real_T Analogoutput_P4_Size[2];    /* Computed Parameter: Analogoutput_P4_Size
                                      * Referenced by: '<Root>/Analog output '
                                      */
  real_T Analogoutput_P4[4];           /* Expression: parDacChannels
                                        * Referenced by: '<Root>/Analog output '
                                        */
  real_T Analogoutput_P5_Size[2];    /* Computed Parameter: Analogoutput_P5_Size
                                      * Referenced by: '<Root>/Analog output '
                                      */
  real_T Analogoutput_P5[4];           /* Expression: parDacRanges
                                        * Referenced by: '<Root>/Analog output '
                                        */
  real_T Analogoutput_P6_Size[2];    /* Computed Parameter: Analogoutput_P6_Size
                                      * Referenced by: '<Root>/Analog output '
                                      */
  real_T Analogoutput_P6[4];           /* Expression: parDacInitValues
                                        * Referenced by: '<Root>/Analog output '
                                        */
  real_T Analogoutput_P7_Size[2];    /* Computed Parameter: Analogoutput_P7_Size
                                      * Referenced by: '<Root>/Analog output '
                                      */
  real_T Analogoutput_P7[4];           /* Expression: parDacResets
                                        * Referenced by: '<Root>/Analog output '
                                        */
  real_T Scope_offset_Value;           /* Expression: 0
                                        * Referenced by: '<Root>/Scope_offset'
                                        */
  real_T scope_switch_signal_Value;    /* Expression: 1
                                        * Referenced by: '<Root>/scope_switch_signal'
                                        */
  real_T position_switch4_Value;       /* Expression: 1
                                        * Referenced by: '<Root>/position_switch4'
                                        */
  real_T Scope_gain_Gain;              /* Expression: 1
                                        * Referenced by: '<Root>/Scope_gain'
                                        */
  real_T Gain2_Gain;                   /* Expression: 1
                                        * Referenced by: '<Root>/Gain2'
                                        */
  real_T POS_Offset_Value;             /* Expression: 0
                                        * Referenced by: '<Root>/POS_Offset'
                                        */
  real_T DeadZone_Start;               /* Expression: -0.01
                                        * Referenced by: '<S2>/Dead Zone'
                                        */
  real_T DeadZone_End;                 /* Expression: 0.01
                                        * Referenced by: '<S2>/Dead Zone'
                                        */
  real_T I_Gain;                       /* Expression: 0.02
                                        * Referenced by: '<S2>/I'
                                        */
  real_T TRIAL_SWITCH_Value;           /* Expression: 10
                                        * Referenced by: '<Root>/TRIAL_SWITCH'
                                        */
  real_T Contraction1_Value;           /* Expression: 1
                                        * Referenced by: '<S3>/Contraction1'
                                        */
  real_T Contraction_Value;            /* Expression: 0
                                        * Referenced by: '<S3>/Contraction'
                                        */
  real_T volt_to_tq1_Gain;             /* Expression: 200
                                        * Referenced by: '<S9>/volt_to_tq1'
                                        */
  real_T Contraction4_Value;           /* Expression: 2
                                        * Referenced by: '<S8>/Contraction4'
                                        */
  real_T RateTransition1_InitialConditio;/* Expression: 0
                                          * Referenced by: '<S8>/Rate Transition1'
                                          */
  real_T RateTransition2_InitialConditio;/* Expression: 0
                                          * Referenced by: '<S8>/Rate Transition2'
                                          */
  real_T RateTransition3_InitialConditio;/* Expression: 0
                                          * Referenced by: '<S8>/Rate Transition3'
                                          */
  real_T RateTransition4_InitialConditio;/* Expression: 0
                                          * Referenced by: '<S8>/Rate Transition4'
                                          */
  real_T RateTransition5_InitialConditio;/* Expression: 0
                                          * Referenced by: '<S8>/Rate Transition5'
                                          */
  real_T Switch_Threshold;             /* Expression: 0
                                        * Referenced by: '<S8>/Switch'
                                        */
  real_T uthorderBeselwithcutoff07HzGolk[15];
                          /* Computed Parameter: uthorderBeselwithcutoff07HzGolk
                           * Referenced by: '<S3>/8th order Besel with  cut-off 0.7 Hz  Golkar et al.'
                           */
  real_T uthorderBeselwithcutoff07HzGo_l;
                          /* Computed Parameter: uthorderBeselwithcutoff07HzGo_l
                           * Referenced by: '<S3>/8th order Besel with  cut-off 0.7 Hz  Golkar et al.'
                           */
  real_T uthorderBeselwithcutoff07HzGo_o;
                          /* Computed Parameter: uthorderBeselwithcutoff07HzGo_o
                           * Referenced by: '<S3>/8th order Besel with  cut-off 0.7 Hz  Golkar et al.'
                           */
  real_T uthorderBeselwithcutoff07HzGo_g;/* Expression: 0
                                          * Referenced by: '<S3>/8th order Besel with  cut-off 0.7 Hz  Golkar et al.'
                                          */
  real_T PERCENT_MVC_Gain_i;           /* Expression: 0.4
                                        * Referenced by: '<S3>/PERCENT_MVC'
                                        */
  real_T volt_to_tq_Gain;              /* Expression: 20
                                        * Referenced by: '<S3>/volt_to_tq'
                                        */
  real_T Constant_Value;               /* Expression: 1
                                        * Referenced by: '<S9>/Constant'
                                        */
  real_T PTQ_Gain;                     /* Expression: 10
                                        * Referenced by: '<S9>/PTQ'
                                        */
  real_T volt_to_tq_Gain_o;            /* Expression: 20
                                        * Referenced by: '<S9>/volt_to_tq'
                                        */
  real_T SineWave_Amp;                 /* Expression: 5
                                        * Referenced by: '<S3>/Sine Wave'
                                        */
  real_T SineWave_Bias;                /* Expression: 5
                                        * Referenced by: '<S3>/Sine Wave'
                                        */
  real_T SineWave_Freq;                /* Expression: 4*pi*(1/20)
                                        * Referenced by: '<S3>/Sine Wave'
                                        */
  real_T SineWave_Phase;               /* Expression: -pi/2
                                        * Referenced by: '<S3>/Sine Wave'
                                        */
  real_T Digitalinput_P1_Size[2];    /* Computed Parameter: Digitalinput_P1_Size
                                      * Referenced by: '<S1>/Digital input '
                                      */
  real_T Digitalinput_P1;              /* Expression: parModuleId
                                        * Referenced by: '<S1>/Digital input '
                                        */
  real_T Digitalinput_P2_Size[2];    /* Computed Parameter: Digitalinput_P2_Size
                                      * Referenced by: '<S1>/Digital input '
                                      */
  real_T Digitalinput_P2;              /* Expression: parSampleTime
                                        * Referenced by: '<S1>/Digital input '
                                        */
  real_T Digitalinput_P3_Size[2];    /* Computed Parameter: Digitalinput_P3_Size
                                      * Referenced by: '<S1>/Digital input '
                                      */
  real_T Digitalinput_P3;              /* Expression: parPciSlot
                                        * Referenced by: '<S1>/Digital input '
                                        */
  real_T Digitalinput_P4_Size[2];    /* Computed Parameter: Digitalinput_P4_Size
                                      * Referenced by: '<S1>/Digital input '
                                      */
  real_T Digitalinput_P4[2];           /* Expression: parDiChannels
                                        * Referenced by: '<S1>/Digital input '
                                        */
  real_T FwdFlow_Stat_Gain;            /* Expression: 1
                                        * Referenced by: '<S1>/FwdFlow_Stat'
                                        */
  real_T Memory7_InitialCondition;     /* Expression: 0
                                        * Referenced by: '<S4>/Memory7'
                                        */
  real_T Hearbeat_Amp;                 /* Expression: 1
                                        * Referenced by: '<S4>/Hearbeat'
                                        */
  real_T Hearbeat_Period;              /* Computed Parameter: Hearbeat_Period
                                        * Referenced by: '<S4>/Hearbeat'
                                        */
  real_T Hearbeat_Duty;                /* Computed Parameter: Hearbeat_Duty
                                        * Referenced by: '<S4>/Hearbeat'
                                        */
  real_T Hearbeat_PhaseDelay;          /* Expression: 0
                                        * Referenced by: '<S4>/Hearbeat'
                                        */
  real_T FwdFlow_Use_Value;            /* Expression: 1
                                        * Referenced by: '<S1>/FwdFlow_Use'
                                        */
  real_T Switch_Threshold_i;           /* Expression: 0.5
                                        * Referenced by: '<S4>/Switch'
                                        */
  real_T Digitaloutput_P1_Size[2];  /* Computed Parameter: Digitaloutput_P1_Size
                                     * Referenced by: '<S4>/Digital output '
                                     */
  real_T Digitaloutput_P1;             /* Expression: parModuleId
                                        * Referenced by: '<S4>/Digital output '
                                        */
  real_T Digitaloutput_P2_Size[2];  /* Computed Parameter: Digitaloutput_P2_Size
                                     * Referenced by: '<S4>/Digital output '
                                     */
  real_T Digitaloutput_P2;             /* Expression: parSampleTime
                                        * Referenced by: '<S4>/Digital output '
                                        */
  real_T Digitaloutput_P3_Size[2];  /* Computed Parameter: Digitaloutput_P3_Size
                                     * Referenced by: '<S4>/Digital output '
                                     */
  real_T Digitaloutput_P3;             /* Expression: parPciSlot
                                        * Referenced by: '<S4>/Digital output '
                                        */
  real_T Digitaloutput_P4_Size[2];  /* Computed Parameter: Digitaloutput_P4_Size
                                     * Referenced by: '<S4>/Digital output '
                                     */
  real_T Digitaloutput_P4[14];         /* Expression: parDoChannels
                                        * Referenced by: '<S4>/Digital output '
                                        */
  real_T Digitaloutput_P5_Size[2];  /* Computed Parameter: Digitaloutput_P5_Size
                                     * Referenced by: '<S4>/Digital output '
                                     */
  real_T Digitaloutput_P5[14];         /* Expression: parDoInitValues
                                        * Referenced by: '<S4>/Digital output '
                                        */
  real_T Digitaloutput_P6_Size[2];  /* Computed Parameter: Digitaloutput_P6_Size
                                     * Referenced by: '<S4>/Digital output '
                                     */
  real_T Digitaloutput_P6[14];         /* Expression: parDoResets
                                        * Referenced by: '<S4>/Digital output '
                                        */
  real_T Sample_Trigger_Value;         /* Expression: 0
                                        * Referenced by: '<S1>/Sample_Trigger'
                                        */
  real_T NumActuators_Value;           /* Expression: 1
                                        * Referenced by: '<S1>/NumActuators'
                                        */
  real_T position_switch4_Value_l;     /* Expression: 16
                                        * Referenced by: '<S7>/position_switch4'
                                        */
  real_T UniformRandomNumber_Minimum;  /* Expression: -1
                                        * Referenced by: '<S8>/Uniform Random Number'
                                        */
  real_T UniformRandomNumber_Maximum;  /* Expression: 1
                                        * Referenced by: '<S8>/Uniform Random Number'
                                        */
  real_T UniformRandomNumber_Seed;     /* Expression: 0
                                        * Referenced by: '<S8>/Uniform Random Number'
                                        */
  real_T UniformRandomNumber1_Minimum; /* Expression: -1
                                        * Referenced by: '<S8>/Uniform Random Number1'
                                        */
  real_T UniformRandomNumber1_Maximum; /* Expression: 1
                                        * Referenced by: '<S8>/Uniform Random Number1'
                                        */
  real_T UniformRandomNumber1_Seed;    /* Expression: 0
                                        * Referenced by: '<S8>/Uniform Random Number1'
                                        */
  real_T UniformRandomNumber4_Minimum; /* Expression: -1
                                        * Referenced by: '<S8>/Uniform Random Number4'
                                        */
  real_T UniformRandomNumber4_Maximum; /* Expression: 1
                                        * Referenced by: '<S8>/Uniform Random Number4'
                                        */
  real_T UniformRandomNumber4_Seed;    /* Expression: 0
                                        * Referenced by: '<S8>/Uniform Random Number4'
                                        */
  real_T UniformRandomNumber2_Minimum; /* Expression: -1
                                        * Referenced by: '<S8>/Uniform Random Number2'
                                        */
  real_T UniformRandomNumber2_Maximum; /* Expression: 1
                                        * Referenced by: '<S8>/Uniform Random Number2'
                                        */
  real_T UniformRandomNumber2_Seed;    /* Expression: 0
                                        * Referenced by: '<S8>/Uniform Random Number2'
                                        */
  real_T UniformRandomNumber3_Minimum; /* Expression: -1
                                        * Referenced by: '<S8>/Uniform Random Number3'
                                        */
  real_T UniformRandomNumber3_Maximum; /* Expression: 1
                                        * Referenced by: '<S8>/Uniform Random Number3'
                                        */
  real_T UniformRandomNumber3_Seed;    /* Expression: 0
                                        * Referenced by: '<S8>/Uniform Random Number3'
                                        */
  uint32_T Cutoff1Hz1_A_ir[3];         /* Computed Parameter: Cutoff1Hz1_A_ir
                                        * Referenced by: '<S2>/Cut-off 1 Hz1'
                                        */
  uint32_T Cutoff1Hz1_A_jc[3];         /* Computed Parameter: Cutoff1Hz1_A_jc
                                        * Referenced by: '<S2>/Cut-off 1 Hz1'
                                        */
  uint32_T Cutoff1Hz1_B_ir;            /* Computed Parameter: Cutoff1Hz1_B_ir
                                        * Referenced by: '<S2>/Cut-off 1 Hz1'
                                        */
  uint32_T Cutoff1Hz1_B_jc[2];         /* Computed Parameter: Cutoff1Hz1_B_jc
                                        * Referenced by: '<S2>/Cut-off 1 Hz1'
                                        */
  uint32_T Cutoff1Hz1_C_ir;            /* Computed Parameter: Cutoff1Hz1_C_ir
                                        * Referenced by: '<S2>/Cut-off 1 Hz1'
                                        */
  uint32_T Cutoff1Hz1_C_jc[3];         /* Computed Parameter: Cutoff1Hz1_C_jc
                                        * Referenced by: '<S2>/Cut-off 1 Hz1'
                                        */
  uint32_T Cutoff35Hz_A_ir[19];        /* Computed Parameter: Cutoff35Hz_A_ir
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  uint32_T Cutoff35Hz_A_jc[6];         /* Computed Parameter: Cutoff35Hz_A_jc
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  uint32_T Cutoff35Hz_B_ir[3];         /* Computed Parameter: Cutoff35Hz_B_ir
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  uint32_T Cutoff35Hz_B_jc[2];         /* Computed Parameter: Cutoff35Hz_B_jc
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  uint32_T Cutoff35Hz_C_ir[5];         /* Computed Parameter: Cutoff35Hz_C_ir
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  uint32_T Cutoff35Hz_C_jc[6];         /* Computed Parameter: Cutoff35Hz_C_jc
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  uint32_T Cutoff35Hz_D_ir;            /* Computed Parameter: Cutoff35Hz_D_ir
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  uint32_T Cutoff35Hz_D_jc[2];         /* Computed Parameter: Cutoff35Hz_D_jc
                                        * Referenced by: '<S2>/Cut-off 35 Hz'
                                        */
  uint32_T uthorderBeselwithcutoff07HzGo_d[15];
                          /* Computed Parameter: uthorderBeselwithcutoff07HzGo_d
                           * Referenced by: '<S3>/8th order Besel with  cut-off 0.7 Hz  Golkar et al.'
                           */
  uint32_T uthorderBeselwithcutoff07HzG_de[9];
                          /* Computed Parameter: uthorderBeselwithcutoff07HzG_de
                           * Referenced by: '<S3>/8th order Besel with  cut-off 0.7 Hz  Golkar et al.'
                           */
  uint32_T uthorderBeselwithcutoff07HzGo_a;
                          /* Computed Parameter: uthorderBeselwithcutoff07HzGo_a
                           * Referenced by: '<S3>/8th order Besel with  cut-off 0.7 Hz  Golkar et al.'
                           */
  uint32_T uthorderBeselwithcutoff07HzGo_i[2];
                          /* Computed Parameter: uthorderBeselwithcutoff07HzGo_i
                           * Referenced by: '<S3>/8th order Besel with  cut-off 0.7 Hz  Golkar et al.'
                           */
  uint32_T uthorderBeselwithcutoff07HzG_ok;
                          /* Computed Parameter: uthorderBeselwithcutoff07HzG_ok
                           * Referenced by: '<S3>/8th order Besel with  cut-off 0.7 Hz  Golkar et al.'
                           */
  uint32_T uthorderBeselwithcutoff07HzGo_c[9];
                          /* Computed Parameter: uthorderBeselwithcutoff07HzGo_c
                           * Referenced by: '<S3>/8th order Besel with  cut-off 0.7 Hz  Golkar et al.'
                           */
  uint16_T UDPSend1_toPort;            /* Computed Parameter: UDPSend1_toPort
                                        * Referenced by: '<S7>/UDP Send1'
                                        */
  uint8_T RateTransition_InitialCondition;
                          /* Computed Parameter: RateTransition_InitialCondition
                           * Referenced by: '<S7>/Rate Transition'
                           */
  uint8_T UDPSend1_toAddress[4];       /* Computed Parameter: UDPSend1_toAddress
                                        * Referenced by: '<S7>/UDP Send1'
                                        */
};

/* Storage class 'PageSwitching' */
extern Supine_SpeedGoat_v1_or_cal_type Supine_SpeedGoat_v1_or_cal_impl;
extern Supine_SpeedGoat_v1_or_cal_type *Supine_SpeedGoat_v1_origina_cal;

#endif                      /* RTW_HEADER_Supine_SpeedGoat_v1_original_cal_h_ */
