class nginx::config(
 $config_ensure          = $::nginx::config_ensure,
 $config_name            = $::nginx::config_name,
 $config_mode            = $::nginx::config_mode,
 $config_owner           = $::nginx::config_owner,
 $config_group           = $::nginx::config_group,
 $config_confd           = $::nginx::config_conf,
 $config_log_dir         = $::nginx::config_log_dir,
 $config_pid_file        = $::nginx::config_pid_file,  
 $config_vdir_enable     = $::nginx::config_vdir_enable,
 $config_process_user    = $::nginx::config_process_user,
 $docroot                = $::nginx::docroot,
)

{ 
file {'nginx_config_file' : 
  ensure    => $config_ensure,
  path      => "${config_dir}/nginx.conf",
  name      => $config_name,
  mode      => $config_mode,
  owner     => $config_owner,
  group     => $config_group,
  content   => template("${module_name}/conf.d/nginx.conf.erb"),
    }
 file { $config_log_dir:
    ensure   =>   directory,
    recurse  =>   true,
 }
  file  {$docroot : 
  ensure   => directory,
  recurse  => true,
  mode     => $mode,
  owner    => $config_owner,
  group    => $config_group,
 }
  }
