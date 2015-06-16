# Fact: cpe
#
# Purpose:
#   Return a CPE identifier for the node, and an array of CPE identifying installed packages. This is an optional set of facts,
#   but is required for psec to work.
#
require 'facter'
require 'facter/util/packages'

#
# OS
#
# cpe:/o:microsoft:windows_vista:6.0:sp1
#
Facter.add(:cpe) do
  setcode do
    os = Facter.value(:os)
    name = os["name"]
    release = os["release"]
  end
end

# Packages
# WFN - Well formed name
# wfn:[part="a",vendor="microsoft",product="internet_explorer",version="8\.0"]
