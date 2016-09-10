<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi />
</h3>
<div class="page-bar">
	<c:navi />
</div>

<div class="row">
	<div class="col-md-6">
		<div class="portlet-body " >
			<table class="table table-striped table-bordered table-hover" id="trig-settings-table">
			<thead>
			<tr>
				<th>名称</th>  
				<th>值</th>
			</tr>
			</thead>
			<tbody>
			
			</tbody>
			</table>
		</div>
	</div>
	<div class="col-md-6">
			<div id="container" style="width: 540px; height: 400px;">
		
			</div>
	</div>
</div>



<script type="text/javascript">
$(function(){
	var serverInfo = {};
	serverInfo.url = {};
	serverInfo.url.find = 'server_info_findList.json';

	new CLOUD.Datatable({
		table : $("#trig-settings-table"), 
		url : serverInfo.url.find, 
		paging:false,
		columns : [
		                 { "data": "key", orderable: false},
		                 { "data": "value" , orderable: false}
		],
		order: [[0,'asc']]
	});
});
</script>
<script type="text/javascript">
$(function () {
    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });
    
    var murl = 'server_info_findMemory.json';   
    function getData(series) {
    	if(document.getElementById("container")) {
        	$.post(murl,'', function(data) {
        		data = CLOUD.successHandle(data);
        		var x = (new Date()).getTime(), // current time
                y = data.memory;
            	series.addPoint([x, y], true, true);
        	});
        	setTimeout(function() {
            	getData(series);
            }, 2000);
    	}
    }
    $('#container').highcharts({
        chart: {
            type: 'spline',
            animation: Highcharts.svg, // don't animate in old IE
            marginRight: 10,
            events: {
                load: function() {
                    // set up the updating of the chart each second
                    var series = this.series[0];
                    setTimeout(function() {
                    	getData(series);
                    }, 2000);
                }
            }
        },
        title: {
            text: '内存实时监控'
        },
        xAxis: {
            type: 'datetime',
            tickPixelInterval: 150 // 
        },
        yAxis: {
            title: {
                text: '内存使用大小（M）'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            formatter: function() {
                    return '<b>'+ this.series.name +'</b><br/>'+
                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                    Highcharts.numberFormat(this.y, 2);
            }
        },
        legend: {
            enabled: false
        },
        exporting: {
            enabled: false
        },
        series: [{
            name: '实时数据',
            data: (function() {
                // generate an array of random data
                var data = [],
                    time = (new Date()).getTime(),
                    i;

                for (i = -14; i <= 0; i++) {
                    data.push({
                        x: time + i * 1000,
                        y: 1
                    });
                }
                return data;
            })()
        }],
        credits: {
        	enabled: false
        }
    });
});
</script>
 
 