/-
Copyright 2026 The Capacity Atlas Authors
Licensed under the Apache License, Version 2.0 (the "License").
See the License for the specific language governing permissions and limitations.
-/

import CapacityAtlas.Channels.MultipleAccess
import CapacityAtlasMAC.Converse
import CapacityAtlasMAC.ProductCoding
import CapacityAtlasMAC.TimeSharing

namespace CapacityAtlasMAC

open CapacityAtlas MultipleAccess

variable {X₁ X₂ Y : Type*} [Fintype X₁] [Fintype X₂] [Fintype Y]

/-- Every finite time-sharing witness yields separate deterministic MAC codes. -/
theorem informationRegion_subset_operationalRegion (W : FiniteChannel (X₁ × X₂) Y) :
    informationRegion W ⊆ operationalRegion W := by
  classical
  rintro r ⟨hr₁, hr₂, k, weights, p₁, p₂, ha, hb, hc⟩
  apply achievableRate_of_timeSharing W weights
  apply achievableRate_of_productInput (timeSharingChannel W weights)
    (FiniteDistribution.productFamily p₁) (FiniteDistribution.productFamily p₂) r hr₁ hr₂
  · simpa only [leftInformation_timeSharing] using ha
  · simpa only [rightInformation_timeSharing] using hb
  · simpa only [jointInformation_timeSharing] using hc

/-- The full MAC region, including its boundary and zero-rate axes. -/
theorem capacityRegion (W : FiniteChannel (X₁ × X₂) Y) :
    operationalRegion W = informationRegion W :=
  Set.Subset.antisymm (operationalRegion_subset_informationRegion W)
    (informationRegion_subset_operationalRegion W)

/-- Direct evidence for the exact canonical Atlas proposition. -/
theorem capacityCertificate [Nonempty X₁] [Nonempty X₂]
    (W : FiniteChannel (X₁ × X₂) Y) : Channel.multipleAccessCapacityStatement W :=
  capacityRegion W

end CapacityAtlasMAC
