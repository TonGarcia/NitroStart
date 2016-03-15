function config_redactor() {
    var params;
    var csrf_token = $('meta[name=csrf-token]').attr('content');
    var csrf_param = $('meta[name=csrf-param]').attr('content');

    if (csrf_param !== undefined && csrf_token !== undefined) {
        params = csrf_param + "=" + encodeURIComponent(csrf_token);
    }

    // Config Redactor
    $('.redactor_text').redactor({
        source: false,
        formatting: ['p'],
        formattingAdd: [
            {
                tag: 'blockquote',
                title: 'Citação',
                clear: true
            },

            {
                tag: 'pre',
                title: 'Área Técnica',
                clear: true
            },

            {
                tag: 'h1',
                title: 'Cabeçalho 1',
                clear: true
            },

            {
                tag: 'h2',
                title: 'Cabeçalho 2',
                clear: true
            },

            {
                tag: 'h3',
                title: 'Cabeçalho 3',
                clear: true
            },

            {
                tag: 'h4',
                title: 'Cabeçalho 4',
                clear: true
            },

            {
                tag: 'h5',
                title: 'Cabeçalho 5',
                clear: true
            },
            {
                tag: 'h6',
                title: 'Cabeçalho 6',
                clear: true
            }],
        lang: 'pt_br',
        maxHeight: 800,
        minHeight: 300,
        convertVideoLinks: true,
        convertUrlLinks: true,
        convertImageLinks: false,
        // You can specify, which ones plugins you need.
        // If you want to use plugins, you have add plugins to your
        // application.js and application.css files and uncomment the line below:
        // "plugins": ['fontsize', 'fontcolor', 'fontfamily', 'fullscreen', 'textdirection', 'clips'],
        plugins: ['fontcolor', 'fontfamily', 'video'],
        "imageUpload":"/redactor_rails/pictures?" + params,
        "imageGetJson":"/redactor_rails/pictures",
        "path":"/assets/app",
        "css":"style.css"
    });
};

$(document).on( 'ready page:load', config_redactor );