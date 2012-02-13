<?php

/**
 * Class for handle Upload to Local Storage
 * 
 * 
 * @author Tuan Nguyen <nganhtuan63@gmail.com>
 * @version 1.0
 * @package common.storages
 */

class LocalStorage
{
	  
	  public $max_file_size=ConstantDefine::UPLOAD_MAX_SIZE;
	  public $min_file_size=ConstantDefine::UPLOAD_MIN_SIZE;
	  
	  public function __construct($max_file_size,$min_file_size) {
	  		$this->max_file_size=$max_file_size;
			$this->min_file_size=$min_file_size;
	  }
	  	
	  public static function UploadFile(){
	  	
	  }
	  
	  public static function getFilePath(){
	  		return null;
	  }
	   	
}
