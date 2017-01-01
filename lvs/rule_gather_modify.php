<?php

require '../include/init.inc.php';

$rule_id = $website_id = $player_id = $player_name = $gift_type = $gift_amount = $send_time = $actor_id = $actor_name = '';
extract($_REQUEST, EXTR_IF_EXISTS);

if ($rule_id == '') {
OSAdmin::alert('error', ErrorMessage::NEED_PARAM);
}else{
  $condition = array('id' => $rule_id);
  if (Common::isGet()) {
    $rule_info = LVSRule::getRuleByCondition(LVSRule::$gather_table_name, $condition);
  } elseif (Common::isPost()) {
    if ($rule_id == ''||$website_id == ''||$player_id == ''||$player_name == ''||$gift_type == ''||$gift_amount == ''||$send_time == ''||$actor_id == ''||$actor_name == '') {
        OSAdmin::alert('error', ErrorMessage::NEED_PARAM);
    }else{
      $rule_data = array(
        "website_id" => $website_id,
        "player_id" => $player_id,
        "player_name" => $player_name,
        "gift_type" => $gift_type,
        "gift_amount" => $gift_amount,
        "send_time" => $send_time,
        "actor_id" => $actor_id,
        "actor_name" => $actor_name
      );
      $result = LVSRule::updateRule(LVSRule::$gather_table_name, $condition, $rule_data);
      if ($result >= 0) {
          SysLog::addLog(UserSession::getUserName(), 'MODIFY', 'Rule', $rule_id, json_encode($rule_data));
          Common::exitWithSuccess('更新完成', 'lvs/rule_gather.php');
      } else {
          OSAdmin::alert('error');
      }
    }
  }
}

$website_id_list = LVSWebsite::getWebsiteIdList();

Template::assign("website_id_list",$website_id_list);
Template::assign("rule_id",$rule_id);
Template::assign('rule_info', $rule_info);
Template::display('lvs/rule_gather_modify.tpl');
