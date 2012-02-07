<?php

return CMap::mergeArray(
	require(COMMON_FOLDER.'/config-test.php'),
	array(
                'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',                
				'components'=>array(
					
		),
	)
);
