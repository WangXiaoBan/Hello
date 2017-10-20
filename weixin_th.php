<?php 
define(TOKEN,"unikee");

$weixin=new weichat();
if(isset($_GET['echostr']) && !empty($_GET['echostr']) ){
	$weixin->configure();
}else{
	$weixin->Handle();
}


class weichat{

	//开始前的接口配置方法
	public function configure(){
        $signature=$_GET["signature"];
        $timestamp=$_GET["timestamp"];
        $nonce=$_GET["nonce"];
        
		$tmpArr = array(TOKEN,$timestamp, $nonce);
		sort($tmpArr, SORT_STRING);
		$tmpStr = implode( $tmpArr );
		$tmpStr = sha1( $tmpStr );

		if( $signature==$tmpStr ){
			echo $_GET['echostr'];
		}


	}

	public function Handle(){
		//接收post过来的xml格式数据
		$postxml=$GLOBALS['HTTP_RAW_POST_DATA'];
		//将xml转成数组格式
		$postObj=simplexml_load_string($postxml,"SimpleXMLElement",LIBXML_NOCDATA);
		//接收消息
		switch ($postObj->MsgType) {
			case 'text':
				$result=$this->testingText($postObj);
				break;
			case 'image':
				//$result=$this->replyText($postObj);
				break;
			case 'voice':
				//$result=$this->replyText($postObj);
				break;
			case 'video':
				//$result=$this->replyText($postObj);
				break;
			case 'shortvideo':
				//$result=$this->replyText($postObj);
				break;
			case 'location':
				//$result=$this->replyText($postObj);
				break;
			case 'link':
				//$result=$this->replyText($postObj);
				break;
			default:
				$result=$this->undefindType($postObj);
				break;
		}

		echo $result;
/*		if($postObj->Content=="你好"){
			echo $this->replyText($postObj);
		}*/


	}
	//回复文本消息的方法
	public function testingText($postObj){
		$keyword=trim($postObj->Content);
		if(strstr($keyword,"你好")){
			$backContent="我是回复的消息";
			$result=$this->replyText($postObj,$backContent);
		}
		return $result;

	}
		//回复文本格式数据的方法
		public function replyText($postObj,$backContent){
		//回复文本消息的格式
		$xml="<xml>
			<ToUserName><![CDATA[%s]]></ToUserName>
			<FromUserName><![CDATA[%s]]></FromUserName>
			<CreateTime>%s</CreateTime>
			<MsgType><![CDATA[text]]></MsgType>
			<Content><![CDATA[%s]]></Content>
			</xml>";
			$result=sprintf($xml,$postObj->FromUserName,$postObj->ToUserName,time(),$backContent);
		return $result;
		}


//类型不正确时出发的方法
	public function undefindType($postObj){
		$xml="<xml>
		<ToUserName>".$postObj->FromUserName."</ToUserName>
		<FromUserName>".$postObj->ToUserName."</FromUserName>
		<CreateTime>".time()."</CreateTime>
		<MsgType><![CDATA[text]]></MsgType>
		<Content><![CDATA[发送消息类型不正确,请重新尝试!]]></Content>
		</xml>";
		return $xml;
	}

}

		


 ?>