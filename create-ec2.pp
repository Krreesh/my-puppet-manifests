ec2_instance { 'Puppet Agent':
  ensure            => running,
  region            => 'us-east-1',
  availability_zone => 'us-east-1a',
  image_id          => 'ami-0b81b12e567ed7378', 
  instance_type     => 't2.micro',
  key_name          => 'asmita23nv',
  subnet            => 'subnet-0a9ca9097bf29a711',
  security_groups   => ['ssh'],

}

ec2_securitygroup { 'ssh':
  ensure      => present,
  region      => 'us-east-1',
 # vpc         => 'Default',
  description => 'Allow ssh, 8080',
  ingress     => [{
    protocol  => 'tcp',
    port      => 22,
    cidr      => '0.0.0.0/0',
  },
  {
    protocol  => 'tcp',
    port      => 8080,
    cidr      => '0.0.0.0/0',     
  },
  {
    protocol  => 'tcp',
    port      => 80,
    cidr      => '0.0.0.0/0',     
  },
  ],
  tags        => {
    'Env'  => 'Development',
  },
}
