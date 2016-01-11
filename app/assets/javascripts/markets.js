$(function() {
    // SetUp Currency Mask
    $('input.currency').mask('000.000.000.000.000,00', {reverse: true});
    $('input.formatted_int').mask('000.000.000.000.000', {reverse: true});
});