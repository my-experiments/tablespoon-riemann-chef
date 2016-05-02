name             'riemann'
maintainer       "riemann"
maintainer_email "k.hakimzadeh@gmail.com"
license          "Apache v2.0"
description      'Installs/Configures/Runs riemann'
version          "0.1"

recipe            "riemann::install", "Experiment setup for riemann"
recipe            "riemann::dash",  "Dash setup"


depends "kagent"
depends "runit"
depends "java"
depends "ark"


%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end



attribute "riemann/group",
:description => "group parameter value",
:type => "string"

attribute "riemann/user",
:description => "user parameter value",
:type => "string"


