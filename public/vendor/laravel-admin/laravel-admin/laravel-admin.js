$.fn.editable.defaults.params = function(params) {
    params._token = LA.token;
    params._editable = 1;
    params._method = 'PUT';
    return params;
};

$.fn.editable.defaults.error = function(data) {
    var msg = '';
    if (data.responseJSON.errors) {
        $.each(data.responseJSON.errors, function(k, v) {
            msg += v + "\n";
        });
    }
    return msg
};

toastr.options = {
    closeButton: true,
    progressBar: true,
    showMethod: 'slideDown',
    timeOut: 4000
};




$(document).click(function() {
    $('.sidebar-form .dropdown-menu').hide();
});

$(function() {
    $('.sidebar-menu li:not(.treeview) > a').on('click', function() {
        var $parent = $(this).parent().addClass('active');
        $parent.siblings('.treeview.active').find('> a').trigger('click');
        $parent.siblings().removeClass('active').find('li').removeClass('active');
    });
    var menu = $('.sidebar-menu li > a[href$="' + (location.pathname + location.search + location.hash) + '"]').parent().addClass('active');
    menu.parents('ul.treeview-menu').addClass('menu-open');
    menu.parents('li.treeview').addClass('active');

    $('[data-toggle="popover"]').popover();

    // Sidebar form autocomplete
    $('.sidebar-form .autocomplete').on('keyup focus', function() {
        var $menu = $('.sidebar-form .dropdown-menu');
        var text = $(this).val();

        if (text === '') {
            $menu.hide();
            return;
        }

        var regex = new RegExp(text, 'i');
        var matched = false;

        $menu.find('li').each(function() {
            if (!regex.test($(this).find('a').text())) {
                $(this).hide();
            } else {
                $(this).show();
                matched = true;
            }
        });

        if (matched) {
            $menu.show();
        }
    }).click(function(event) {
        event.stopPropagation();
    });

    $('.sidebar-form .dropdown-menu li a').click(function() {
        $('.sidebar-form .autocomplete').val($(this).text());
    });
});

$(window).scroll(function() {
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        $('#totop').fadeIn(500);
    } else {
        $('#totop').fadeOut(500);
    }
});

$('#totop').on('click', function(e) {
    e.preventDefault();
    $('html,body').animate({ scrollTop: 0 }, 500);
});

(function($) {

    var Grid = function() {
        this.selects = {};
    };

    Grid.prototype.select = function(id) {
        this.selects[id] = id;
    };

    Grid.prototype.unselect = function(id) {
        delete this.selects[id];
    };

    Grid.prototype.selected = function() {
        var rows = [];
        $.each(this.selects, function(key, val) {
            rows.push(key);
        });

        return rows;
    };

    $.fn.admin = LA;
    $.admin = LA;
    $.admin.swal = swal;
    $.admin.toastr = toastr;
    $.admin.grid = new Grid();

    $.admin.getToken = function() {
        return $('meta[name="csrf-token"]').attr('content');
    };

    $.admin.loadedScripts = [];

    $.admin.loadScripts = function(arr) {
        var _arr = $.map(arr, function(src) {

            if ($.inArray(src, $.admin.loadedScripts)) {
                return;
            }

            $.admin.loadedScripts.push(src);

            return $.getScript(src);
        });

        _arr.push($.Deferred(function(deferred) {
            $(deferred.resolve);
        }));

        return $.when.apply($, _arr);
    }

})(jQuery);