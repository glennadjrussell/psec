# packages.rb
# Support module for cpe module

module Facter::Packages
  class Package
    def initialize(name,version,archtiecture,description)
      @name = name
      @version = version
      @architecture = architecture
      @description = description
    end
  end

  def self.packages
    # Facter::Core::Execution.exec
    # if line beings with ii
  end


#  ||/ Name                  Version         Architecture    Description
#+++-=====================-===============-===============-================================================
#ii  acpi                  1.6-1           amd64           displays information on ACPI devices
#ii  acpi-support-base     0.140-5+deb7u3  all             scripts for handling base ACPI events such as th
#ii  acpid                 1:2.0.16-1+deb7 amd64           Advanced Configuration and Power Interface event
#ii  adduser               3.113+nmu3      all             add and remove users and groups
#ii  apache2               2.2.22-13+deb7u amd64           Apache HTTP Server metapackage
#ii  apache2-mpm-worker    2.2.22-13+deb7u amd64           Apache HTTP Server - high speed threaded model
#ii  apache2-utils         2.2.22-13+deb7u amd64           utility programs for webservers
#ii  apache2.2-bin         2.2.22-13+deb7u amd64           Apache HTTP Server common binary files
#ii  apache2.2-common      2.2.22-13+deb7u amd64           Apache HTTP Server common files
#ii  apt                   0.9.7.9+deb7u7  amd64           commandline package manager

  def self.debian_packages()
    cmd = "dpkg-query"
    cmd += " -l"
    package_output = Facter::Core::Execution.exec(cmd)
    lines = package_output.split('\n')
    lines.each do |line|
      # Does it start with ii?
      if ( line =~ /^ii/ )
        line.strip!
        tokens = line.split(/\s+/)
      end
    end
  end
end
