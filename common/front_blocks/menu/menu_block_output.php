<?php if (isset($menus)):?>
      <div class="menu">
      	<ul>
        	<?php foreach ($menus as $menu) :?>	
          		<li><a href="<?php echo $menu['link'];?>" <?php echo isset($_GET['slug'])&&$_GET['slug']==$menu['link']?'class="active"':'';?>><span><?php echo $menu['name'];?></span></a></li>
          	<?php endforeach;?>
        </ul>
      </div>
      <div class="clr"></div>
<?php endif;?>
