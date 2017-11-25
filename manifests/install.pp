class nginx::install (
$package_name    = $::nginx::package_name,
$ensure          = $::nginx::ensure, 
) {
package { 'nginx_install' :
 ensure     =>  present,
 name       =>  $package_name,
  }
}
