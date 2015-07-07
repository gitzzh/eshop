<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>后台</title>
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<jsp:include page="/common/admin-main.jsp" />
		<script>
			seajs.use("seajs/amain");
		</script>
	</head> 

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<jsp:include page="/common/admin-navbar.jsp" />
		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<!-- #section:basics/sidebar -->
			<jsp:include page="/common/admin-sidebar.jsp" />
			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<div class="page-header">
							<h1>
								Dashboard
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									overview &amp; stats
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
							
						<table class="table table-striped table-bordered">
		<tbody><tr>
			<th>订单编号</th>
			<th>产品</th>
			<th>印刷文件</th>
			<th>印刷要求</th>
			<th>收货地址</th>
			<th>印刷费用</th>
			<th>运费</th>
			<th>订单状态</th>
			<th>平台用户</th>
			<th>供应商</th>
			<th>下单时间</th>
			<th>操作</th>
		</tr>
		
			<tr>
				<td>
					<a href="../orderwork/orderworkdetail?orderWorkId=9571">109571</a>
				</td>
				<td>画册</td>
				<td>
					
						<a target="_blank" href="http://static.handyprint.cn/works/1701/1701.pdf" title="">1701.pdf</a>
					
				</td>
				<td>
					<div class="has-extends">
						<i class="fa fa-comment-o"></i>
						<a>详细信息</a>
						<div class="extends-info">
							<h4>印刷要求</h4>
							<p>产品：画册，成品尺寸：210*140mm，封面材料名称：双铜纸，封面材料克重：250克，内页材料名称：双铜纸，内页材料克重：250克，内页P数：20，印刷数量：1，装订方式：对裱胶装，后道工序：封面封底覆亮膜</p>
							
								<h4>备注</h4>
								<p>无</p>
							
						</div>
					</div>
				</td>
				<td>徐汇区,汇印</td>
				<td>5.3 元</td>
				<td>5.0 元</td>
				<td id="td_status_9571">审核失败</td>
				<td>
                    51yin
				</td>
				<td></td>
				<td>2015-07-07 00:01</td>
				<td style="white-space:nowrap">
                    <a href="orderworkdetail?orderWorkId=9571">查看</a>  
                    
                    
                    
                    
                    
                </td>
			</tr>
		
			<tr>
				<td>
					<a href="../orderwork/orderworkdetail?orderWorkId=9579">109579</a>
				</td>
				<td>画册</td>
				<td>
					
						<a target="_blank" href="http://www.baidu.com" title="">1.zip</a>
					
				</td>
				<td>
					<div class="has-extends">
						<i class="fa fa-comment-o"></i>
						<a>详细信息</a>
						<div class="extends-info">
							<h4>印刷要求</h4>
							<p>产品：画册，成品尺寸：210*210mm，封面材料名称：双铜纸，封面材料克重：250克，内页材料名称：双铜纸，内页材料克重：250克，内页P数：20，印刷数量：100，装订方式：对裱胶装，后道工序：封面封底覆亮膜、内页覆亮膜</p>
							
								<h4>备注</h4>
								<p>22222222222222222222222222222222222</p>
							
						</div>
					</div>
				</td>
				<td>111111</td>
				<td>3000.0 元</td>
				<td>18.0 元</td>
				<td id="td_status_9579">审核中</td>
				<td>
                    51yin
				</td>
				<td></td>
				<td>2015-07-03 14:37</td>
				<td style="white-space:nowrap">
                    <a href="orderworkdetail?orderWorkId=9579">查看</a>  
                    
                       &nbsp;<a data-id="9579" data-no="109579" class="orderWork_check" data-toggle="modal" data-target="#orderWorkPJH">审核</a> 
                    
                    
                    
                    
                    
                </td>
			</tr>
		
			<tr>
				<td>
					<a href="../orderwork/orderworkdetail?orderWorkId=9577">109577</a>
				</td>
				<td>冲印照片</td>
				<td>
					
						<a target="_blank" href="http://huiyintianxia.qiniudn.com/upload/productionorder/4028816949d0141d0149d05e0936000b.png?e=1435907721&amp;token=nb7IMD_O2ykrVGnANsM7M-AQsR7tLwpfPYRU2ZyW:XHCqwmnBqlgtwjLiP2hLth0LJA0=" title="">绽放个---~~~~~||--111.aaaa.png</a>
					
				</td>
				<td>
					<div class="has-extends">
						<i class="fa fa-comment-o"></i>
						<a>详细信息</a>
						<div class="extends-info">
							<h4>印刷要求</h4>
							<p>产品：冲印照片，成品尺寸：8.3x12.7cm，材料：柯达皇家光面，冲印款数：1，冲印数量：1</p>
							
								<h4>备注</h4>
								<p>asdasdasdasd</p>
							
						</div>
					</div>
				</td>
				<td>阿瑟大苏打</td>
				<td>0.29 元</td>
				<td>5.0 元</td>
				<td id="td_status_9577">待支付</td>
				<td>
                    51yin
				</td>
				<td></td>
				<td>2015-07-03 14:15</td>
				<td style="white-space:nowrap">
                    <a href="orderworkdetail?orderWorkId=9577">查看</a>  
                    
                    
                    
                    
                    
                </td>
			</tr>
		
			<tr>
				<td>
					<a href="../orderwork/orderworkdetail?orderWorkId=9576">109576</a>
				</td>
				<td>冲印照片</td>
				<td>
					
						<a target="_blank" href="http://huiyintianxia.qiniudn.com/upload/productionorder/4028816949d0141d0149d05e0936000b.png?e=1435907627&amp;token=nb7IMD_O2ykrVGnANsM7M-AQsR7tLwpfPYRU2ZyW:Jg2HB3kTgLZuQU1YzlBvK9yHES4=" title="">绽放个---~~~~~||--111.aaaa.png</a>
					
				</td>
				<td>
					<div class="has-extends">
						<i class="fa fa-comment-o"></i>
						<a>详细信息</a>
						<div class="extends-info">
							<h4>印刷要求</h4>
							<p>产品：冲印照片，成品尺寸：8.3x12.7cm，材料：柯达皇家光面，冲印款数：1，冲印数量：1</p>
							
								<h4>备注</h4>
								<p>asadasd</p>
							
						</div>
					</div>
				</td>
				<td>阿瑟大苏打</td>
				<td>0.29 元</td>
				<td>5.0 元</td>
				<td id="td_status_9576">审核中</td>
				<td>
                    51yin
				</td>
				<td></td>
				<td>2015-07-03 14:13</td>
				<td style="white-space:nowrap">
                    <a href="orderworkdetail?orderWorkId=9576">查看</a>  
                    
                       &nbsp;<a data-id="9576" data-no="109576" class="orderWork_check" data-toggle="modal" data-target="#orderWorkPJH">审核</a> 
                    
                    
                    
                    
                    
                </td>
			</tr>
		
			<tr>
				<td>
					<a href="../orderwork/orderworkdetail?orderWorkId=9575">109575</a>
				</td>
				<td>自定义产品</td>
				<td>
					
						<a target="_blank" href="http://huiyintianxia.qiniudn.com/upload/productionorder/4028816949d0141d0149d05e0936000b.png?e=1435906440&amp;token=nb7IMD_O2ykrVGnANsM7M-AQsR7tLwpfPYRU2ZyW:EkSMi1FVXZtu-pivO00RtnCb2l8=" title="">绽放个---~~~~~||--111.aaaa.png</a>
					
				</td>
				<td>
					<div class="has-extends">
						<i class="fa fa-comment-o"></i>
						<a>详细信息</a>
						<div class="extends-info">
							<h4>印刷要求</h4>
							<p>产品：自定义 ,产品说明：阿瑟大苏打实打实大苏打三</p>
							
								<h4>备注</h4>
								<p>阿瑟大苏打实打实大苏打三</p>
							
						</div>
					</div>
				</td>
				<td>阿瑟大苏打</td>
				<td>20.0 元</td>
				<td>5.0 元</td>
				<td id="td_status_9575">待支付</td>
				<td>
                    51yin
				</td>
				<td></td>
				<td>2015-07-03 13:54</td>
				<td style="white-space:nowrap">
                    <a href="orderworkdetail?orderWorkId=9575">查看</a>  
                    
                    
                    
                    
                    
                </td>
			</tr>
		
			<tr>
				<td>
					<a href="../orderwork/orderworkdetail?orderWorkId=9572">109572</a>
				</td>
				<td>画册</td>
				<td>
					
						<a target="_blank" href="http://static.handyprint.cn/works/1703/1703.pdf" title="">1703.pdf</a>
					
				</td>
				<td>
					<div class="has-extends">
						<i class="fa fa-comment-o"></i>
						<a>详细信息</a>
						<div class="extends-info">
							<h4>印刷要求</h4>
							<p>产品：画册，成品尺寸：210*140mm，封面材料名称：双铜纸，封面材料克重：250克，内页材料名称：双铜纸，内页材料克重：250克，内页P数：20，印刷数量：1，装订方式：对裱胶装，后道工序：封面封底覆亮膜</p>
							
								<h4>备注</h4>
								<p>无</p>
							
						</div>
					</div>
				</td>
				<td>徐汇区,啊</td>
				<td>5.3 元</td>
				<td>5.0 元</td>
				<td id="td_status_9572">审核失败</td>
				<td>
                    51yin
				</td>
				<td></td>
				<td>2015-07-02 17:13</td>
				<td style="white-space:nowrap">
                    <a href="orderworkdetail?orderWorkId=9572">查看</a>  
                    
                    
                    
                    
                    
                </td>
			</tr>
		
			<tr>
				<td>
					<a href="../orderwork/orderworkdetail?orderWorkId=9570">109570</a>
				</td>
				<td>彩页折页</td>
				<td>
					
						<a target="_blank" href="http://huiyintianxia.qiniudn.com/upload/productionorder/4028816949d0141d0149d05e0936000b.png?e=1435824178&amp;token=nb7IMD_O2ykrVGnANsM7M-AQsR7tLwpfPYRU2ZyW:jXslWu1xXTe8q78y8QNXpXg6rXo=" title="">绽放个---~~~~~||--111.aaaa.png</a>
					
				</td>
				<td>
					<div class="has-extends">
						<i class="fa fa-comment-o"></i>
						<a>详细信息</a>
						<div class="extends-info">
							<h4>印刷要求</h4>
							<p>产品：彩页折页，成品尺寸：210×285mm，材料名称：双铜，材料克重：250克，单双面：双面，快印数量：200，后道工序：无工序</p>
							
						</div>
					</div>
				</td>
				<td>巨峰路</td>
				<td>160.0 元</td>
				<td>5.0 元</td>
				<td id="td_status_9570">审核失败</td>
				<td>
                    51yin
				</td>
				<td></td>
				<td>2015-07-02 15:04</td>
				<td style="white-space:nowrap">
                    <a href="orderworkdetail?orderWorkId=9570">查看</a>  
                    
                    
                    
                    
                    
                </td>
			</tr>
		
			<tr>
				<td>
					<a href="../orderwork/orderworkdetail?orderWorkId=9569">109569</a>
				</td>
				<td>小册子</td>
				<td>
					
						<a target="_blank" href="http://huiyintianxia.qiniudn.com/upload/productionorder/4028816949d0141d0149d05e0936000b.png?e=1435822207&amp;token=nb7IMD_O2ykrVGnANsM7M-AQsR7tLwpfPYRU2ZyW:SwaRxd7ZFgfP8s7IWQGTSquw1Is=" title="">绽放个---~~~~~||--111.aaaa.png</a>
					
				</td>
				<td>
					<div class="has-extends">
						<i class="fa fa-comment-o"></i>
						<a>详细信息</a>
						<div class="extends-info">
							<h4>印刷要求</h4>
							<p>产品：小册子，成品尺寸：210×285mm，材料名称：双胶纸，材料克重：80克，全书P数：20，快印数量：15，后道工序：骑马钉</p>
							
						</div>
					</div>
				</td>
				<td>巨峰路</td>
				<td>3360.0 元</td>
				<td>5.0 元</td>
				<td id="td_status_9569">审核中</td>
				<td>
                    51yin
				</td>
				<td></td>
				<td>2015-07-02 14:31</td>
				<td style="white-space:nowrap">
                    <a href="orderworkdetail?orderWorkId=9569">查看</a>  
                    
                       &nbsp;<a data-id="9569" data-no="109569" class="orderWork_check" data-toggle="modal" data-target="#orderWorkPJH">审核</a> 
                    
                    
                    
                    
                    
                </td>
			</tr>
		
			<tr>
				<td>
					<a href="../orderwork/orderworkdetail?orderWorkId=9568">109568</a>
				</td>
				<td>冲印照片</td>
				<td>
					
						<a target="_blank" href="http://huiyintianxia.qiniudn.com/upload/productionorder/4028816949d0141d0149d05e0936000b.png?e=1435819188&amp;token=nb7IMD_O2ykrVGnANsM7M-AQsR7tLwpfPYRU2ZyW:qfUGQ6LVTaVQ4YVj_692JXhUbxI=" title="">绽放个---~~~~~||--111.aaaa.png</a>
					
				</td>
				<td>
					<div class="has-extends">
						<i class="fa fa-comment-o"></i>
						<a>详细信息</a>
						<div class="extends-info">
							<h4>印刷要求</h4>
							<p>产品：冲印照片，成品尺寸：35.6x45.8cm，材料：柯达金尊光面，冲印款数：1，冲印数量：1</p>
							
						</div>
					</div>
				</td>
				<td>巨峰路</td>
				<td>15.7 元</td>
				<td>5.0 元</td>
				<td id="td_status_9568">审核中</td>
				<td>
                    51yin
				</td>
				<td></td>
				<td>2015-07-02 13:39</td>
				<td style="white-space:nowrap">
                    <a href="orderworkdetail?orderWorkId=9568">查看</a>  
                    
                       &nbsp;<a data-id="9568" data-no="109568" class="orderWork_check" data-toggle="modal" data-target="#orderWorkPJH">审核</a> 
                    
                    
                    
                    
                    
                </td>
			</tr>
		
			<tr>
				<td>
					<a href="../orderwork/orderworkdetail?orderWorkId=9567">109567</a>
				</td>
				<td>拼版单张</td>
				<td>
					
						<a target="_blank" href="http://www.baidu.com" title="">1.zip</a>
					
				</td>
				<td>
					<div class="has-extends">
						<i class="fa fa-comment-o"></i>
						<a>详细信息</a>
						<div class="extends-info">
							<h4>印刷要求</h4>
							<p>产品：拼版单张，成品尺寸：210×140mm，印刷数量：500张，单双面：单面，材料名称：157克铜版纸，后道工序：折页，折页：对折</p>
							
								<h4>备注</h4>
								<p>22222222222222222222222222222222222</p>
							
						</div>
					</div>
				</td>
				<td>111111</td>
				<td>147.0 元</td>
				<td>5.0 元</td>
				<td id="td_status_9567">审核中</td>
				<td>
                    51yin
				</td>
				<td></td>
				<td>2015-07-02 11:26</td>
				<td style="white-space:nowrap">
                    <a href="orderworkdetail?orderWorkId=9567">查看</a>  
                    
                       &nbsp;<a data-id="9567" data-no="109567" class="orderWork_check" data-toggle="modal" data-target="#orderWorkPJH">审核</a> 
                    
                    
                    
                    
                    
                </td>
			</tr>
		
	</tbody></table>
						
								<table class="table table-striped table-hover">
            <thead>
              <tr>
                <th>#</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Username</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
              </tr>
              <tr>
                <td>2</td>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
              </tr>
              <tr>
                <td>3</td>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
              </tr>
            </tbody>
          </table>
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
			<jsp:include page="/common/admin-footer.jsp" />
		</div><!-- /.main-container -->
	</body>
</html>