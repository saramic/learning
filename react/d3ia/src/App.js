import React, { Component } from 'react';
import './App.css';
import BarChart from './BarChart';
import WorldMap from './WorldMap';
import worlddata from './world';
import { range } from 'd3-array';
import { scaleThreshold } from 'd3-scale';
import { geoCentroid } from 'd3-geo';

const appdata = worlddata.features.filter(d => geoCentroid(d)[0] < -20);

appdata.forEach((d,i) => {
  const offset = Math.random();
  d.launchday = i;
  d.data = range(30).map((p,q) => q < i ? 0 : Math.random() * 2 + offset);
});

class App extends Component {
  render() {
    const colorScale = scaleThreshold().domain([5,10,20,30,50])
      .range(["#75739F", "#5EAFC6", "#41A368", "#93C464", "#FE9922"]);
    return (
      <div className="App">
        <div className="App-header">
          <h2>d3ia dashboard</h2>
        </div>
        <div>
          <BarChart colorScale={colorScale} data={appdata} size={[500,500]} />
        </div>
        <div>
          <WorldMap colorScale={colorScale} data={appdata} size={[500,400]} />
        </div>
      </div>
    );
  }
}

export default App;
