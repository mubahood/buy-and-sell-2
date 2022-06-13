<div class="table-responsive">
    <canvas id="box_1_chat" width="270px" height="270px"></canvas>
    <br>
    <p>View All</p>
</div>



<script>
    $(function() {

        new Chart(document.getElementById("box_1_chat"), {
            type: 'pie',
            data: {
                labels: ["Pendding", "Missing", "Done"],
                datasets: [{
                    label: "Population (millions)",
                    backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"],
                    data: [2478, 5267, 734]
                }]
            },
            options: {
                title: {
                    display: true,
                    text: 'Predicted world population (millions) in 2050'
                }
            }
        });


    });
</script>
