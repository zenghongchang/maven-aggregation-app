$(function () {
    connect();
    queryMessagesByUser();
    initSortedHead();
    $.ajaxSettings.complete = function (xhr, status) {
        var sessionStatus = xhr.getResponseHeader('sessionstatus');
        if (sessionStatus == 'timeout') {
            window.open("/loginForm", '_blank', '');
        } else if (sessionStatus == 'no_authen') {
            qiao.bs.msg({
                msg: "无权限执行此操作",
                type: 'danger',
                time: 6000
            })
        }
    }
    $.ajaxSettings.error = function (xhr, status, errorThrown) {
        helper.hide_loading();
        var tips = "";
        switch (xhr.status) {
        case (500):
            tips = "服务器系统内部错误";
            break;
        case (401):
            tips = "未登录,请先登录";
            window.open("/loginForm", '_blank', '');
            break;
        case (403):
            tips = "无权限执行此操作";
            break;
        case (408):
            tips = "请求超时";
            break;
        default:
            tips = "未知错误";
        }
        qiao.bs.msg({
            msg: tips,
            type: 'danger',
            time: 60000
        });
    }

    $('#resetFrom').click(function () {
        var formObj = $(this).closest('form');
        var href = formObj.attr('action');
        window.location.href = href;
    })

    $('.sort-title').click(function () {
        var sortedFiledName = $(this).attr("name");
        var sortedRule = $(this).attr("title");
        if (!sortedRule || sortedRule == 1) {
            sortedRule = -1;
        } else {
            sortedRule = 1;
        }
        var inputObj = $(document).find('input[name="sortedFiledName"]');
        inputObj.val(sortedFiledName);

        var formObj = inputObj.closest('form');
        formObj.find('input[name="sortedRule"]').val(sortedRule);
        formObj[0].submit();
    })

    $('.more_action').webuiPopover({
        placement: 'bottom-left',
        width: '150px',
        trigger: 'hover'
    });
    $('.view_popover').webuiPopover({
        placement: 'bottom-right',
        width: '400px',
        trigger: 'hover'
    });
    
    $('.sys_remark').webuiPopover({
        placement: 'bottom-left',
        width: '400px',
        trigger: 'click'
    });
});
function initSortedHead() {
    var sortedObj = $(document).find('input[name="sortedFiledName"]');
    if (sortedObj.length > 0) {
        var sortedFiledName = sortedObj.val();
        if (sortedFiledName) {
            $(document).find('.sort-title').each(function () {
                $this = $(this);
                var name = $this.attr('name');
                if (name == sortedFiledName) {
                    var sortedRule = $this.attr("title");
                    if (sortedRule == 1) {
                        $this.append('<span style = "padding-left:5px;font-size:10px;color:#337ab7" class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span>');
                    } else {
                        $this.append('<span style = "padding-left:5px;font-size:10px;color:#337ab7" class="glyphicon glyphicon-sort-by-attributes-alt" aria-hidden="true"></span>');
                    }
                }
            })
        }
    }
}

function queryMessagesByUser() {
    $.ajax({
        type: 'POST',
        dataType: "json",
        url: "/message/queryMessagesByUser",
        success: function (data) {
            if (data.messageInfos) {
                var messageInfos = data.messageInfos;
                var count = data.count;
                var contentHtml = "";
                if (count > 0) {
                    $.each(messageInfos, function (i, value) {
                        if (i < 3) {
                            contentHtml += "<p>" + value.message + "</p>"
                        } else if (i == 3) {
                            contentHtml += "<p style='text-align:right;'><a href='#'>查看更多  <span style='font-size:18px;'>&raquo;</span></a></p>"
                        }
                    })
                    $('#no_read_message_count').html(count);
                    var contentHtml = "<div style='padding: 9px 14px'>" + contentHtml + "</div>";
                    $('#show_message').webuiPopover({
                        placement: 'bottom-right',
                        width: '400px',
                        trigger: 'hover',
                        content: contentHtml
                    })
                }
            }
        }
    });
}

function edit(url, _target) {
    //window.open(url,'_blank','');
    var actionUrl = url;
    var num = url.indexOf("?");
    if (num != -1) {
        actionUrl = url.substr(0, num);
    }
    if (!_target) {
        _target = "_blank";
    }
    var theRequest = getRequestParam(url);
    openPostWindow(actionUrl, theRequest, _target);
}

