# Boundaries and layered assessments

The CAF distinguishes the **assessment boundary** from the **authorisation boundary**
and describes how IRAP assessments can be **layered** across cloud, SaaS and consumer
agencies. Getting these distinctions right at scoping time prevents the most common
class of IRAP rework.

> Source: ASD, IRAP Common Assessment Framework v1.0, sections "Boundary definitions"
> and "Layering IRAP assessments". Last-verified: 2026-05-13.

## Assessment boundary

The CAF defines the assessment boundary as **all components of an information system
to be assessed in scope of the assessed entity's Information Security Continuous
Monitoring (ISCM) implementation, including the associated assessment objects
(specifications, mechanisms and activities)**.

The assessment boundary is typically defined by the IRAP assessor and agreed with the
assessed entity's delegate authority. It is reviewed and validated through the
engagement (IRAP-AR-0017).

A typical assessment boundary description includes:

- Systems and environments (PROD, PRE-PROD, TEST, DEV).
- Data classifications stored, processed or communicated.
- Components, people, processes, technologies and facilities that affect the security
  posture.
- The provider's corporate network where it interacts with the assessed system.
- End User Computing devices used for privileged activity (jump servers alone do not
  remove the underlying device from scope).
- Assets, components, applications, networks, data and physical facilities.
- Shared responsibility model and control inheritance from any provider.

## Authorisation boundary

The authorisation boundary is **all components of an information system to be
authorised for operation by an authorising authority**. The authorisation boundary may
exclude separately authorised systems to which the system is connected.

Key rules:

- The authorisation boundary is **not larger** than the assessment boundary.
- The authorisation boundary **may match, or be a smaller rendition of**, the
  assessment boundary.
- It may aggregate multiple assessment boundaries, but will not exceed their union.

The authorising officer (not the assessor) decides on the authorisation boundary.

## Boundary diagrams (conceptual)

```
Assessment boundary example

  +-----------------------------+
  |                             |
  |   System 1     Database     |
  |        \         /          |
  |         \       /           |
  |    IDM System  Data         |
  |         |     Warehouse     |
  |       Users                 |
  |         |                   |
  |       Mail        System 2  |
  |         |          /        |
  |        Mainframe  /         |
  |                             |
  +-----------------------------+
     Internet (outside boundary)

Authorisation boundary example

  +--------------------------+
  |   System 1   Database    |
  |     |          |         |
  |   Users    Data          |
  |            Warehouse     |
  +--------------------------+
       (subset of the assessment boundary)
```

## Layered assessments

For cloud-hosted systems the CAF describes three layers:

- **Layer 1 - Cloud infrastructure provider.** The infrastructure layer (IaaS / PaaS)
  and the provider's responsibilities in managing it.
- **Layer 2 - Software-as-a-Service (SaaS) provider.** The SaaS layer and the SaaS
  provider's responsibilities. The Layer 2 report should link to the Layer 1 report
  for inherited considerations.
- **Layer 3 - Consumer government agency.** The consumer agency's responsibilities.
  The Layer 3 report should leverage Layers 1 and 2 to give the authorising officer a
  consolidated picture.

The number of layers varies with the deployment model:

- IaaS only: typically Layer 1 (provider) and Layer 3 (consumer).
- IaaS + SaaS: Layers 1, 2 and 3.
- Government-to-government (an agency operates a service for another agency on top of
  a cloud provider): may add a further layer.

### Layered diagram (conceptual)

```
+---------- Phase 1 IRAP assessments (provider) ----------+
|                                                          |
|  Cloud provider          Layer 1 IRAP assessment         |
|  SaaS provider           Layer 2 IRAP assessment         |
|                                                          |
+----------------------------------------------------------+
                              |
                              v utilises assessed components
+---------- Phase 2 IRAP assessments (consumer) ----------+
|                                                          |
|  Consumer government agency  Layer 3 IRAP assessment     |
|  (consumer authorisation boundary)                       |
|                                                          |
+----------------------------------------------------------+
```

### Practical implications

- **Do not re-assess inherited controls.** Reference the provider's IRAP report and
  Controls Matrix for the controls they own.
- **Read the provider's Controls Matrix carefully.** Where the provider has marked a
  control as the consumer's responsibility, the consumer's assessment must cover it
  in full.
- **Cross-link the reports.** The Layer 3 IRAP report should explicitly reference the
  Layer 1 and Layer 2 reports so the authorising officer can follow the chain.
- **Confirm assessment recency for each layer.** A stale provider IRAP letter weakens
  the consumer's inheritance argument.

## Other CAF requirements that interact with boundaries

- **IRAP-AR-0017** - Regularly review, validate and maintain the boundary.
- **IRAP-AR-0018** - The report clearly defines the boundary.
- **IRAP-AR-0019** - The report covers data sovereignty, offshore equipment and staff,
  or any information (including metadata) not within Australia.
- **IRAP-AR-0020** - The assessment covers all applicable environments, software,
  workstations, network devices, servers and other devices or services within the
  boundary.
- **IRAP-AR-0021** - Out-of-scope rationale is clearly articulated in the report and
  controls matrix.
- **IRAP-AR-0031** - When multiple services are assessed, each is assessed against
  applicable controls and deviations from common controls are outlined per service.

## How an agent should use this page

- When the user is scoping a new IRAP engagement, walk the assessment-boundary
  considerations above and produce a draft boundary description.
- For cloud-hosted systems, walk the layering. Identify which provider is at Layer 1,
  whether a SaaS provider sits at Layer 2, and which controls are inherited from each.
- Cross-reference data sovereignty (IRAP-AR-0019). For example, an AWS ap-southeast-2
  workload still needs the data-sovereignty section to address support staff
  jurisdiction, metadata locations and any cross-region replication.

## Cross-references

- [`./assessment-workflow.md`](./assessment-workflow.md) Stage 2 for the boundary
  step in the CAF.
- [`./quality-standards.md`](./quality-standards.md) for the coverage IRAP-ARs.

## Sources

- ASD, IRAP Common Assessment Framework v1.0 (April 2025). Last-verified: 2026-05-13.
  <https://www.cyber.gov.au/sites/default/files/2025-04/IRAP%20common%20assessment%20framework.pdf>
- DTA, Cloud Assessment and Authorisation Framework.
  <https://www.dta.gov.au/help-and-advice/cloud/cloud-assessment-and-authorisation-framework>
