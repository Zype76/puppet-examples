class puppet_example { 
  #Lay down a file 
  file { '/tmp/pz':
    ensure  => present,
    source  =>  'puppet:///modules/puppet_example/test.txt',
  }

  #Lay down a script, be sure to add execute perms!
  file { '/tmp/script.sh':
    ensure  => present,
    mode    => '0750',
    source  =>  'puppet:///modules/puppet_example/script.sh',
  }

  #Execute the script that was added 
  exec { 'Example script exec':
    command => '/tmp/script.sh',
    onlyif  => '/usr/bin/test ! -f /tmp/anotherfile.txt',
  }

  #Example template
  file { '/tmp/erbtemplateresults.txt':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('puppet_example/erbtemplate.erb'),
  }

}
