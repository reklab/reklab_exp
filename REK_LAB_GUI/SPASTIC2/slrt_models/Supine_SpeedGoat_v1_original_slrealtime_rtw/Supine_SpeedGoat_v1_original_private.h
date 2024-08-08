/*
 * Supine_SpeedGoat_v1_original_private.h
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "Supine_SpeedGoat_v1_original".
 *
 * Model version              : 21.11
 * Simulink Coder version : 9.7 (R2022a) 13-Nov-2021
 * C++ source code generated on : Tue Jun 18 09:42:16 2024
 *
 * Target selection: slrealtime.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Linux 64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_Supine_SpeedGoat_v1_original_private_h_
#define RTW_HEADER_Supine_SpeedGoat_v1_original_private_h_
#include "rtwtypes.h"
#include "multiword_types.h"
#include "zero_crossing_types.h"
#include "Supine_SpeedGoat_v1_original.h"

/* Private macros used by the generated code to access rtModel */
#ifndef rtmIsMajorTimeStep
#define rtmIsMajorTimeStep(rtm)        (((rtm)->Timing.simTimeStep) == MAJOR_TIME_STEP)
#endif

#ifndef rtmIsMinorTimeStep
#define rtmIsMinorTimeStep(rtm)        (((rtm)->Timing.simTimeStep) == MINOR_TIME_STEP)
#endif

#ifndef rtmSetTFinal
#define rtmSetTFinal(rtm, val)         ((rtm)->Timing.tFinal = (val))
#endif

#ifndef rtmSetTPtr
#define rtmSetTPtr(rtm, val)           ((rtm)->Timing.t = (val))
#endif

#include "dsp_rt.h"  /* DSP System Toolbox general run time support functions */
#include "dspeph_rt.h"         /* DSP System Toolbox run time support library */

extern real_T rt_urand_Upu32_Yd_f_pw_snf(uint32_T *u);
extern void* slrtRegisterSignalToLoggingService(uintptr_t sigAddr);
extern "C" void sg_IO191_setup_s(SimStruct *rts);
extern "C" void sg_IO191_ad_s(SimStruct *rts);
extern "C" void sg_IO191_da_s(SimStruct *rts);
extern "C" void sg_IO191_di_s(SimStruct *rts);
extern "C" void sg_IO191_do_s(SimStruct *rts);

/* private model entry point functions */
extern void Supine_SpeedGoat_v1_original_derivatives(void);

#endif                  /* RTW_HEADER_Supine_SpeedGoat_v1_original_private_h_ */
