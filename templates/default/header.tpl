<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<title>Simple Invoices</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link REL="SHORTCUT ICON" HREF="./images/common/favicon.ico">
	<!-- extJs2 Files 
	<link rel="stylesheet" type="text/css" href="./include/ext2/resources/css/ext-all.css" />
 	<script type="text/javascript" src="./include/ext2/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="./include/ext2/ext-all.js"></script>
	<link rel="stylesheet" type="text/css" href="./include/ext2/grid/grid-examples.css" />
	-->
	
	<link rel="stylesheet" type="text/css" href="./include/css/simpleInvoicesStyle.css" />



{if $config_inc_style == "true"}

{literal}
	<link rel="stylesheet" type="text/css" href="./templates/default/css/screen.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="./templates/default/css/print.css" media="print"/>
{/literal}
{/if}

{if $config_inc_old_js == "true"}
	
	<script type="text/javascript">
	    var GB_ROOT_DIR = "./modules/include/js/";
	</script>
	<link rel="stylesheet" type="text/css" href="./templates/default/css/menu_header.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="./templates/default/css/screen.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="./templates/default/css/print.css" media="print"/>
	<script type="text/javascript" src="./include/tiny_mce/tiny_mce_src.js"></script>
	<script type="text/javascript" src="./include/tiny-mce.conf.js"></script>
	
		<!-- jQuery Files -->
	<script type="text/javascript" src="./include/jquery/jquery-1.2.6.min.js"></script>
	<script type="text/javascript" src="./include/jquery/jquery.flexigrid.1.0b3.pack.js"></script>
	{$extension_jquery_files }
	<script type="text/javascript" src="./include/jquery/jquery.plugins.js"></script>
	<script type="text/javascript" src="./include/jquery/jquery.conf.js"></script>
	<link rel="stylesheet" type="text/css" href="./templates/default/css/flexigrid.css">
	<link rel="stylesheet" type="text/css" href="./include/jquery/jquery.plugins.css" title="default" media="screen" />
{literal}
	<!-- Menu header -->
	<!--[if lte IE 6]>
		<link rel="stylesheet" type="text/css" href="./templates/default/css/menu_header_hackIE.css" media="screen" />
		<script type="text/javascript" src="./templates/default/js/ADxMenu.js"></script>
	<![endif]-->
	
	
	<!-- Additional IE/Win specific style sheet (Conditional Comments) -->
	<!--[if IE 7]>
			<link rel="stylesheet" type="text/css" href="./templates/default/css/menu_header_hackIE.css" media="screen" />
	<link rel="stylesheet" href="./templates/default/css/tabs-ie.css" type="text/css" media="projection, screen" />
	<![endif]-->

	<!-- Additional IE/Win specific style sheet (Conditional Comments) -->
	<!--[if lte IE 7]>
	<style type="text/css" media="screen, projection">
	    body {
		font-size: 100%; /* resizable fonts */
	    }
	</style>
	<![endif]-->
	
	<!-- customer-details -->
	<link rel="stylesheet" href="./templates/default/css/tabs.css" type="text/css" media="print, projection, screen" />
	<script type="text/javascript" src="./library/ajs/AJS.js"></script>
	<script type="text/javascript" src="./library/ajs/AJS_fx.js"></script>
	<script type="text/javascript" src="./library/ajs/gb_scripts.js"></script>
	<link href="./templates/default/css/gb_styles.css" rel="stylesheet" type="text/css" />
	
	<!--[if gte IE 5.5]>
		<script language="JavaScript" src="./modules/include/js/dhtml.js" type="text/JavaScript"></script>
		<link rel="stylesheet" href="./templates/default/css/iehacks.css" type="text/css" />
	<![endif]-->
	

{/literal}

{/if}
</head>
<body>
<div class="si_grey_background"></div>

