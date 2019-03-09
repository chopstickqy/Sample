import { EChartOption } from 'echarts';

export const OPTION: EChartOption = {
    // title : {
    //   text: '',
    //   subtext: '月度产品销售趋势',
    // },
    tooltip : {
      trigger: 'axis'
    },
    xAxis : [
        {
            type : 'category',
            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
            axisLabel: {
              interval:0,
              rotate:45
          }
        }
    ],  
    yAxis : [
        {
            type: 'value',
            min: 0,
            max: 10,
            interval: 2,
            axisLabel: {
                formatter: '{value} w'
            }
        }
    ],
    series : [
        {
            name:'月度销售',
            type:'bar',
            barWidth : 15,//柱图宽度
            data:[2.0, 4.9, 7.0, 7.0, 5.6, 6.7, 5.6, 2.2, 2.6, 2.0, 6.4, 3.3],
            itemStyle:{
              normal:{
                  color:'#4ad2ff'
              }
          }
        },
      
    ]
};