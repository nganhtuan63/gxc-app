<?php

return CMap::mergeArray(
	require(dirname(__FILE__).'/main.php'),
	array(
                'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',                
				'components'=>array(
					//Log the Site Error, Warning and Store into File
					'log'=>array(
						'class'=>'CLogRouter',
						'routes'=>array(
							array(
								'class'=>'CFileLogRoute',
								'levels'=>'error, warning',
							),
							// uncomment the following to show log messages on web pages
							
							array(
								'class'=>'CWebLogRoute',
							),
							 
							
						),
					),
				),
	)
);
