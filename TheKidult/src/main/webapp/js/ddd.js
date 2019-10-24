const lineGraph = {
    data : [0, 1, 2],
    chartname : [0,1,2],
    width : 500,
    height : 300,
    
    display : () => {
        const data = lineGraph.data;
        const chartname = lineGraph.chartname;
        const width = lineGraph.width;
        const height = lineGraph.height;

        const max = Math.max.apply(null, data);			//최대 값 찾음
        const svg = d3.select('#dddChart')			//svg 태그를 먼저 만들고
            .append('svg')
            .attr('width', width)
            .attr('height', height);
    
        const rect = svg.selectAll('rect')				//svg 안에 rect(사각형) 태그 만들어줌
            .data(data)
            .enter()
            .append('rect')
                .attr('y', '90%')
                .attr('x', (d, i) => ((98 / data.length) * i + 2 + '%')) // 설명 좀	
//                .attr('rx','20')
//                .attr('ry','20')	둥글게둥글게
                .attr('fill', d => {
                    if(d == max) {
                        return 'tomato';
                    }else {
                        return 'steelblue';
                    }
                })
                .attr('width', 80 / data.length + '%')
                .attr('height', 0)
                .transition()
                    .ease(d3.easePoly)
                    .duration(2000)
                    .attr('height', d => ((d / max)) * 90 + '%')
                    .attr('y', d => (90-((d / max)) * 90) + '%');
   
        const text = svg.selectAll('text')
            .data(data)
            .enter()
            .append('text')
                .attr('x', (d, i) => ((98 / data.length) * i + (50 / data.length)+ '%'))
                .attr('y', '60%')
                .attr('text-anchor', 'middle')
                .text(d => (d));
      
        		
        
       const text2 = svg.selectAll('.text2')
        .data(chartname)
        .enter()
        .append('text')
	        .attr('class','text2')
	        .attr('x', (d, i) => ((98 / data.length) * i + (50 / data.length)+ '%'))
	        .attr('y', '96%')
	        .attr('text-anchor', 'middle')
	        .text(d => (d));
        
    }
};