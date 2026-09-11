# Capacity Atlas: two-user discrete memoryless MAC

A Lean proof of the complete capacity region for a finite two-user memoryless multiple-access channel. Each deterministic encoder knows only its own independent uniform message. One decoder recovers the pair, with vanishing average joint error. Codes exist at every sufficiently large blocklength with arbitrarily small rate slack; this includes boundary rates and zero-rate axes.

The operational region equals the three conditional and joint mutual-information inequalities over arbitrary finite time sharing. The canonical definition imposes neither a closure nor a time-sharing cardinality bound. The proof derives compactness and a sufficient support size of four using Carathéodory's theorem in the three information coordinates.

Achievability uses independent random codebooks and three likelihood-ratio tests. Exact rival counts handle singleton message sets. A strategy-channel lift handles finite time sharing; fixing a schedule with no larger average error returns a physical code with separate encoders and unchanged message counts. The converse applies joint Fano and conditional Fano with the other message fixed, retaining the same uniform time coordinate in all three bounds.

The Atlas model and shared APIs are pinned in `lakefile.toml`. `CapacityAtlasMAC.capacityCertificate` proves `CapacityAtlas.Channel.multipleAccessCapacityStatement` directly. The audit checks every transitive proof axiom and canonical-proposition correspondence with rigid universes. Negative controls reject a different proposition and a certificate restricted to universe zero.

Run `lake --wfail build` and `lake exe capacity_mac_audit`.

Primary theorem provenance: Rudolf Ahlswede, [Multi-way communication channels](https://www.math.uni-bielefeld.de/ahlswede/homepage/public/12.pdf), Theorem 1, printed page 33, proof pages 34–38. The original defines separate finite-alphabet encoders and joint average error on pages 24–26 and achievable nonnegative rates with rate slack on page 28. Its theorem uses the equivalent closed convex hull of successive-decoding corner families. The simultaneous-threshold and strategy-lift proof here is our formal proof route. The [author's bibliography](https://www.math.uni-bielefeld.de/ahlswede/homepage/public/) dates the proceedings publication to 1973 after the September 1971 conference.

The Atlas bibliography also retains Henry Herng-Jiunn Liao's 1972 *Multiple Access Channels*. His name, title, and September 1972 technical-report designation A72-2 are verified in the University of Hawaii's [ALOHA project final report](https://ntrs.nasa.gov/api/citations/19750023705/downloads/19750023705.pdf), printed page 11. The thesis itself was not available for theorem-level verification. Its former Atlas link pointed to an unrelated newsletter and has been removed; theorem provenance here relies on the verified Ahlswede original.

AI assistance was used for research, implementation, and review. Human review of statement faithfulness and literature attribution is required before merge.

License: Apache-2.0.
