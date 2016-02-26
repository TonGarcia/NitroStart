function setup_campaign_layout() {
    // Base variables setup
    var campaign_card = $('.campaign_body');
    if(campaign_card.length == 0) return;

    // Useless Paragraph remove
    var first_paragraph = $(campaign_card.find('p')[0]);
    if(first_paragraph.html() == "<br>") first_paragraph.remove();

    // Setup Videos Dimensions

    $('iframe').attr('style', 'width: 100%; min-height: 400px;');
}

$(document).ready(setup_campaign_layout);
$(document).on('page:load', setup_campaign_layout);