function openPostWindow(url, theRequest, _target) {
    var tempForm = document.createElement("form");
    tempForm.id = "tempForm1";
    tempForm.method = "post";
    tempForm.action = url;
    tempForm.target = _target;
    if (theRequest) {
        $.each(theRequest, function (key, val) {
            var hideInput = document.createElement("input");
            hideInput.type = "hidden";
            hideInput.name = key;
            hideInput.value = theRequest[key];
            tempForm.appendChild(hideInput);
        })
    }
    document.body.appendChild(tempForm);
    tempForm.submit();
    document.body.removeChild(tempForm);
}

function getRequestParam(url) {
    var theRequest = new Object();
    var num = url.indexOf("?");
    if (num != -1) {
        var str = url.substr(num + 1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            if (strs[i].indexOf("=") != -1) {
                theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
            }
        }
    }
    return theRequest;
}

function popup(url, title, callback,mystyle,foot) {
    var options = {};
    options.url = url;
    options.title = title;
    options.btn = true;
    if(foot && foot=='false'){
    	options.foot=false;
    }
    if(mystyle){
    	options.mstyle=mystyle;
    }
    qiao.bs.dialog(options, function () {
        executeFunctionName(callback);
    });
}

function popup2(id, url, title, callback, mystyle) {
    var options = {};
    options.url = url;
    options.title = title;
    options.btn = true;
    if (id) {
        options.id = id;
    }
    if(mystyle){
    	options.mstyle=mystyle;
    }
    qiao.bs.dialog(options, function () {
        executeFunctionName(callback);
    });
}

function helperDelete(requestUrl, backUrl, callback) {
    var options = {};
    qiao.bs.confirm("确定要删除吗？", function () {
        $.ajax({
            type: 'POST',
            url: requestUrl,
            dataType: "html",
            cache: false,
            success: function (data) {
                if (_success(data)) {
                    if (callback) {
                        var func = eval(callback);
                        new func(data);
                    }
                    if (backUrl) {
                        //location.href = backUrl;
                    	edit(backUrl,"_parent");
                    }
                }
            }
        });
    });
}

function editFormSubmitBack(formId, requestUrl, backUrl, callback) {
    var params = $("#" + formId).serializeArray();
    $.ajax({
        type: 'POST',
        url: requestUrl,
        data: params,
        dataType: "html",
        cache: false,
        success: function (data) {
            if (_success(data)) {
                if (callback) {
                    var func = eval(callback);
                    new func(data);
                }
                if (backUrl) {
                    if (backUrl.indexOf("location.reload") > -1) {
                        window.location.reload(true);
                    } else {
                        //location.href = backUrl;
                    	edit(backUrl,"_parent");
                    }
                }
            }
        }
    });
}

function _success(text) {
    if (text.toLowerCase().indexOf('success') > 0 || text.indexOf('成功') > 0) {
        qiao.bs.msg({
            msg: text,
            type: 'success',
            time: 3000
        });
        return true;
    } else if (text) {
        qiao.bs.msg({
            msg: text,
            type: 'danger',
            time: 3000
        });
        return false;
    }
}

function _failure() {
    qiao.bs.msg({
        msg: "服务器异常",
        type: 'danger',
        time: 3000
    });
}

function tipsByQiao(text, _type, _time) {
    var type = "danger";
    var time = 3000;
    if (_type) {
        type = _type;
    }
    if (_time) {
        time = _time;
    }
    qiao.bs.msg({
        msg: text,
        type: type,
        time: time
    });
}

function executeFunctionName(functionName) {
    if (functionName) {
        try {
            functionName = eval(functionName);
        } catch (e) {
            console.log(e);
            qiao.bs.msg({
                msg: functionName + '方法不存在！',
                type: 'success',
                time: 3000
            });
        }
        if (typeof functionName === 'function') {
            functionName.call(this);
        }
    }
}

function connect() {
    //var url = "/longpolling?method=onOpen";
    var currentUserName = $('#currentLoginName').val();
    var url = "/longpolling?userId=" + currentUserName;
    $.ajax({
        url: url,
        cache: false,
        dataType: "text",
        success: function (data) {
                connect();
                var now = helper.getNowFormatDate();
                $.notify({
                    icon: 'glyphicon glyphicon-warning-sign',
                    title: "<strong>&nbsp;广播通知：" + now + "</strong>",
                    message: data
                }, {
                    type: 'warning',
                    delay: 0,
                    placement: {
                        from: "bottom",
                        align: "right"
                    },
                    animate: {
                        enter: 'animated fadeInUp',
                        exit: 'animated fadeOutDown'
                    },
                });

            },
            error: function () {

            }
    });
}