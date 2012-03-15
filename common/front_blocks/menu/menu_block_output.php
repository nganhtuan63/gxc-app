<?php if (isset($menus)):?>
	<?php if($this->beginCache('menu-render-'.$this->menu_id, array('duration'=>7200))) { ?>
      <div id="navigation" class="jqueryslidemenu">
            <ul class="menu_level_1">      	
	        	<?php foreach ($menus as $menu) :?>	
	          		<li><a href="<?php echo $menu['link'];?>" <?php echo isset($_GET['slug'])&&$_GET['slug']==$menu['link']?'class="active"':'';?>><?php echo $menu['name'];?></a>
	          		<?php 
	          			$second_level_menus=MenuBlock::getMenuItems($menu['id'],$this->menu_id);
						if(count($second_level_menus)>0) : ?>
						<ul class="menu_level_2">
							<?php foreach ($second_level_menus as $second_menu) : ?>
									<li><a href="<?php echo $second_menu['link'];?>"><?php echo $second_menu['name'];?></a>										
										<?php 
					          			$third_level_menus=MenuBlock::getMenuItems($second_menu['id'],$this->menu_id);
										if(count($third_level_menus)>0) : ?>
										<ul class="menu_level_3">
											<?php foreach ($third_level_menus as $third_menu) : ?>
												<li><a href="<?php echo $third_menu['link'];?>"><?php echo $third_menu['name'];?></a></li>
											<?php endforeach; ?>
										</ul>
										<?php endif; ?>
									</li>
							<?php endforeach; ?>
						</ul>
						<?php endif; ?>	
					</li>
	          	<?php endforeach;?>
	        </ul>
      <br style="clear: left">
      </div>      
   <?php $this->endCache(); } ?>
<?php endif;?>
