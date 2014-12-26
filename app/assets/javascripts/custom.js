/**
 * Created with JetBrains RubyMine.
 * User: G0001959
 * Date: 09/11/13
 * Time: 10:34
 * To change this template use File | Settings | File Templates.
 */
// Activates the Carousel
$('.carousel').carousel({
    interval: 5000
})

// Activates Tooltips for Social Links
$('.tooltip-social').tooltip({
    selector: "a[data-toggle=tooltip]"
})