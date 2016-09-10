<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoFormCalendar"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoFormCalendar"/> 
</div>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i>日期选择
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse">
					</a>
					<a href="#portlet-config" data-toggle="modal" class="config">
					</a>
					<a href="javascript:;" class="reload">
					</a>
					<a href="javascript:;" class="remove">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="#" class="form-horizontal form-bordered">
					<div class="form-body">
						<div class="form-group">
							<label class="control-label col-md-3">默认</label>
							<div class="col-md-3">
								<input class="form-control form-control-inline input-medium date-picker" size="16" type="text" value=""/>
								<span class="help-block">
								请选择日期 </span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">禁用过去日期</label>
							<div class="col-md-3">
								<div class="input-group input-medium date date-picker" data-date-format="yyyy-mm-dd" data-date-start-date="+0d">
									<input type="text" class="form-control" readonly>
									<span class="input-group-btn">
									<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
								<!-- /input-group -->
								<span class="help-block">
								请选择日期 </span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">设置开始日期</label>
							<div class="col-md-3">
								<div class="input-group input-medium date date-picker" data-date="2015-01-01" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
									<input type="text" class="form-control" readonly>
									<span class="input-group-btn">
									<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
								<!-- /input-group -->
								<span class="help-block">
								请选择日期 </span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">选择年月</label>
							<div class="col-md-3">
								<div class="input-group input-medium date date-picker" data-date="2015/01" data-date-format="yyyy/mm" data-date-viewmode="years" data-date-minviewmode="months">
									<input type="text" class="form-control" readonly>
									<span class="input-group-btn">
									<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
								<!-- /input-group -->
								<span class="help-block">
								请选择年月</span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">日期范围</label>
							<div class="col-md-4">
								<div class="input-group input-large date-picker input-daterange" data-date="2015-01-01" data-date-format="yyyy-mm-dd">
									<input type="text" class="form-control" name="from">
									<span class="input-group-addon">
									to </span>
									<input type="text" class="form-control" name="to">
								</div>
								<!-- /input-group -->
								<span class="help-block">
								请选择日期范围 </span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">日历</label>
							<div class="col-md-3">
								<div class="date-picker" data-date-format="yyyy-mm-dd">
								</div>
							</div>
						</div>
					</div>
				</form>
				<!-- END FORM-->
			</div>
		</div>
		<!-- END PORTLET-->
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div class="portlet box green-meadow">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i>日期时间选择
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse">
					</a>
					<a href="#portlet-config" data-toggle="modal" class="config">
					</a>
					<a href="javascript:;" class="reload">
					</a>
					<a href="javascript:;" class="remove">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="#" class="form-horizontal form-bordered">
					<div class="form-body">
						<div class="form-group">
							<label class="control-label col-md-3">默认</label>
							<div class="col-md-4">
								<div class="input-group date form_datetime">
									<input type="text" size="16" readonly class="form-control">
									<span class="input-group-btn">
									<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
								<!-- /input-group -->
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">高级</label>
							<div class="col-md-4">
								<div class="input-group date form_datetime" data-date="2015-01-01T15:25:00Z">
									<input type="text" size="16" readonly class="form-control">
									<span class="input-group-btn">
									<button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
									</span>
									<span class="input-group-btn">
									<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
								<!-- /input-group -->
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Meridian Format</label>
							<div class="col-md-4">
								<div class="input-group date form_meridian_datetime" data-date="2015-01-01T15:25:00Z">
									<input type="text" size="16" readonly class="form-control">
									<span class="input-group-btn">
									<button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
									</span>
									<span class="input-group-btn">
									<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
								<!-- /input-group -->
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">日历</label>
							<div class="col-md-4">
								<div class="form_datetime" data-date="2015-01-01T15:25:00Z">
								</div>
								<!-- /input-group -->
							</div>
						</div>
					</div>
				</form>
				<!-- END FORM-->
			</div>
		</div>
		<!-- END PORTLET-->
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div class="portlet box yellow-crusta">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i>日期范围选择
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse">
					</a>
					<a href="#portlet-config" data-toggle="modal" class="config">
					</a>
					<a href="javascript:;" class="reload">
					</a>
					<a href="javascript:;" class="remove">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="#" class="form-horizontal form-bordered">
					<div class="form-body">
						<div class="form-group">
							<label class="control-label col-md-3">默认</label>
							<div class="col-md-4">
								<div class="input-group" id="defaultrange">
									<input type="text" class="form-control">
									<span class="input-group-btn">
									<button class="btn default date-range-toggle" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group ">
							<label class="control-label col-md-3">高级</label>
							<div class="col-md-4">
								<div id="reportrange" class="btn default">
									<i class="fa fa-calendar"></i>
									&nbsp; <span>
									</span>
									<b class="fa fa-angle-down"></b>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!-- END FORM-->
			</div>
		</div>
		<!-- END PORTLET-->
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div class="portlet box green-meadow">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i>颜色选择
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse">
					</a>
					<a href="#portlet-config" data-toggle="modal" class="config">
					</a>
					<a href="javascript:;" class="reload">
					</a>
					<a href="javascript:;" class="remove">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="#" class="form-horizontal form-bordered">
					<div class="form-body">
						<div class="form-group">
							<label class="control-label col-md-3">默认</label>
							<div class="col-md-3">
								<input type="text" class="colorpicker-default form-control" value="#8fff00"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">RGBA</label>
							<div class="col-md-3">
								<input type="text" class="colorpicker-rgba form-control" value="rgb(0,194,255,0.78)" data-color-format="rgba"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">组件</label>
							<div class="col-md-3">
								<div class="input-group color colorpicker-default" data-color="#3865a8" data-color-format="rgba">
									<input type="text" class="form-control" value="#3865a8" readonly>
									<span class="input-group-btn">
									<button class="btn default" type="button"><i style="background-color: #3865a8;"></i>&nbsp;</button>
									</span>
								</div>
								<!-- /input-group -->
							</div>
						</div>
					</div>
				</form>
				<!-- END FORM-->
			</div>
		</div>
		<!-- END PORTLET-->
	</div>
