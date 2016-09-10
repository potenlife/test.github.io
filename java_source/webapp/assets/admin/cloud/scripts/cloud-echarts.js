/**
 * 
 */
CLOUD.EChartsInit=function(){
	
}

/**
*	百度图表公共方法显示
*如果一个页面多个echart图表，如果出现有图表变形成紧凑，则试着把div（即containerID）设置min-width和min-height
*/
CLOUD.ECharts = function(containerID, title, data, type,fn) {
	require.config({
        paths: {
            echarts: CLOUD.PATH+'/assets/global/plugins/echarts'
        }
    });
	// 使用
    require(
        [
            'echarts',
            'echarts/chart/line',
            'echarts/chart/pie',
            'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
            'echarts/chart/funnel'
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById(containerID)); 
         // 过渡---------------------
            myChart.showLoading({
                text: '正在努力的读取数据中...',    //loading话术
            });

            myChart.hideLoading();
//          line bar 格式 data格式2：[{"name":"降水量","data":100,"categories":"1月"},{"name":"降水量","data":400,"categories":"2月"},{"name":"蒸发量","data":200,"categories":"1月"},{"name":"蒸发量","data":300,"categories":"2月"}]
//         pie格式：   var data = '[{"name":"1月","data":100,"categories":"降水量"},{"name":"2月","data":400,"categories":"降水量"},{"name":"3月","data":200,"categories":"降水量"}]';
            var legendData = [];
            var seriesPieName = [];
           var xAxisData = [];
            var seriesArray = [];
            var xAxisArray = [];
            var map = {};
            if(data&&data!=''){ 
            	data = $.parseJSON(data);
            	$.each(data,function(i,rowData){
            		var seriesData = [];
            		//循环data
            		var categories = rowData.categories;
            		if($.inArray(categories,xAxisData)==-1){
            			//如果横轴的名称不存在 
            			xAxisData.push(categories);
            			if(type == 'pie'){
            				map[categories] = seriesData;
            			}
            		}
            		var name = rowData.name;
            		var value = rowData.data;
            		if(!value){
						value = '-';//没值 则"-"
					}
            		if($.inArray(name,legendData)==-1){
            			legendData.push(name);
            			//柱名称name
            			if(type == 'bar' || type == 'line'){
            				map[name] = seriesData;
            			}
            		}
            		if(type == 'bar' || type == 'line'){
            			map[name].push(value);
            		}else if(type == 'pie'){
            			//(饼图 data:[{value:335, name:'直接访问'}])
						map[categories].push({'value':value,'name':name});
            		}
            		
            	});
            	
            	$.each(map,function(key,value){
            		var obj = {'name':key,'type':type,'data':value};
            		 if(type == 'pie'){
            			 obj = {'name':key,'type':type,'data':value,'radius':'55%','center':['50%', '60%']}
            		 }
	        		//图表内容
	 				seriesArray.push(obj);
            		 
            	});
            	//横轴内容
				xAxisArray.push({'type':'category','data':xAxisData});
            }
            var option = {};
            
            if(type=='bar'||type=='line'){
            	option = {
                        tooltip: {
                            trigger: 'axis'
                        },
                        title:{
                        	text:title//主标题
                        },
                        //图例
                        legend: {
                        	textStyle:{'color':'auto'},
                             left: 'left',
                            data:legendData
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType : {show: true, type: ['line', 'bar']},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        //直角坐标系中横轴数组
                        xAxis : xAxisArray,
                        //直角坐标系中纵轴数组
                        yAxis : [
                            {
                                type : 'value',
                                splitNumber: 10     // 数值轴用，分割段数，默认为5
                            }
                        ],
                        series:seriesArray
                    };
            }else if(type == 'pie'){
            	option = {
            			tooltip : {
            		        trigger: 'item',
            		        formatter: "{a} <br/>{b} : {c} ({d}%)"
            		    },
                        title:{
                        	text:title,//主标题
                        	subtext:'',
                        	 x:'center'
                        },
                        //图例
                        legend: {
                        	textStyle:{'color':'auto'},
                        	orient : 'vertical',
                            x : 'left',
                            data:legendData
                        },
                        toolbox: {
                            show : true,
                            feature : {
                            	 mark : {show: true},
                                 dataView : {show: true, readOnly: false},
                                 magicType : {
                                     show: true, 
                                     type: ['pie', 'funnel'],
                                     option: {
                                         funnel: {
                                             x: '25%',
                                             width: '50%',
                                             funnelAlign: 'left',
                                             max: 1548
                                         }
                                     }
                                 },
                                 restore : {show: true},
                                 saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        series:seriesArray
                    };
            }
            // 为echarts对象加载数据 
            myChart.setOption(option); 
            if(typeof(fn) == 'function'){
            	fn(myChart);
            }
        }
    );
};