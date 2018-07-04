var lastNotificationID = null;
var TestApp = {
    initClickTransferButton: function () {
        $('body').on('click', '.js-approve-transfer', function () {
            var amount = $('input[name=slider_user_' + $(this).data('username') + ']').val();
            $.ajax({
                url: $(this).data('url') + amount,
                method: 'GET',
            }).always(function () {
                TestApp.updatePjaxContainers();
            });
        });
    },
    initAjaxListener: function(){
        $(document).ajaxSuccess(function(e, request){
            if(request.responseJSON && request.responseJSON.id){
                if(lastNotificationID !== request.responseJSON.id){
                    TestApp.updatePjaxContainers();
                    lastNotificationID = request.responseJSON.id;
                }
            } else if (request.responseJSON && request.responseJSON[0] && request.responseJSON[0].id) {
                if (lastNotificationID !== request.responseJSON[0].id) {
                    TestApp.updatePjaxContainers();
                    lastNotificationID = request.responseJSON[0].id;
                }
            }
        })
    },
    updatePjaxContainers: function () {
        if ($('.site-error').length === 0) {
            if ($('#menuPjaxContent').length > 0) {
                $.pjax.reload({container: '#menuPjaxContent', async: false});
            }
            if ($('#userPjaxContent').length > 0) {
                $.pjax.reload({container: '#userPjaxContent', async: false});
            }
        }
    },
    init: function () {
        this.initClickTransferButton();
        this.initAjaxListener();
    }
};
$(document).ready(function ($e) {
    TestApp.init();
});