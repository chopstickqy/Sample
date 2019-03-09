import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'app-main',
    templateUrl: './select.component.html',
    styleUrls: ['./select.less']
})
export class SelectComponent implements OnInit {
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
    constructor() { }

    ngOnInit() {
    }

}
