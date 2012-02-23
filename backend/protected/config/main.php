<?php

return CMap::mergeArray(
	 require(COMMON_FOLDER.'/config.php'),
	 array(
                'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
                'name' => 'BACKEND ZONE',
                'defaultController'=>'besite',                               
				'components'=>array(                                                
                        
                        //Error Action when having Errors
                        'errorHandler'=>array(
                                // use 'site/error' action to display errors
                                'errorAction'=>'besite/error',
                        ),                        						
						
                        //User Componenets                    
                        'user'=>array(
                                'class'=>'cms.components.user.GxcUser',
                                // enable cookie-based authentication
                                'allowAutoLogin'=>true,
                                'loginUrl'=>BACKEND_SITE_URL.'/besite/login',                        
                                'stateKeyPrefix'=>'gxc_system_user_backend',
                        ),		
                        
						// URL Format and Rewrite			
						'urlManager'=>array(
							'urlFormat'=>'path',
			                'showScriptName' =>false,
							'rules'=>array(       					                        							
			                  	'<controller:\w+>/<id:\d+>'=>'<controller>/index',
			                    '<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
			                    '<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
							),
						),
			            	
				),
				'modules'=>array(
					// uncomment the following to enable the Gii tool
					
					'gii'=>array(
						'class'=>'system.gii.GiiModule',
						'password'=>'123456',
					 	// If removed, Gii defaults to localhost only. Edit carefully to taste.
						'ipFilters'=>array('127.0.0.1','::1'),
						'generatorPaths'=>array('cms.gii',),
					),				          		   
			    ),
	)
);
