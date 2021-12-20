+++
title = 'Network automation'
+++

## Network automation
### Centralized control over distributed routing: fibbing
Fibbing: lying to routing protocols
- high-level language to specify forwarding requirements
    ```
    ((E, C, D1) and (E, G, D1);             // traffic between E and D1 load balanced on two paths
     ((A, *, B, * D2) or (A, *, C, *, D2)); // traffic between A and D2 should cross B or C
     (F, G, *, D3) as backupof ((F, H));)   // traffic between F and D3 should be reroutd via G if link (F,H) fails
    ```
- fibbing controller computes paths and creates fake topology by sending link-state messages

### Synthesizing network configurations - Propane
Compile network-wide routing objectives into low-level configurations.

Main goals of Propane:
- language for expressing network-wide objectives (intra- and inter-domain routing)
- compiler for purely distribute implementation
  - generate BGP configs for each router
  - compiler guarantees policy compliance for all failures

### Autocompleting partial network configurations
Problems:
- produced configs may widely differ from human-generating ones, lowering confidence in them
- can produce widely different configurations given slightly different requirements
- can't flexibly adapt to operational requirements

Existing synthesizers don't provide operators with fine-grained control over synthesized configurations.

NetComplete: network operators can specify their intents through configuration sketches with "holes"
- holes can identify specific attributes (e.g. IP addresses), link costs, BGP local preferences, or entire pieces of configuration
- encodes requirements as logical formula in SMT
- use solver (Z3) to find assignment that satisfies constraints
