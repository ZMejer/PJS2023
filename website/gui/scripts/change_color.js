$(document).ready(function() {
    $('td.change-color').on('click', function() {
        var checkbox = $(this).find('input[type=checkbox]');
        if (checkbox.prop('checked')) {
            checkbox.prop('checked', false);
        } else {
            checkbox.prop('checked', true);
        }
        
        var isChecked = checkbox.is(':checked');
        var cell = $(this);
        if (isChecked) {
            if (cell.hasClass('table-primary')) {
                cell.removeClass('table-primary').addClass('bg-primary');
            } else if (cell.hasClass('table-success')) {
                cell.removeClass('table-success').addClass('bg-success');
            } else if (cell.hasClass('table-warning')) {
                cell.removeClass('table-warning').addClass('bg-warning');
            }
        } else {
            if (cell.hasClass('bg-primary')) {
                cell.removeClass('bg-primary').addClass('table-primary');
            } else if (cell.hasClass('bg-success')) {
                cell.removeClass('bg-success').addClass('table-success');
            } else if (cell.hasClass('bg-warning')) {
                cell.removeClass('bg-warning').addClass('table-warning');
            }
        }
    });
});

$(function () {
    $('[data-toggle="popover"]').popover({
      trigger: 'hover',
      delay: { "show": 500, "hide": 0 }
    })
})