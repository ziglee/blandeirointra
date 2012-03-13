modules = {
    application {
        dependsOn 'jquery'
        resource url:'/js/application.js'
    }

    fullcalendar {
        dependsOn 'jquery'
        resource url:'/css/fullcalendar.css', disposition: 'head'
        resource url:'/js/fullcalendar.js'
    }

    'style' {
        resource url:'/css/main.css'
    }

    overrides {
        'jquery' {
            resource id:'js', url:[dir:'js/jquery', file:"jquery-1.6.4.min.js"]
        }

        'jquery-dev' {
            resource id:'js', url:[dir:'js/jquery', file:"jquery-1.6.4.js"], disposition:'head'
        }
    }

}