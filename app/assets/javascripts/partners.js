$(function() {
    // Prevent bug
    var earnFormSelector = 'form#partners_earn_calc';
    var earnForm = $(earnFormSelector);
    if(earnForm.length == 0) return;

    // Calc on Type
    $(earnFormSelector + ' input').keyup(function(){
        // Get values
        var earnPercent =  0.02;
        var userMonthInvest = 500;
        var rangeValue = parseInt($('#range_rate').val());
        var conversionValue = parseInt($('#conversion_rate').val().replace('%',''));

        // Prevent Bug if it is not a Number
        if(isNaN(rangeValue) || isNaN(conversionValue)) return;
        if(conversionValue > 100) alert('Use um valor igual ou inferior a 100%');

        // Calc it Profit
        var percentConversionValue = conversionValue/100;
        var profit = rangeValue * percentConversionValue * earnPercent * userMonthInvest;

        // Format & show it up
        var currencyFormattedProfit = accounting.formatMoney(profit, "R$ ", 2, ".", ",");
        $('#earning').html(currencyFormattedProfit);
    });
});