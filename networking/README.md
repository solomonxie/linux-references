# Progressive Networking Lessons

A step-by-step series learning Linux networking — iproute2, netfilter,
network namespaces, and the tunneling/VPN tooling a network engineer
reaches for day to day. CLI-only steps are shell scripts; a step about a
config format (WireGuard, IPsec) is that real format, with the
explanation as comments inside it.

Steps:

| Step | Topic |
|---|---|
| 01. ip basics | `ip addr`, `ip link` |
| 02. ip routing | `ip route` |
| 03. network namespaces | `ip netns` |
| 04. iptables basics | `iptables` rules and chains |
| 05. nftables basics | `nftables`, the iptables successor |
| 06. bridges veth | advanced: veth pairs + a bridge, container-style networking |
| 07. gre tunnel | GRE — encapsulating IP traffic inside IP |
| 08. vxlan | VXLAN — tunneling a Layer 2 segment inside UDP |
| 09. wireguard | a real WireGuard config, a minimal modern VPN |
| 10. ipsec | a real strongSwan/IPsec config, the traditional site-to-site VPN |
| 11. ssh tunneling | local/remote/dynamic port forwarding, a SOCKS proxy |
