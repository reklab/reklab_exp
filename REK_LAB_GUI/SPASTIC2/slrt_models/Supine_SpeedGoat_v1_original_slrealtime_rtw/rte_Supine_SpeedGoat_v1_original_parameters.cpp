#include "rte_Supine_SpeedGoat_v1_original_parameters.h"
#include "Supine_SpeedGoat_v1_original.h"
#include "Supine_SpeedGoat_v1_original_cal.h"

extern Supine_SpeedGoat_v1_or_cal_type Supine_SpeedGoat_v1_or_cal_impl;
namespace slrealtime
{
  /* Description of SEGMENTS */
  SegmentVector segmentInfo {
    { (void*)&Supine_SpeedGoat_v1_or_cal_impl, (void**)
      &Supine_SpeedGoat_v1_origina_cal, sizeof(Supine_SpeedGoat_v1_or_cal_type),
      2 }
  };

  SegmentVector &getSegmentVector(void)
  {
    return segmentInfo;
  }
}                                      // slrealtime
