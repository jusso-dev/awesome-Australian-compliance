# Guidelines for Networking

This guideline covers the architecture, configuration and operation of network
infrastructure including wireless, IPv6 and the choice of protocols.

## In plain English

Design the network to minimise lateral movement. Encrypt traffic where it must traverse
untrusted paths. Disable old protocols. Be deliberate about wireless and IPv6.

## Key topics

- Network segmentation and zoning.
- Wireless network configuration (WPA3 or, where compatibility forces it, WPA2-Enterprise
  with strong authentication).
- IPv6 considerations (the protocol is supported by default in modern operating systems,
  and disabling it has its own pitfalls).
- Disabling legacy protocols (SMBv1, LLMNR, NetBIOS over TCP, mDNS where not needed,
  Telnet, FTP).
- VPN configuration.
- Time synchronisation (NTP).
- Service redundancy.

## Where to look

- Network IaC (Terraform for VPCs / VNets, switch / firewall config-as-code).
- Wireless controller configuration.
- Group Policy / Intune disabling legacy protocols on Windows.
- VPN appliance or VPN-as-a-service configuration.
- DNS infrastructure configuration.

## Common evidence

- Network diagram showing zone boundaries and traffic flows.
- Wireless authentication policy (typically 802.1X with certificates).
- Legacy-protocol disable policy applied across the estate.
- IPv6 posture document (enabled and managed, or deliberately disabled with rationale).
- NTP source and skew monitoring.

## Common pitfalls

- Flat network with no segmentation.
- WPA2-Personal (pre-shared key) on internal wireless networks.
- IPv6 left at default enabled with no firewall rules covering it (firewalls often only
  filter IPv4).
- SMBv1 not disabled on legacy file servers.
- Split-tunnel VPN bypassing the egress controls.

## Cross-references

- Guidelines for Gateways.
- Guidelines for Cryptography.
- Guidelines for System Monitoring.

## Sources

- ACSC, ISM Guidelines for Networking.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-networking>
