import Qspace.pdqb.PellProjection
import Qspace.pdqb.PhiProjection

namespace Qspace.pdqb

/--
Phi channel over 8 steps from 0 gives complete sequential traversal.
-/
theorem phi_display_trace_0_8 :
  phiDisplayTrace 0 8 = [1,2,3,4,5,6,7,8] := by
  rfl

/--
Pell channel over 8 steps from 0 gives restricted even traversal.
-/
theorem pell_display_trace_0_8 :
  pellDisplayTrace 0 8 = [2,4,6,8,2,4,6,8] := by
  rfl

/--
Phi channel is complete over the displayed 8-state cycle at this base point.
-/
def PhiChannelComplete : Prop :=
  phiDisplayTrace 0 8 = [1,2,3,4,5,6,7,8]

/--
Pell channel is restricted to the even subcycle at this base point.
-/
def PellChannelRestricted : Prop :=
  pellDisplayTrace 0 8 = [2,4,6,8,2,4,6,8]

/--
Both channels are lawful projections of the same substrate mechanism.
-/
def ClassicalProjectionChannels : Prop :=
  PhiChannelComplete ∧ PellChannelRestricted

/--
Unified theorem for the two classical projection channels.
-/
theorem classical_projection_channels :
  ClassicalProjectionChannels := by
  refine ⟨?_, ?_⟩
  · exact phi_display_trace_0_8
  · exact pell_display_trace_0_8

end Qspace.pdqb
