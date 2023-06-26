<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

       <style type="text/css">
			.table td {
				padding-top : 15px;
			    padding-bottom: 20px;
			}
  
       		.table .time, .table .content, .table .state{
       			font-size: 20px;
       			vertical-align:middle;
       			color: black;
       			font-family: 'Noto Sans KR', sans-serif;
       		}
       		.button-align{
       			text-align: center;
       			font-size: 15px;
       			vertical-align:middle;
       		}
       		.top-space{
       			max-height: 400px;
       			overflow: auto;
       			margin-top: 20px;
       		}
       		.top-space::-webkit-scrollbar {
			    width: 10px;
			}
			.top-space::-webkit-scrollbar-thumb {
			    background-color: rgb(180, 180, 180);
			    border-radius: 10px;
			}
			.top-space::-webkit-scrollbar-track {
			    background-color: white;
			}
			.state .btn-design{
				border-radius:5px;
				font-size: 13px;
				background-color:rgb(64,128,96);
				color:white;
			}
       		
       </style>
</head>
<body>

	<!-- Page Header-->
        <div style="text-align: center;">
        <header class="masthead" style="background-image: url('../assets/image/11.gif'); height:850px; background-size: cover; ">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <!-- <h1>football-play</h1>
                            <span class="subheading">A Blog Theme by Start Bootstrap</span> -->
                        </div>
                    </div>
                </div>
            </div>
        </header>
        </div>
	<!-- reserve-start -->
	
        	<div class="container px-4 px-lg-5">
	            <div class="row gx-4 gx-lg-5 justify-content-center">
	                <div class="col-md-8 col-lg-8 col-xl-10">
		                <h4 style="margin-bottom: 30px;">���� ����</h4>
		        		<input type="button" value="��¥����" class="btn btn-sm btn-outline-secondary" style="border-radius: 15px">
		        		<input type="button" value="��������" class="btn btn-sm btn-outline-secondary" style="border-radius: 15px">
		        		<div class="top-space">
			        		<table class="table">
			        			<tr>
			        				<td width=10% class="time">15:00</td>
			        				<td width=80% style="line-height: 20px;" class="content">
			        					���� ������ ������ �ʵ� A����<br>
			        					<sub style="color: gray;font-size: 0.6em">�� ����Ư���� �������� ������ 138</sub>
			        				</td>
			        				<td width=10% class="button-align state">
			        					<input type="button" class="btn btn-sm btn-design" value="���డ��">
			        				</td>
			        			</tr>
			        			<tr>
			        				<td width=10% class="time">15:00</td>
			        				<td width=80% style="line-height: 20px;" class="content">
			        					���� ������ ������ �ʵ� A����<br>
			        					<sub style="color: gray;font-size: 0.6em">�� ����Ư���� �������� ������ 138</sub>
			        				</td>
			        				<td width=10% class="button-align state">
			        					<span style="font-weight: lighter;color: gray;font-size: 0.8em;">����</span>
			        				</td>
			        			</tr>
			        			<tr>
			        				<td width=10% class="time">15:00</td>
			        				<td width=80% style="line-height: 20px;" class="content">
			        					���� ������ ������ �ʵ� A����<br>
			        					<sub style="color: gray;font-size: 0.6em">�� ����Ư���� �������� ������ 138</sub>
			        				</td>
			        				<td width=10% class="button-align state">
			        					<input type="button" class="btn btn-sm btn-design" value="���డ��">
			        				</td>
			        			</tr>
			        			<tr>
			        				<td width=10% class="time">15:00</td>
			        				<td width=80% style="line-height: 20px;" class="content">
			        					���� ������ ������ �ʵ� A����<br>
			        					<sub style="color: gray;font-size: 0.6em">�� ����Ư���� �������� ������ 138</sub>
			        				</td>
			        				<td width=10% class="button-align state">
			        					<input type="button" class="btn btn-sm btn-design" value="���డ��">
			        				</td>
			        			</tr>
			        			<tr>
			        				<td width=10% class="time">15:00</td>
			        				<td width=80% style="line-height: 20px;" class="content">
			        					���� ������ ������ �ʵ� A����<br>
			        					<sub style="color: gray;font-size: 0.6em">�� ����Ư���� �������� ������ 138</sub>
			        				</td>
			        				<td width=10% class="button-align state">
			        					<input type="button" class="btn btn-sm btn-design" value="���డ��">
			        				</td>
			        			</tr>
			        			<tr>
			        				<td width=10% class="time">15:00</td>
			        				<td width=80% style="line-height: 20px;" class="content">
			        					���� ������ ������ �ʵ� A����<br>
			        					<sub style="color: gray;font-size: 0.6em">�� ����Ư���� �������� ������ 138</sub>
			        				</td>
			        				<td width=10% class="button-align state">
			        					<input type="button" class="btn btn-sm btn-design" value="���డ��">
			        				</td>
			        			</tr>
			        			<tr>
			        				<td width=10% class="time">15:00</td>
			        				<td width=80% style="line-height: 20px;" class="content">
			        					���� ������ ������ �ʵ� A����<br>
			        					<sub style="color: gray;font-size: 0.6em">�� ����Ư���� �������� ������ 138</sub>
			        				</td>
			        				<td width=10% class="button-align state">
			        					<input type="button" class="btn btn-sm btn-design" value="���డ��">
			        				</td>
			        			</tr>
			        			<tr>
			        				<td width=10% class="time">15:00</td>
			        				<td width=80% style="line-height: 20px;" class="content">
			        					���� ������ ������ �ʵ� A����<br>
			        					<sub style="color: gray;font-size: 0.6em">�� ����Ư���� �������� ������ 138</sub>
			        				</td>
			        				<td width=10% class="button-align state">
			        					<input type="button" class="btn btn-sm btn-design" value="���డ��">
			        				</td>
			        			</tr>
			        			<tr>
			        				<td width=10% class="time">15:00</td>
			        				<td width=80% style="line-height: 20px;" class="content">
			        					���� ������ ������ �ʵ� A����<br>
			        					<sub style="color: gray;font-size: 0.6em">�� ����Ư���� �������� ������ 138</sub>
			        				</td>
			        				<td width=10% class="button-align state">
			        					<input type="button" class="btn btn-sm btn-design" value="���డ��">
			        				</td>
			        			</tr>
			        			<tr>
			        				<td width=10% class="time">15:00</td>
			        				<td width=80% style="line-height: 20px;" class="content">
			        					���� ������ ������ �ʵ� A����<br>
			        					<sub style="color: gray;font-size: 0.6em">�� ����Ư���� �������� ������ 138</sub>
			        				</td>
			        				<td width=10% class="button-align state">
			        					<input type="button" class="btn btn-sm btn-design" value="���డ��">
			        				</td>
			        			</tr>
			        		</table>
		        		</div>
	        		</div>
	        	</div>
        	</div>
       
        <!-- reserve-end -->
        
        	<div class="container px-4 px-lg-5" style="margin-top: 80px;">
	            <div class="row gx-4 gx-lg-5 justify-content-center">
	                <div class="col-md-8 col-lg-8 col-xl-10" style="max-height: 300px;">
		                <h4 style="margin-bottom: 30px;">�α� ��ǰ</h4>
		                	<div class=row>
				              <div class="col-md-2">
							    <div class="thumbnail">
							      <a href="#">
							        <img src="https://www.soccerboom.co.kr/web/product/medium/202306/c9db7652c144a70bd25fb63145782f00.jpg" alt="Fjords" style="width:100%">
							        <div class="caption">
							          ŷ ��Ƽ����Ʈ FG/AG(10756301)<br>
							          Ǫ��<br>
							          <span style="text-decoration: line-through;">259,000��</span><br>
							          <span style="font-weight: bold;color:blue;">240,200��</span>
							        </div>
							      </a>
							    </div>
							  </div>
				              <div class="col-md-2">
							    <div class="thumbnail">
							      <a href="#">
							        <img src="https://www.soccerboom.co.kr/web/product/medium/202306/c9db7652c144a70bd25fb63145782f00.jpg" alt="Fjords" style="width:100%">
							        <div class="caption">
							          ŷ ��Ƽ����Ʈ FG/AG(10756301)<br>
							          Ǫ��<br>
							          <span style="text-decoration: line-through;">259,000��</span><br>
							          <span style="font-weight: bold;color:blue;">240,200��</span>
							        </div>
							      </a>
							    </div>
							  </div>
				              <div class="col-md-2">
							    <div class="thumbnail">
							      <a href="#">
							        <img src="https://www.soccerboom.co.kr/web/product/medium/202306/c9db7652c144a70bd25fb63145782f00.jpg" alt="Fjords" style="width:100%">
							        <div class="caption">
							          ŷ ��Ƽ����Ʈ FG/AG(10756301)<br>
							          Ǫ��<br>
							          <span style="text-decoration: line-through;">259,000��</span><br>
							          <span style="font-weight: bold;color:blue;">240,200��</span>
							        </div>
							      </a>
							    </div>
							  </div>
				              <div class="col-md-2">
							    <div class="thumbnail">
							      <a href="#">
							        <img src="https://www.soccerboom.co.kr/web/product/medium/202306/c9db7652c144a70bd25fb63145782f00.jpg" alt="Fjords" style="width:100%">
							        <div class="caption">
							          ŷ ��Ƽ����Ʈ FG/AG(10756301)<br>
							          Ǫ��<br>
							          <span style="text-decoration: line-through;">259,000��</span><br>
							          <span style="font-weight: bold;color:blue;">240,200��</span>
							        </div>
							      </a>
							    </div>
							  </div>
				              <div class="col-md-2">
							    <div class="thumbnail">
							      <a href="#">
							        <img src="https://www.soccerboom.co.kr/web/product/medium/202306/c9db7652c144a70bd25fb63145782f00.jpg" alt="Fjords" style="width:100%">
							        <div class="caption">
							          ŷ ��Ƽ����Ʈ FG/AG(10756301)<br>
							          Ǫ��<br>
							          <span style="text-decoration: line-through;">259,000��</span><br>
							          <span style="font-weight: bold;color:blue;">240,200��</span>
							        </div>
							      </a>
							    </div>
							  </div>
				              <div class="col-md-2">
							    <div class="thumbnail">
							      <a href="#">
							        <img src="https://www.soccerboom.co.kr/web/product/medium/202306/c9db7652c144a70bd25fb63145782f00.jpg" alt="Fjords" style="width:100%">
							        <div class="caption">
							          ŷ ��Ƽ����Ʈ FG/AG(10756301)<br>
							          Ǫ��<br>
							          <span style="text-decoration: line-through;">259,000��</span><br>
							          <span style="font-weight: bold;color:blue;">240,200��</span>
							        </div>
							      </a>
							    </div>
							  </div>
						</div>
					</div>
				</div>
			</div>
		
        <!-- ���θ� start -->
        
        <!-- ���θ� end -->
</body>
</html>