</div>

<script type="text/javascript">
<!--
	$(function(){
		var handleDatePickers = function () {

	        if (jQuery().datepicker) {
	            $('.date-picker').datepicker({
	                rtl: Metronic.isRTL(),
	                orientation: "left",
	                autoclose: true
	            });
	        }
	    }

	    var handleDateRangePickers = function () {
	        if (!jQuery().daterangepicker) {
	            return;
	        }

	        $('#defaultrange').daterangepicker({
	                opens: (Metronic.isRTL() ? 'left' : 'right'),
	                format: 'YYYY/MM/DD',
	                separator: ' to ',
	                startDate: moment().subtract('days', 29),
	                endDate: moment(),
	                minDate: '2014/01/01',
	                maxDate:  new Date().getFullYear() + '/12/31',
	                locale: {
	    		        applyLabel: '确认',
	    		        cancelLabel:'取消',
	    		        fromLabel: '从',
	    		        toLabel: '到',
	    		        customRangeLabel: '自定义',
	    		        daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
	    		        monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
	    		        firstDay: 1
	    		    }
	            },
	            function (start, end) {
	                $('#defaultrange input').val(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
	            }
	        );        

	        CLOUD.daterangepicker("reportrange", function(start, end){
	        	$('#reportrange span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
	    	});
	       
	        $('#reportrange span').html(moment().subtract('days', 29).format('YYYY-MM-DD') + ' - ' + moment().format('YYYY-MM-DD'));
	    }

	    var handleDatetimePicker = function () {

	        $(".form_datetime").datetimepicker({
	            autoclose: true,
	            isRTL: Metronic.isRTL(),
	            format: "yyyy-mm-dd hh:ii",
	            pickerPosition: (Metronic.isRTL() ? "bottom-right" : "bottom-left")
	        });

	        $(".form_advance_datetime").datetimepicker({
	            isRTL: Metronic.isRTL(),
	            format: "dd MM yyyy - hh:ii",
	            autoclose: true,
	            todayBtn: true,
	            startDate: "2015-01-01 10:00",
	            pickerPosition: (Metronic.isRTL() ? "bottom-right" : "bottom-left"),
	            minuteStep: 10
	        });

	        $(".form_meridian_datetime").datetimepicker({
	            isRTL: Metronic.isRTL(),
	            format: "yyyy-mm-dd HH:ii P",
	            showMeridian: true,
	            autoclose: true,
	            pickerPosition: (Metronic.isRTL() ? "bottom-right" : "bottom-left"),
	            todayBtn: true
	        });

	    }


	    var handleColorPicker = function () {
	        if (!jQuery().colorpicker) {
	            return;
	        }
	        $('.colorpicker-default').colorpicker({
	            format: 'hex'
	        });
	        $('.colorpicker-rgba').colorpicker();
	    }
		
	    
	    handleDatePickers();
        handleDatetimePicker();
        handleDateRangePickers();
        handleColorPicker();
	});
	
//-->
</script>
