+++
title = 'Network automation'
+++
# Network automation
## Fibbing: centralised control over distributed routing
Fibbing combines benefits of distributed protocols (scalable by design & robust) with those of a centralized controller (manageable, flexible).

You get centralised control over distributed routing by lying to th routing protocols:
- get requirements from network operator (routing, load balancing, failover)
  - provides high-level language:
    ```
    ((E, C, D1) and (E, G, D1);             // traffic between E and D1 load balanced on two paths
     ((A, *, B, * D2) or (A, *, C, *, D2)); // traffic between A and D2 should cross B or C
     (F, G, *, D3) as backupof ((F, H));)   // traffic between F and D3 should be reroutd via G if link (F,H) fails
    ```

- compute expected paths centrally
- fibbing controller sends fake control messages to routers
- distributed protocols generate the expected paths with augmented network based on fake messages

Any set of forwarding directed acyclic graphs can be enforced by fibbing.

## Synthesizing network configurations: Propane
- Language for expressing network-wide objectives:
  - regular expressions with extensions
- Compiler for purely distributed implementation
  - generate BGP configs for each router
  - compiler guarantees policy compliance
  - use graph-based intermediate representation

Goal: compile network-wide routing objectives into low-level configurations of devices running distributed protocols.

Example:

```
define Ownership =
{PG1 => end(A)          // path of traffic with prefix PG1 must end at A
 PG2 => end(B)          // path of traffic with prefix PG2 must end at B
 true => end(out)}      // traffic with any other prefixes can leave the datacenter

define Locality = {PL1 | PL2 => only(in)}       // traffic with prefixes PL* is only allowed in datacenter
```

When compiling, BGP control graph safety analysis is done with the topology.

## Autocompleting partial network configurations: Net Complete
Problems with existing synthesizers:
- do not provide operators with fine-grained control over synthesized configurations
- can produce configurations very different from human-generated, lowering confidence of using it
- can produce very different configurations given slightly different requirements
- cannot flexibly adapt to operational requirements

NetComplete allows operators to flexibly express intents through configuration sketches with "holes"
- holes can identify specific attributes (IP addresses, link costs, BGP local preferences) or entire pieces of configuration
- reduce autocompletion to constraint satisfaction problem:
  - encode protocol semantics + high-level reqs + partial configuraions as logical formula in SMT
  - use a solver to find an assignment to configuration variables
