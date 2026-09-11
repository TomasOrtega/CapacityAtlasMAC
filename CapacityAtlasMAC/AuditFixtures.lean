/-
Copyright 2026 The Capacity Atlas Authors
Licensed under the Apache License, Version 2.0 (the "License").
See the License for the specific language governing permissions and limitations.
-/

import CapacityAtlasMAC

namespace CapacityAtlasMAC.AuditFixtures

/-- This valid theorem deliberately restricts all three alphabet universes. -/
theorem universeZeroCertificate {X₁ X₂ Y : Type} [Fintype X₁] [Fintype X₂] [Fintype Y]
    [Nonempty X₁] [Nonempty X₂] (W : CapacityAtlas.FiniteChannel (X₁ × X₂) Y) :
    CapacityAtlas.Channel.multipleAccessCapacityStatement W :=
  CapacityAtlasMAC.capacityCertificate W

end CapacityAtlasMAC.AuditFixtures
