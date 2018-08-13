<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Razvan
 * Date: 4/24/14
 * Time: 12:09 AM
 * To change this template use File | Settings | File Templates.
 */

?>

<?php
$this->widget(
    'ext.highcharts.HighchartsWidget',
    array(
        'options' => array(
            'title'  => array('text' => 'Events started every month'),
            'xAxis'  => array(
                'categories' => array('January', 'February', 'March','April','May','June','July','August','September','October','November','December')
            ),
            'yAxis'  => array(
                'title' => array('text' => 'Events Planned')
            ),
            'allowDecimals' => false,
            'startOnTick' =>true,
            'min' => 0,
            'series' => $startModel
        )
    )
);
?>

<br/>

<?php
$this->widget(
    'ext.highcharts.HighchartsWidget',
    array(
        'options' => array(
            'title'  => array('text' => 'Events finished every month'),
            'xAxis'  => array(
                'categories' => array('January', 'February', 'March','April','May','June','July','August','September','October','November','December')
            ),
            'yAxis'  => array(
                'title' => array('text' => 'Events Planned')
            ),
            'allowDecimals' => false,
            'startOnTick' =>true,
            'min' => 0,
            'series' => $endModel
        ),
        'scripts' => array(
            'modules/exporting', // adds Exporting button/menu to chart
            'themes/grid'        // applies global 'grid' theme to all charts
        ),
    )
);
?>