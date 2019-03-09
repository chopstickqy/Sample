import { Component, OnInit } from '@angular/core';
import { EChartOption } from 'echarts';

import { OPTION } from './data'
@Component({
  selector: 'app-cumulative-sales',
  templateUrl: './cumulative-sales.component.html',
  styleUrls: ['./cumulative-sales.component.css']
})
export class CumulativeSalesComponent implements OnInit {
  chartOption: EChartOption = OPTION;

  constructor() { }

  ngOnInit() {
  }

}
