import React, { Component } from 'react';
import './App.css';
import { select, event } from 'd3-selection';
import { scaleLinear } from 'd3-scale';
import { brushX } from 'd3-brush';
import { axisBottom } from 'd3-axis';

class Brush extends Component {
  constructor(props) {
    super(props);
    this.createBrush = this.createBrush.bind(this);
  }

  componentDidMount() {
    this.createBrush();
  }

  componentDidUpdate() {
    this.createBrush();
  }

  createBrush() {
    const node = this.node;
    const scale = scaleLinear().domain([0,30])
      .range([0, this.props.size[0]]);

    const dayBrush = brushX()
      .extent([[0,0], this.props.size])
      .on("brush", brushed);

    const dayAxis = axisBottom()
      .scale(scale);

    select(node)
      .selectAll("g.brushaxis")
      .data([0])
      .enter()
      .append("g")
      .attr("class", "brushaxis")
      .attr("transform", "translate(0,25)");

    select(node)
      .select("g.brushaxis")
      .call(dayAxis);

    select(node)
      .selectAll("g.brush")
      .data([0])
      .enter()
      .append("g")
      .attr("class", "brush");

    select(node)
      .select("g.brush")
      .call(dayBrush);

    const brushFn = this.changeBrush;

    function brushed() {
      const selectedExtent = event.selection.map(d => scale.invert(d));
      brushFn(selectedExtent);
    };
  }

  render() {
    return <svg ref={node => this.node = node}
        width={this.props.size[0]} height={50}>
      </svg>
  }
}
export default Brush;
