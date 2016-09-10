<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoPanel1"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoPanel1"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i>  表单
				</div>
				<div class="tools">
					<a href="" class="collapse">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<form action="#" class="form-horizontal" id="demoform" name="demoform">
					<div class="form-body" >
							<div class="form-group">
								<label class="col-md-3 control-label">姓名</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入姓名" name="demo_realName" id="demo_realName">
								</div>
							</div>
							<div class="form-group">
							<label class="col-md-offset-3 col-md-9" >
								<button id="uu12" class="btn green" type="submit"  onclick="return false;">提交</button>
							</label>
						</div>	
					</div>
					
			</form>
		</div>
	</div>
</div>	
</div>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET-->
		<div class="portlet box grey-cascade">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-globe"></i>Managed Table
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
			<div class="portlet-body">
				<div class="table-toolbar">
					<div class="row">
						<div class="col-md-6">
							<div class="btn-group">
								<button id="sample_editable_1_new" class="btn green">
								Add New <i class="fa fa-plus"></i>
								</button>
							</div>
						</div>
						<div class="col-md-6">
							<div class="btn-group pull-right">
							<button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i class="fa fa-angle-down"></i>
							</button>
							<ul class="dropdown-menu pull-right">
								<li>
									<a href="#">
									Print </a>
								</li>
								<li>
									<a href="#">
									Save as PDF </a>
								</li>
								<li>
									<a href="#">
									Export to Excel </a>
								</li>
							</ul>
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="sample_1">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes"/>
					</th>
					<th>
						 Username
					</th>
					<th>
						 Email
					</th>
					<th>
						 Points
					</th>
					<th>
						 Joined
					</th>
					<th>
						 Status
					</th>
				</tr>
				</thead>
				<tbody>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 shuxer
					</td>
					<td>
						<a href="mailto:shuxer@gmail.com">
						shuxer@gmail.com </a>
					</td>
					<td>
						 120
					</td>
					<td class="center">
						 12 Jan 2012
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 looper
					</td>
					<td>
						<a href="mailto:looper90@gmail.com">
						looper90@gmail.com </a>
					</td>
					<td>
						 120
					</td>
					<td class="center">
						 12.12.2011
					</td>
					<td>
						<span class="label label-sm label-warning">
						Suspended </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 userwow
					</td>
					<td>
						<a href="mailto:userwow@yahoo.com">
						userwow@yahoo.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 12.12.2012
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 user1wow
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						userwow@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 12.12.2012
					</td>
					<td>
						<span class="label label-sm label-default">
						Blocked </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 restest
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						test@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 12.12.2012
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 foopl
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 19.11.2010
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 weep
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 19.11.2010
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 coop
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 19.11.2010
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 pppol
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 19.11.2010
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 test
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 19.11.2010
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 userwow
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						userwow@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 12.12.2012
					</td>
					<td>
						<span class="label label-sm label-default">
						Blocked </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 test
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						test@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 12.12.2012
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 goop
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 12.11.2010
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 weep
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 15.11.2011
					</td>
					<td>
						<span class="label label-sm label-default">
						Blocked </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 toopl
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 16.11.2010
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 userwow
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						userwow@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 9.12.2012
					</td>
					<td>
						<span class="label label-sm label-default">
						Blocked </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 tes21t
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						test@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 14.12.2012
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 fop
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 13.11.2010
					</td>
					<td>
						<span class="label label-sm label-warning">
						Suspended </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 kop
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 17.11.2010
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 vopl
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 19.11.2010
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 userwow
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						userwow@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 12.12.2012
					</td>
					<td>
						<span class="label label-sm label-default">
						Blocked </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 wap
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						test@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 12.12.2012
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 test
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 19.12.2010
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 toop
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 17.12.2010
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				<tr class="odd gradeX">
					<td>
						<input type="checkbox" class="checkboxes" value="1"/>
					</td>
					<td>
						 weep
					</td>
					<td>
						<a href="mailto:userwow@gmail.com">
						good@gmail.com </a>
					</td>
					<td>
						 20
					</td>
					<td class="center">
						 15.11.2011
					</td>
					<td>
						<span class="label label-sm label-success">
						Approved </span>
					</td>
				</tr>
				</tbody>
				</table>
			</div>
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>

<script>
$(function(){
	var table = $('#sample_1');

    // begin first table
    table.dataTable({
        "columns": [{
            "orderable": false
        }, {
            "orderable": true
        }, {
            "orderable": false
        }, {
            "orderable": false
        }, {
            "orderable": true
        }, {
            "orderable": false
        }],
        "lengthMenu": [
            [5, 15, 20, -1],
            [5, 15, 20, "All"] // change per page values here
        ],
        // set the initial value
        "pageLength": 5,            
        "pagingType": "bootstrap_full_number",
        "language": {
            "lengthMenu": "  _MENU_ records",
            "paginate": {
                "previous":"Prev",
                "next": "Next",
                "last": "Last",
                "first": "First"
            }
        },
        "columnDefs": [{  // set default column settings
            'orderable': false,
            'targets': [0]
        }, {
            "searchable": false,
            "targets": [0]
        }],
        "order": [
            [1, "asc"]
        ] // set first column as a default sort by asc
    });
});
</script>
