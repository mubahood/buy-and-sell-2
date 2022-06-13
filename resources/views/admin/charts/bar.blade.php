<?php




$_days = [];
for ($i = 1; $i < 30; $i++) {
    $_days[] = $i;
}
$_data_1 = [];
for ($i = 1; $i < 30; $i++) {
    $_data_1[] = rand(100, 1000);
}
$_data_2 = [];
for ($i = 1; $i < 30; $i++) {
    $_data_2[] = rand(100, 1000);
}

$_data_1 = [];
$_data_2 = [];
$_data_1[] = 10;
$_data_2[] = 15;

$_data_1[] = 13;
$_data_2[] = 12;

$_data_1[] = 13;
$_data_2[] = 12;

$_days = ['Mon', 'Tue', 'Wed', 'Thur'];
//JSON.parse({{ json_encode($_days) }})
?><canvas id="myChart" height="150"></canvas>

<script>
    $(function() {
        var ctx = document.getElementById("myChart").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: JSON.parse('<?= json_encode($_days) ?>'),
                datasets: [{
                        label: 'Inome',
                        data: JSON.parse('<?= json_encode($_data_1) ?>'),
                        borderColor: 'rgba(255,99,132,1)',
                        backgroundColor: 'rgba(255,99,132,1)',
                        borderWidth: 2
                    },
                    {
                        label: 'Expense',
                        data: JSON.parse('<?= json_encode($_data_2) ?>'),
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
