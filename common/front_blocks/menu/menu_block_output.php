<?php if (isset($menus)):?>
      <div id="navigation" class="jqueryslidemenu">
            <ul class="menu_level_1">      	
	        	<?php foreach ($menus as $menu) :?>	
	          		<li><a href="<?php echo $menu['link'];?>" <?php echo isset($_GET['slug'])&&$_GET['slug']==$menu['link']?'class="active"':'';?>><?php echo $menu['name'];?></a>
	          		<?php 
	          			$second_level_menus=MenuBlock::getMenuItems($menu['id'],$this->menu_id);
						if(count($second_level_menus)>0) : ?>
						<ul class="menu_level_2">
							<?php foreach ($second_level_menus as $second_menu) : ?>
									<li><a href="<?php echo $second_menu['link'];?>"><?php echo $second_menu['name'];?></a></li>
							<?php endforeach; ?>
						</ul>
						<?php endif; ?>	
					</li>
	          	<?php endforeach;?>
	        </ul>
      <br style="clear: left">
      </div>      
<?php endif;?>
