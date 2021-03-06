<{include file="header.tpl" }>
<{include file="navibar.tpl" }>
<{include file="sidebar.tpl" }>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>

<div class="btn-toolbar" style="margin-bottom:2px;">
    <a href="acquisition_add.php" class="btn btn-primary"><i class="icon-plus"></i> 规则</a>
    <a data-toggle="collapse" data-target="#search"  href="#" title="检索"><button class="btn btn-primary" style="margin-left:5px"><i class="icon-search"></i></button></a>
</div>

<{if $_GET.search }>
<div id="search" class="collapse in">
<{else }>
<div id="search" class="collapse out" >
<{/if }>
<form class="form_search"  action="" method="GET" style="margin-bottom:0px">
  <input type="hidden" name="search" value="1" >
	<div style="float:left;margin-right:5px">
		<label>平台</label>
    <select id="website_id" name="website_id" class="input-xlarge">
      <option value="">全部</option>
      <{html_options options=$website_id_list selected=$_GET.website_id}>
    </select>
	</div>
	<div class="btn-toolbar" style="padding-top:25px;padding-bottom:0px;margin-bottom:0px">
		<button type="submit" class="btn btn-primary">检索</button>
	</div>
	<div style="clear:both;"></div>
</form>
</div>

<div class="block">
    <a href="#page-stats" class="block-heading" data-toggle="collapse">数据采集规则列表</a>
    <div id="page-stats" class="block-body collapse in">
    <table class="table table-striped">
    <thead>
      <tr>
        <th>视频网站</th>
        <th>玩家ID查询字段</th>
        <th>玩家昵称查询字段</th>
        <th>主播ID查询字段</th>
        <th>主播昵称查询字段</th>
        <th>礼物类型查询字段</th>
        <th>礼物数量查询字段</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
      <{foreach name=rule_gather from=$rule_list item=rule_info}>
      <tr>
        <td><{$website_id_list[$rule_info.website_id]}></td>
        <td><{$rule_info.user_id_field}></td>
        <td><{$rule_info.user_name_field}></td>
        <td><{$rule_info.actor_id_field}></td>
        <td><{$rule_info.actor_name_field}></td>
        <td><{$rule_info.gift_type_field}></td>
        <td><{$rule_info.gift_amount_field}></td>
        <td>
          <a href="acquisition_modify.php?rule_id=<{$rule_info.id}>" title= "修改" ><i class="icon-pencil"></i></a>
          <a data-toggle="modal" href="#myModal" title= "删除" ><i class="icon-remove" href="acquisition_delete.php?rule_id=<{$rule_info.id}>"></i></a>
        </td>
      </tr>
      <{/foreach}>
    </tbody>
  </table>
  <!--- START 分页模板 --->
         <{$page_html}>
   <!--- END --->
    </div>
</div>



<!-- 操作的确认层，相当于javascript:confirm函数 -->
<{$osadmin_action_confirm}>

<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="footer.tpl" }>
