<?php

?><canvas id="myChart" height="165"></canvas>
<a href="#">View All</a>

<script>
    $(function() {
        var ctx = document.getElementById("myChart").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: JSON.parse('<?= json_encode($data['lables']) ?>'),
                datasets: [{
                        label: 'Inome',
                        data: JSON.parse('<?= json_encode($data['income']) ?>'),
                        borderColor: 'rgba(255,99,132,1)',
                        backgroundColor: 'rgba(255,99,132,1)',
                        borderWidth: 2
                    },
                    { 
                        label: 'Expense',
                        data: JSON.parse('<?= json_encode($data['expense']) ?>'),
                        borderColor: 'green',
                        backgroundColor: 'green',
                        borderWidth: 2
                    },
                ]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    });
</script>
