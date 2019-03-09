var echarts = require('echarts');
class polyChartA {
	constructor(selector) {
		this.selector = selector;
	}
	render(data) {
		console.log(data);
		var myChart = echarts.init(document.querySelector(this.selector));
		var option = {
			title: {
				subtext: ''
			},
			tooltip: {
				trigger: 'axis'
			},
			legend: {},
			toolbox: {
				show: true,
				feature: {
					dataZoom: {
						yAxisIndex: 'none'
					},
					dataView: {
						readOnly: false
					},
					magicType: {
						type: ['line', 'bar']
					},
					restore: {},
					saveAsImage: {}
				}
			},
			xAxis: {
				type: 'category',
				boundaryGap: false,
				data: ['1', '2', '3', '4', '5', '6', '7', '8', '9']
			},
			yAxis: {
				type: 'value',
				axisLabel: {
					formatter: '{value}'
				}
			},
			series: [{
					name: '',
					type: 'line',
					color: '#4181D5',
					data: data.d1,
					markPoint: {
						data: [{
								type: 'max',
								name: '最大值'
							},
							{
								type: 'min',
								name: '最小值'
							}
						]
					},
					markLine: {
						data: [{
							type: 'average',
							name: '平均值'
						}]
					}
				},
				{
					name: '',
					color: '#7FD89A',
					type: 'line',
					data: data.d2,
					markPoint: {
						data: [{
							name: '周最低',
							value: -2,
							xAxis: 1,
							yAxis: -1.5
						}]
					},
					markLine: {
						data: [{
								type: 'average',
								name: '平均值'
							},
							[{
								symbol: 'none',
								x: '90%',
								yAxis: 'max'
							}, {
								symbol: 'circle',
								label: {
									normal: {
										position: 'start',
										formatter: '最大值'
									}
								},
								type: 'max',
								name: '最高点'
							}]
						]
					}
				}
			]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	}
}


class reck_chart {
	constructor(selector) {
		this.selector = selector;
	}
	render(data, color) {
		var myChart = echarts.init(document.querySelector(this.selector));
		var times = [];
		var datas = [];
		for(var key of data) {
			times.push(key.time);
			datas.push(key.data);
		}
		var option = {
			tooltip: {
				trigger: 'axis',
				backgroundColor: '#FFFFFF',
				padding: [3, 35],
				textStyle: {
					color: '#000'
				},
				extraCssText: 'box-shadow: 0 2px 8px 0 rgba(0,0,0,.15)'
			},
			grid: {
				left: '5%',
				right: '5%',
				top: 20,
				bottom: 40
			},
			xAxis: {
				type: 'category',
				data: times,
				boundaraGap:['20%','20%'],
				nameLocation:'middle',
				axisTick: {
					alignWithLabel: true,
					lineStyle: {
						color: "#CCC"
					},
					length: 180,
					inside: true
				},
				axisLine: {
					onZero: false,
					lineStyle: {
						color:'#2670CF'
					}
				},
				axisLabel: {
					color: '#000',
					interval:0
				}
			},
			yAxis: {
				type: 'value',
				axisLine: {
					lineStyle: {
						color:'#2670CF'
					}
				},
				axisTick: {
					alignWithLabel: true,
					lineStyle: {
						color: '#2670CF'
					},
					length: 0,
					inside: true
				},
				axisLabel: {
					color: '#000'
				}
			},
			series: [{
				type: 'bar',
				symbolSize: 11,
				symbol: 'emptyCircle',
				data: datas,
				color: '#2670CF',
			}]
		}
		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	}
}
var polyChart = function(selector) {
	return new polyChartA(selector)
}
var polyChartB = function(data,color) {
	var times = [];
		var datas = [];
		for(var key of data) {
			times.push(key.time);
			datas.push(key.data);
		}
		var option = {
			tooltip: {
				trigger: 'axis',
				position:function(point){
					var a=[point[0]+30,point[1]-25];
					return a;
				},
				padding: [3, 35],
//				textStyle: {
//					color:" rgba(0,0,0,0.45)"
//				},
				extraCssText: 'box-shadow: 0 2px 8px 0 rgba(14, 61, 126, 1)'
		},
		color: ['#0FD4AE'],
			grid: {
				left: '5%',
				right: '5%',
				top: 20,
				bottom: 40
			},
			xAxis: {
				type: 'category',
				data: times,
				boundaryGap: false,
				axisLine: {
          lineStyle: {
            type: 'solid',
            color: '#0E3D7E',//左边线的颜色
            width: '0'//坐标线的宽度
          }
       }
			},
			yAxis: {
				type: 'value',
				axisTick: {
					alignWithLabel: true,
					lineStyle: {
						color: "rgba(14, 61, 126, 1)"
					},
					length: 0,
					inside: true
				},
				axisLine: {
          lineStyle: {
            type: 'solid',
            color: '#064775',//左边线的颜色
            width: '0'//坐标线的宽度
          }
        },
				splitLine: {
          lineStyle: {
            type: 'solid',
            color: '#0E3D7E',//左边线的颜色
            width: '1'//坐标线的宽度
          }
        },
				axisLabel: {
					color: 'rgba(255, 255, 255, 0.8)'
				}
			},
			series: [{
				type: 'line',
				symbolSize: 0,
				symbol: 'emptyCircle',
				data: datas,
				color: 'rgba(14, 61, 126, 1)',
				markLine: {
            data: [
                {
                	type: 'average', 
                	name: '阀值',
                	value:'阀值',
                	lineStyle:{
                		color:'#D0021B'
                	}
               	}
            ]
        },
				line: {
          type: 'linear',
          x: 0,
          y: 0,
          x2: 0,
          y2: 1,
          colorStops: [{
            offset: 0, color: '#0FD4AE' // 0% 处的颜色
          }, {
            offset: 1, color: 'rgba(78,198,244,1)' // 100% 处的颜色
          }],
        },
       lineStyle: {
	       	color: {
					    type: 'linear',
					    x: 0,
					    y: 0,
					    x2: 1,
					    y2: 0,
					    colorStops: [{
					        offset: 0, color: '#05A6FB' // 0% 处的颜色
					    }, {
					        offset: 1, color: '#CF48EA' // 100% 处的颜色
					    }],
					    globalCoord: false // 缺省为 false
					},
          width: 4 //default value:2
      	},
				areaStyle: {
	        color: {
	          type: 'linear',
	          x: 0,
	          y: 0,
	          x2: 0,
	          y2: 1,
	          colorStops: [{
	            offset: 0, color: '#2764CE' // 0% 处的颜色
	          }, {
	            offset: 1, color: '#041940' // 100% 处的颜色
	          }]
	        },
	      }
			}]
		}
		return option;
}
var reckChart = function(selector) {
	return new reck_chart(selector)
}
export {
	polyChart,
	polyChartB,
	reckChart
}