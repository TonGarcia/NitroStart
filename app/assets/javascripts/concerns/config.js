function config_redactor() {
    // Config Redactor
    $('.redactor').redactor({
        source: false,
        formatting: ['p'],
        formattingAdd: [
            {
                tag: 'blockquote',
                title: 'Citar',
                class: 'fontsize-base quote',
                clear: true
            },

            {
                tag: 'p',
                title: 'Cabeçalho 1',
                class: 'fontsize-larger fontweight-semibold',
                clear: true
            },
            {
                tag: 'p',
                title: 'Cabeçalho 2',
                class: 'fontsize-large',
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
        "imageUpload":"/redactor_rails/pictures?",
        "imageGetJson":"/redactor_rails/pictures",
        "path":"/assets/app",
        "css":"style.css"
    });
}