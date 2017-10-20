<?php
	define(TOKEN,"wangxilong");
	$weixin=new wechat();
	if( isset($_GET['echostr']) && !empty($_GET['echostr']) ){
		$weixin->configure();
	}else{
		$weixin->handle();
	}


	class wechat{
		//接口文件配置
		public function configure(){
			$signature=$_GET["signature"];
			$timestamp=$_GET["timestamp"];
			$nonce=$_GET["nonce"];
			        
			$tmpArr = array(TOKEN ,$timestamp, $nonce );
			sort($tmpArr, SORT_STRING);
			$tmpStr = implode( $tmpArr );
			$tmpStr = sha1( $tmpStr );

			if( $signature==$tmpStr ){
				echo $_GET['echostr'];
			}
		}


		public function handle(){
			//接受post传递的xml数据
			$postxml=$GLOBALS['HTTP_RAW_POST_DATA'];
			//xml数据转化成数组			
			$postobj=simplexml_load_string($postxml,"SimpleXMLElement",LIBXML_NOCDATA);
			switch ($postobj->MsgType) {
				case 'text':
					$result=$this->checkText($postobj);
					break;
// 				case 'image':
// 					$result=$this->replyImage($postobj);
// 					break;
// 				case 'voice':
// 					$result=$this->replyVoice($postobj);
// 					break;
// 				case 'video':
// 					$result=$this->replyVideo($postobj);
// 					break;
// 				case 'music':
// 					$result=$this->replyMusic($postobj);
// 					break;
// 				case 'news':
// 					$result=$this->replyNews($postobj);
// 					break;
				default:
					$result=$this->replyFindNoneType($postobj);
					break;
			}
			echo $result;
		}


		//检验处理文本消息函数
		public function checkText($postobj){
			//去空格，后面还可以有多个参数
			$word=trim($postobj->Content);
			//回复条件
			if(strstr($word,"你好")){
				$backWord="你也好";
				$result=$this->replyText($backWord,$postobj);
			}

			return $result;
		}


		//恢复文本消息函数
		public function replyText($backWord,$postobj){
			$xml="<xml>
					<ToUserName><![CDATA[%s]]></ToUserName>
					<FromUserName><![CDATA[%s]]></FromUserName>
					<CreateTime>%s</CreateTime>
					<MsgType><![CDATA[text]]></MsgType>
					<Content><![CDATA[%s]]></Content>
					</xml>";
			$result=sprintf($xml,$postobj->FromUserName,$postobj->ToUserName,time(),$backWord);
			return $result;
		}
		
		
		//发送类型不正确时的处理函数
		public function replyFindNoneType($postobj){
			$xml="<xml>
				<ToUserName>".$postobj->FromUserName."</ToUserName>
				<FromUserName>".$postobj->ToUserName."</FromUserName>
				<CreateTime>".time()."</CreateTime>
				<MsgType><![CDATA[text]]></MsgType>
				<Content><![CDATA[发送的类型不正确]]></Content>
				</xml>";
			return $xml;
		}
	}
?>