import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-national-profile',
  templateUrl: './national-profile.component.html',
  styleUrls: ['./national-profile.component.less']
})
export class NationalProfileComponent implements OnInit {

	options = {
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
    legend: {
        orient: 'vertical',
        x: 'right',
        y:'middle',
        data:['上海','北京','广州']
    },
    series: [
        {
            name:'访问来源',
            type:'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[
                {value:45217, name:'上海'},
                {value:27025, name:'北京'},
                {value:9235, name:'广州'}
            ]
        }
    ]
  };

  quateOptions = {
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        }
    },
    legend: {
        data: ['当前实绩', '当前指标']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: {
  
    },
    yAxis: {
        type: 'category',
        data: ['产品I','产品H','产品G','产品F','产品E','产品D','产品C','产品B','产品A']
    },
    series: [
        {
            name: '当前实绩',
            type: 'bar',
            data: [19, 26, 58, 60, 85, 90, 110, 109, 120],
            itemStyle:{
              normal:{
                  color:'#eabd0f'
              }
          }
        },
        {
            name: '当前指标',
            type: 'bar',
            data: [28, 30, 75, 80, 85, 100, 130, 145 ,150],
            itemStyle:{
              normal:{
                  color:'#1bd0a1'
              }
          }
        }
    ]
};

 rateOptions = {
     tooltip: {
         trigger: 'axis',
         axisPointer: {
             type: 'cross',
             crossStyle: {
                 color: '#999'
             }
         }
     },
     legend: {
         data:['指标','实绩','进行率']
     },
     xAxis: [
         {
             type: 'category',
             data: ['TargetH1','1804','1805','1806','1807','1808','1809'],
             axisLabel: {
              interval:0,
              rotate:45
            },
             axisPointer: {
                 type: 'shadow'
             }
         }
     ],
     yAxis: [
         {
             type: 'value',
             name: '销售（千）',
             min: 0,
             max: 2000,
             interval: 500,
             axisLabel: {
                 formatter: '{value}'
             }
         },
         {
             type: 'value',
             name: '进行率',
             min: 0,
             max: 150,
             interval: 50,
             axisLabel: {
                 formatter: '{value} %'
             }
         }
     ],
     series: [
         {
             name:'指标',
             type:'bar',
             data:[1560, 0, 0, 0, 0, 0, 0],
             itemStyle:{
              normal:{
                  color:'#eabd0f'
              }
          }
         },
         {
             name:'实绩',
             type:'bar',
             data:[0, 300, 454, 755, 905, 1230, 1520],
             itemStyle:{
              normal:{
                  color:'#1bd0a1'
              }
          }
         },
         {
             name:'进行率',
             type:'line',
             yAxisIndex: 1,
             data:[0, 14, 29, 45, 60, 77, 96]
         }
     ]
 };

  canvas:any;
  ctx: any;
  circleValue: any;
  constructor() { }

  ngOnInit() {
    this.canvas = document.getElementById("cavas") as HTMLCanvasElement,
    this.ctx = this.canvas.getContext("2d");
    this.circleValue = {
      x : 90,
      y : 100,
      radius : 70,
      startAngle : 1.5*Math.PI,
      endAngle : 1.5*Math.PI,
      anticlockwise : false
    };
    this.drowArc(this.ctx,0.8);

  }



  drowArc(ctx,percent){

    //打底 圆环 绘制
    ctx.lineWidth = 15;
    ctx.beginPath(); 
    var grd = ctx.createRadialGradient(this.circleValue.x, this.circleValue.y, 72, this.circleValue.x, this.circleValue.y, 93);
    grd.addColorStop(0,"#4ad2ff");
    grd.addColorStop("0.8","#4ad2ff");
    grd.addColorStop("1","#4ad2ff");
    ctx.strokeStyle = grd;
    ctx.arc(this.circleValue.x, this.circleValue.y, this.circleValue.radius, this.circleValue.startAngle, this.circleValue.endAngle, this.circleValue.anticlockwise);
    ctx.closePath(); 
    ctx.stroke();

    //展示进度圆环绘制
    ctx.lineWidth = 15;
    ctx.beginPath();
    var linear = ctx.createLinearGradient(100,100,200,100);
    linear.addColorStop(0,'#1bd0a1');
    linear.addColorStop(0.5,'#1bd0a1');
    linear.addColorStop(1,'#1bd0a1');
    ctx.strokeStyle = linear;
    ctx.font="12px Arial";
    //设置文本
    ctx.fillText("当期进行率",this.circleValue.x-30, this.circleValue.y-25);
    ctx.font="35px Arial";
    ctx.fillText("80%",this.circleValue.x-30, this.circleValue.y+15);
    ctx.font="12px Arial";
    ctx.fillText("前同比：102%",this.circleValue.x-38, this.circleValue.y+40);
    ctx.arc(this.circleValue.x, this.circleValue.y, this.circleValue.radius, this.circleValue.startAngle, this.circleValue.endAngle*percent, this.circleValue.anticlockwise);
    ctx.stroke();

    //进度起点圆角
    ctx.beginPath();
    ctx.fillStyle = '#ff8157';
    ctx.arc(this.circleValue.x + this.circleValue.radius, this.circleValue.y - 1, 5.5, this.circleValue.startAngle, this.circleValue.endAngle, this.circleValue.anticlockwise);
    ctx.closePath();
    ctx.fill();
  }
}
