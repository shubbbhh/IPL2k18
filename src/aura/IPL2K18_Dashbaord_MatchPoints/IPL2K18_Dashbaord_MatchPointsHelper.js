({
    setupRadarChart : function(component,message) {
        var action = component.get("c.getDashbaordMatchDetails");
        action.setCallback(this, function(response){
            var state = response.getState();
            //alert('state'+state);            
            var jsonRetVal = JSON.parse(response.getReturnValue()); 
            //alert(jsonRetVal.teamNameStr);
            //alert(jsonRetVal.teamPointsInt);
            var el = component.find('barChart').getElement();
            var ctx = el.getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: jsonRetVal.teamNameStr,
                    datasets: [
                        {
                            label: "Teams",
                            backgroundColor: ["#3e40cd", "#3e40cd","#3cba3f","#e8c3c9","#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                            data: jsonRetVal.teamPointsInt
                        }
                    ]
                },
                options: {
                    legend: { display: true },
                    title: {
                        display: true,
                        text: 'Cricket Actual Team Table'
                    },
                    responsive:true,
                    yAxes: [{
                        ticks: {
                            beginAtZero:true,
                            
                        }
                    }]
                }
            });
        })
        $A.enqueueAction(action);   
        
    }
})