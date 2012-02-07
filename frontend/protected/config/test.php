<?php

return CMap::mergeArray(
	require(dirname(__FILE__).'/main.php'),
	array(
                'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',                
				'components'=>array(
					
		),
	)
);
