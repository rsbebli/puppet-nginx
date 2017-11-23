class nginx::pareams  {

$ensure        = 'present'
$package_name  ='nginx'
$config_dir    = '/etc/nginx'
$config_ensure = 'file'
$config_mode   = '0664'
$config_owner  = 'root'
$config_group  = 'root'
$config_confd  = "${config_dir}/conf.d" 

$config_vdir_enable  = facts['os']['family'] ? {
'Debian'  =>  $config_dir,
 default  => undef,
}

$config_process_user  = facts['os']['family'] ? {
'Debian'  => 'www-date',
default   =>  'nginx',
}
$vhost_dir =  facts['os']['family'] ? {
'Debian'   =>  "${config_dir}/sites_enabled",
 defualt   =>   $config_confd,
}

$service_name        = 'nginx'
$service_ensure      = 'running'
$service_pattern     = 'nginx'
$service_enable      =  true
$service_hasstatus   =  true
$service_hasrestart  =  true
$dicroot             = '/usr/share/nginx'
}
