<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'database_user' );
define( 'DB_PASSWORD', 'database_user_password' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('AUTH_KEY',         'PuN;GaOK}>:uC;4N?-p?8k`>;=2^`3Ij)I6pK:@S9^|J[IPiqFOHA3!~.NkX4btw');
define('SECURE_AUTH_KEY',  '$/f}QOx;=V/!J[oqdFQJ$U@C{X+0-[i$]GST[4|g(zwuopTP5DF1`PtLX=e,*O4T');
define('LOGGED_IN_KEY',    '.5*gzEZEU,7EW5tG7cnFq@NV,*Mn2ShXGO` 9|1,c KzlLD)B!+M4)9fa*5,L,Rv');
define('NONCE_KEY',        'Xz_Fc3%k0,;*Y=5wC;Rtxw>_J95CbgfSX|B}r_>L&(b#~|z*zdFo9c}cU9g>a[j ');
define('AUTH_SALT',        '8f?Q{E/@x5<S]q^G0%M3K+fkEpo/8-Up:wE{I:/_%P4Jp#}R{0-P^9CoYo-jW2M%');
define('SECURE_AUTH_SALT', 'Z%++c|En~Lb1CDDE/hIH<M:)(v~(aU5w}]r0a5JGAD#tu30J>3D=WJW4Z_Slts7M');
define('LOGGED_IN_SALT',   'O6;{[@9 yXEab*t9k/qpRJn{m6==g-kin%M8VL@d^p.I| ~pF]t{)-D#(*:-BB/-');
define('NONCE_SALT',       'f[g*[HaK n/iC&eF9+8c*qw7$EDXYLNCnHA7CIE$C|X+0~2e1 :>(7)?b@O7vE(*');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
