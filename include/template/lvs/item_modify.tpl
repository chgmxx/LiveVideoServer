<{include file ="header.tpl"}>
<{include file ="navibar.tpl"}>
<{include file ="sidebar.tpl"}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>
<div class="well">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home" data-toggle="tab">请修改道具信息</a></li>
    </ul>

	<div id="myTabContent" class="tab-content">
		  <div class="tab-pane active in" id="home">
        <form id="tab" method="post" action="" autocomplete="off">
          <input type="hidden" name="item_id" value="<{$item_info.item_id}>">
  				<label>网站名</label>
  				<input type="text" name="item_name" value="<{$item_info.item_name}>" class="input-xlarge" required="true">
  				<label>网站简称</label>
  				<input type="text" name="item_directive" value="<{$item_info.item_directive}>" class="input-xlarge" required="true">
    			<div class="btn-toolbar">
    				<button type="submit" class="btn btn-primary"><strong>提交</strong></button>
    				<div class="btn-group"></div>
    			</div>
  			</form>
      </div>
    </div>
</div>
<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="footer.tpl" }>
